# Mithulram G — Portfolio

My personal portfolio, built with Flutter for the web. Covers who I am, what I've built, my experience, certifications, and a contact form that actually works.

### Live

| Platform | URL |
|---|---|
| Vercel | [mithulram-portfolio.vercel.app](https://mithulram-portfolio.vercel.app) |
| GitHub Pages | [mithulram.github.io/mithulram-portfolio](https://mithulram.github.io/mithulram-portfolio/) |

---

## Sections

- **About** — Who I am, my background, and what I do
- **Resume** — Education, work experience, and skills in a timeline layout
- **Projects** — Things I've built, with cover images and descriptions
- **Certificates** — Professional certifications I've earned
- **Contact** — A form that emails me and sends you an auto-reply

---

## Built with

- Flutter Web + Dart
- GetX — state management
- Neumorphic UI design
- EmailJS — contact form + auto-reply emails
- Responsive layout across desktop, tablet, and mobile

---

## Deployments

**Vercel** — primary deployment, served directly from the `build/web` output in this repo. Vercel picks up changes on every push to `main`.

**GitHub Pages** — secondary deployment, built automatically via GitHub Actions on every push to `main`. Uses Flutter 3.35.3 and builds with `--base-href "/mithulram-portfolio/"` to handle the subpath correctly.

Both deployments stay in sync — push once, both update.

---

## Run locally

```bash
git clone https://github.com/mithulram/mithulram-portfolio.git
cd mithulram-portfolio
flutter pub get
flutter run -d chrome
```

To build for web:

```bash
flutter build web --release
```

---

## Contact

gmithulram@gmail.com
