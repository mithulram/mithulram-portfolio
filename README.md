# Mithulram Gunasekaran — Portfolio

Editorial Flutter web portfolio for backend, data, and secure-systems engineering work.

### Live

| Platform | URL |
|---|---|
| Vercel | [mithulram-portfolio.vercel.app](https://mithulram-portfolio.vercel.app) |
| GitHub Pages | [mithulram.github.io/mithulram-portfolio](https://mithulram.github.io/mithulram-portfolio/) |

---

## Sections

- **About** — Evidence-backed capability summary and current toolkit
- **Resume** — Education, experience, skills, and ATS resume download
- **Projects** — Seven current GitHub engineering projects with explicit scope boundaries, including a [live Operations Dashboard demo](https://operations-dashboard-b8v.pages.dev)
- **Certifications** — Professional certifications and additional skills credentials
- **Contact** — Server-backed contact form with direct email fallback

---

## Built with

- Flutter Web + Dart
- Editorial dark design system (Poppins, gold accent, split-shell layout)
- Hash-based in-app navigation (`#about`, `#resume`, `#projects`, `#certifications`, `#contact`)
- Vercel serverless contact endpoint via Resend

---

## Run locally

```bash
git clone https://github.com/mithulram/mithulram-portfolio.git
cd mithulram-portfolio
flutter pub get
flutter run -d chrome
```

Build for web:

```bash
flutter build web --release
```

GitHub Pages build (contact form uses the Vercel API):

```bash
flutter build web --release --base-href "/mithulram-portfolio/" --dart-define=CONTACT_API_URL=https://mithulram-portfolio.vercel.app/api/contact
```

---

## Contact delivery setup (Vercel)

The contact form posts to `/api/contact` on Vercel. Configure these environment variables in the Vercel project before release:

- `RESEND_API_KEY`
- `CONTACT_TO_EMAIL=gmithulram@gmail.com`
- `CONTACT_FROM_EMAIL` (must be a verified Resend sender domain)
- `ALLOWED_ORIGINS=https://mithulram-portfolio.vercel.app,https://mithulram.github.io`

See `.env.example` for variable names only. Never commit real secrets.

GitHub Pages serves the static Flutter build only. Its contact form calls the Vercel endpoint through `CONTACT_API_URL`.

---

## Tests

```bash
dart format .
flutter analyze
flutter test
node --test test/api/contact.test.js
flutter build web --release
```

---

## Contact

gmithulram@gmail.com
