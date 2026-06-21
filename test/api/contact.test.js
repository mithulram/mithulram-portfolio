const test = require('node:test');
const assert = require('node:assert/strict');

const contact = require('../../api/contact.js');

function mockRes() {
  const headers = {};
  return {
    headers,
    setHeader(key, value) {
      headers[key] = value;
    },
    statusCode: 200,
    body: null,
    status(code) {
      this.statusCode = code;
      return this;
    },
    json(payload) {
      this.body = payload;
      return this;
    },
    end() {
      return this;
    },
  };
}

test('validatePayload accepts valid input', () => {
  const result = contact.validatePayload({
    name: 'Alex Recruiter',
    email: 'alex@example.com',
    message: 'Hello, I would like to connect about a backend role.',
  });
  assert.equal(result.ok, true);
});

test('validatePayload rejects honeypot', () => {
  const result = contact.validatePayload({
    name: 'Bot',
    email: 'bot@example.com',
    message: 'This is definitely spam content.',
    website: 'https://spam.example',
  });
  assert.equal(result.ok, false);
});

test('validatePayload rejects invalid email', () => {
  const result = contact.validatePayload({
    name: 'Alex',
    email: 'not-an-email',
    message: 'Valid message length here.',
  });
  assert.equal(result.ok, false);
});

test('validatePayload rejects unexpected fields', () => {
  const result = contact.validatePayload({
    name: 'Alex',
    email: 'alex@example.com',
    message: 'Valid message length here.',
    secret: 'nope',
  });
  assert.equal(result.ok, false);
});

test('handler returns 503 when Resend is not configured', async () => {
  const originalFetch = global.fetch;
  global.fetch = async () => ({ ok: true });

  const req = {
    method: 'POST',
    headers: { origin: 'http://localhost:3000' },
    body: {
      name: 'Alex Recruiter',
      email: 'alex@example.com',
      message: 'Hello, I would like to connect about a backend role.',
    },
  };
  const res = mockRes();

  delete process.env.RESEND_API_KEY;
  delete process.env.CONTACT_FROM_EMAIL;

  await contact(req, res);

  assert.equal(res.statusCode, 503);
  assert.match(res.body.error, /not configured/i);

  global.fetch = originalFetch;
});

test('handler sends email when Resend is configured', async () => {
  const originalFetch = global.fetch;
  let capturedBody;
  global.fetch = async (_url, options) => {
    capturedBody = JSON.parse(options.body);
    return { ok: true };
  };

  process.env.RESEND_API_KEY = 'test-key';
  process.env.CONTACT_FROM_EMAIL = 'Portfolio <contact@example.com>';
  process.env.CONTACT_TO_EMAIL = 'gmithulram@gmail.com';

  const req = {
    method: 'POST',
    headers: { origin: 'https://mithulram-portfolio.vercel.app' },
    body: {
      name: 'Alex Recruiter',
      email: 'alex@example.com',
      message: 'Hello, I would like to connect about a backend role.',
    },
  };
  const res = mockRes();

  await contact(req, res);

  assert.equal(res.statusCode, 200);
  assert.equal(capturedBody.to[0], 'gmithulram@gmail.com');
  assert.match(capturedBody.subject, /Alex Recruiter/);

  global.fetch = originalFetch;
});
