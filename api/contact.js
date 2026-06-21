const ALLOWED_ORIGINS = (process.env.ALLOWED_ORIGINS ||
  'https://mithulram-portfolio.vercel.app,https://mithulram.github.io')
  .split(',')
  .map((origin) => origin.trim())
  .filter(Boolean);

const LOCALHOST_PATTERN = /^http:\/\/localhost(:\d+)?$/;

function setCorsHeaders(req, res) {
  const origin = req.headers.origin;
  if (
    origin &&
    (ALLOWED_ORIGINS.includes(origin) || LOCALHOST_PATTERN.test(origin))
  ) {
    res.setHeader('Access-Control-Allow-Origin', origin);
    res.setHeader('Vary', 'Origin');
  }
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
}

function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) && email.length <= 254;
}

function validatePayload(body) {
  if (!body || typeof body !== 'object' || Array.isArray(body)) {
    return { ok: false, error: 'Invalid request body.' };
  }

  const allowedKeys = new Set(['name', 'email', 'message', 'website']);
  for (const key of Object.keys(body)) {
    if (!allowedKeys.has(key)) {
      return { ok: false, error: 'Unexpected request fields.' };
    }
  }

  if (typeof body.website === 'string' && body.website.trim().length > 0) {
    return { ok: false, error: 'Unable to send your message right now.' };
  }

  const name = typeof body.name === 'string' ? body.name.trim() : '';
  const email = typeof body.email === 'string' ? body.email.trim() : '';
  const message = typeof body.message === 'string' ? body.message.trim() : '';

  if (name.length < 2 || name.length > 80) {
    return { ok: false, error: 'Enter a name between 2 and 80 characters.' };
  }

  if (!isValidEmail(email)) {
    return { ok: false, error: 'Enter a valid email address.' };
  }

  if (message.length < 10 || message.length > 2000) {
    return {
      ok: false,
      error: 'Enter a message between 10 and 2000 characters.',
    };
  }

  return { ok: true, data: { name, email, message } };
}

async function sendWithResend({ name, email, message }) {
  const apiKey = process.env.RESEND_API_KEY;
  const toEmail = process.env.CONTACT_TO_EMAIL || 'gmithulram@gmail.com';
  const fromEmail = process.env.CONTACT_FROM_EMAIL;

  if (!apiKey || !fromEmail) {
    return {
      ok: false,
      error:
        'Contact delivery is not configured yet. Please email gmithulram@gmail.com directly.',
    };
  }

  const response = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: fromEmail,
      to: [toEmail],
      reply_to: email,
      subject: `Portfolio contact from ${name}`,
      text: `Name: ${name}\nEmail: ${email}\n\n${message}`,
    }),
  });

  if (!response.ok) {
    return {
      ok: false,
      error:
        'Unable to send your message right now. Please email gmithulram@gmail.com directly.',
    };
  }

  return { ok: true };
}

module.exports = async function handler(req, res) {
  setCorsHeaders(req, res);

  if (req.method === 'OPTIONS') {
    return res.status(204).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed.' });
  }

  const validation = validatePayload(req.body);
  if (!validation.ok) {
    return res.status(400).json({ error: validation.error });
  }

  const result = await sendWithResend(validation.data);
  if (!result.ok) {
    return res.status(result.error.includes('not configured') ? 503 : 502).json({
      error: result.error,
    });
  }

  return res.status(200).json({ ok: true });
};

module.exports.validatePayload = validatePayload;
module.exports.setCorsHeaders = setCorsHeaders;
module.exports.sendWithResend = sendWithResend;
module.exports.ALLOWED_ORIGINS = ALLOWED_ORIGINS;
