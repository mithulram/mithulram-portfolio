# Mithulram G - Portfolio

A modern, responsive Flutter web portfolio showcasing my professional experience, projects, and skills.

## 🌐 Live Demo

**Website is live at:** [https://mithulram.github.io/mithulram-portfolio/](https://mithulram.github.io/mithulram-portfolio/)

## ✨ Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional design with smooth animations
- **Dark Theme**: Eye-friendly dark theme with accent colors
- **Interactive Sections**:
  - Home with introduction
  - About section with professional summary
  - Portfolio/Projects showcase
  - Resume/Experience timeline
  - Certificates gallery
  - Contact form with EmailJS integration
- **Neumorphic Design**: Modern neumorphic UI elements
- **Flutter Web**: Built with Flutter for smooth performance

## 🛠️ Tech Stack

- **Framework**: Flutter 3.24.5
- **Language**: Dart
- **UI Library**: Flutter Neumorphic Plus
- **State Management**: GetX
- **Email Service**: EmailJS
- **Deployment**: GitHub Pages
- **CI/CD**: GitHub Actions

## 🚀 Deployment

The project is automatically deployed using GitHub Actions whenever changes are pushed to the main branch.

### Deployment URLs:
- **Primary**: [https://mithulram.github.io/mithulram-portfolio/](https://mithulram.github.io/mithulram-portfolio/)
- **Repository**: [https://github.com/mithulram/mithulram-portfolio](https://github.com/mithulram/mithulram-portfolio)

### GitHub Actions Workflow
- Automatically builds Flutter web app
- Deploys to GitHub Pages
- Configured with proper base href for GitHub Pages

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── screens/
│   └── homepage/
│       ├── home_view.dart    # Main home screen
│       ├── about_view.dart   # About section
│       ├── portfolio_view.dart # Projects showcase
│       ├── resume_view.dart  # Experience timeline
│       ├── certificates_view.dart # Certificates gallery
│       └── contact_view.dart # Contact form
├── services/
│   └── analytics_services.dart # Analytics integration
└── utils/
    ├── app_colors.dart       # Color theme
    ├── text_theme.dart       # Typography
    ├── controllers.dart      # GetX controllers
    └── environment.dart      # Environment configuration
```

## 🔧 Local Development

### Prerequisites
- Flutter SDK (3.24.5 or later)
- Dart SDK
- Web browser for testing

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/mithulram/mithulram-portfolio.git
   cd mithulram-portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your EmailJS credentials
   ```

4. **Run the development server**
   ```bash
   flutter run -d chrome
   ```

5. **Build for production**
   ```bash
   flutter build web --base-href "/mithulram-portfolio/"
   ```

## 📧 Contact Form Setup

The contact form uses EmailJS for sending emails. To set it up:

1. Create an account at [EmailJS](https://www.emailjs.com/)
2. Set up an email service (Gmail, Outlook, etc.)
3. Create an email template
4. Update the `.env` file with your credentials:
   ```
   EMAIL_JS_SERVICE_ID=your_service_id
   EMAIL_JS_TEMPLATE_ID=your_template_id
   EMAIL_JS_PUBLIC_KEY_ID=your_public_key
   EMAIL_JS_PRIVATE_KEY_ID=your_private_key
   ```

For detailed setup instructions, see [EMAILJS_SETUP.md](EMAILJS_SETUP.md).

## 🎨 Design Features

- **Responsive Layout**: Adapts to different screen sizes
- **Neumorphic Design**: Soft, modern UI elements
- **Smooth Animations**: Engaging user interactions
- **Professional Typography**: Poppins font family
- **Dark Theme**: Easy on the eyes with accent colors

## 📱 Responsive Breakpoints

- **Desktop**: > 1024px
- **Tablet**: 768px - 1024px
- **Mobile**: < 768px

## 🚀 Performance

- **Tree Shaking**: Optimized bundle size
- **Lazy Loading**: Efficient resource loading
- **Web Optimized**: Fast loading times
- **SEO Friendly**: Proper meta tags and structure

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/mithulram/mithulram-portfolio/issues).

## 📞 Contact

- **Website**: [https://mithulram.github.io/mithulram-portfolio/](https://mithulram.github.io/mithulram-portfolio/)
- **Email**: gmithulram@gmail.com
- **GitHub**: [@mithulram](https://github.com/mithulram)

---

**Status**: ✅ **FULLY DEPLOYED AND WORKING**
- Website is live and accessible
- All sections are functional
- Contact form is integrated
- Responsive design working
- GitHub Actions deployment active
