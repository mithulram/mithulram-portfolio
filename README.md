# Mithulram Portfolio

## Getting Started

### Prerequisites

1. **Flutter SDK** — Version 3.22.x or newer. Install from [flutter.dev](https://flutter.dev/docs/get-started/install).
2. **Dart SDK** — Bundled with Flutter.
3. **Git** — For cloning and version control.

### Clone the repository

```bash
git clone https://github.com/<your-username>/<repository>.git
cd <repository>
```

### Install dependencies

```bash
flutter pub get
```

### Run the project locally

```bash
# For web
flutter run -d chrome

# For desktop (macOS / Windows / Linux)
flutter run -d <device-id>

# For Android / iOS simulators
flutter run
```

### Run tests & static analysis

```bash
flutter analyze
flutter test
```

## CI / CD

Two GitHub Actions workflows are provided:

1. **Flutter CI** (`.github/workflows/flutter_ci.yml`) — Lints, analyzes, and tests every push & pull-request targeting `main`.
2. **Deploy Web** (`.github/workflows/deploy_web.yml`) — On every push to `main`, builds the Flutter Web release and publishes the contents of `build/web` to the `gh-pages` branch using `peaceiris/actions-gh-pages`.

After the first successful run, the site will be available at:

```text
https://<your-username>.github.io/<repository>/
```

No extra Personal Access Token is required; the default `GITHUB_TOKEN` is used with `contents: write` permission.

## Environment Variables

For web deployments, EmailJS credentials are hard-coded in `lib/utils/environment.dart` so you **do not** need a `.env` file for production. If you wish to override these locally, create a `.env` file at the project root:

```env
EMAIL_JS_SERVICE_ID=<your-service-id>
EMAIL_JS_TEMPLATE_ID=<your-template-id>
EMAIL_JS_PUBLIC_KEY_ID=<your-public-key>
EMAIL_JS_PRIVATE_KEY_ID=<your-private-key>
EMAIL_JS_NOTIFICATION_TEMPLATE_ID=<your-notification-template-id>
EMAIL_JS_AUTOREPLY_TEMPLATE_ID=<your-autoreply-template-id>
```

## License

MIT © Mithulram
