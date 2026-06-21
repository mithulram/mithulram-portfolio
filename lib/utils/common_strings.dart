class CommonStrings {
  static const myDetails = {
    'email': 'gmithulram@gmail.com',
    'mobile': '+49 170 8834985',
    'address': 'Passau, Germany',
    'german_level': 'German (B1 - Intermediate)',
  };

  static const profileLinks = {
    'portfolio': 'https://mithulram-portfolio.vercel.app/',
    'github': 'https://github.com/mithulram',
    'linkedin': 'https://www.linkedin.com/in/mithulram-g-926ba520a',
    'cv': 'resume/Mithulram_Gunasekaran_ATS_Portfolio_Resume.pdf',
  };

  static const String headline =
      'Software Engineer - Backend, Data & Secure Systems';

  static const String aboutMe =
      'I am Mithulram Gunasekaran, a software engineer and M.Sc. Computer Science student in Germany. I build backend, data, and security-minded software for the places where correctness matters: access decisions, unreliable input, operational signals, and the uncomfortable paths systems need to survive.\n\nAt Xmplar, I spent nearly three years delivering Flutter workflows and backend-integrated product features. That work contributed to a 20% improvement in user engagement and a 3x improvement in data-handling efficiency. More recently, my automotive-cybersecurity research at the University of Passau focused on authentication gaps, ECU communication risks, and structured technical reporting.\n\nI am most useful where clear APIs, testable failure paths, practical documentation, and thoughtful product delivery meet.';

  static const educationMap = [
    {
      'title': 'M.Sc. Computer Science',
      'time': 'University of Passau, Passau, Germany | 2025 - Present',
      'desc': '',
    },
    {
      'title': 'B.E. Computer Science and Information Technology',
      'time': 'SRM University, Chennai, India | 2018 - 2022 | CGPA 7.8/10',
      'desc': '',
    },
  ];

  static const experienceMap = [
    {
      'title': 'Student Research Assistant - Automotive Cybersecurity',
      'time': 'University of Passau (ASOA) | Mar 2025 - Mar 2026',
      'desc':
          'Reviewed 20+ automotive-security sources; documented 15+ vulnerability and failure-mode patterns; prioritized 10+ security and safety risks using likelihood-impact scoring and ECU communication analysis.',
    },
    {
      'title': 'Junior Developer',
      'time': 'Xmplar | Dec 2021 - Aug 2024',
      'desc':
          'Built Flutter and backend-integrated workflows; contributed to 20% higher user engagement and 3x more efficient data handling; implemented Analytics, Crashlytics, notifications, and deep-link/referral flows.',
    },
    {
      'title': 'Backend Intern',
      'time': 'Adpay | May 2020 - Jul 2020',
      'desc':
          'Developed and documented Java and Spring Boot APIs for an Android distributor application.',
    },
  ];

  static const skillGroups = {
    'Languages': ['Java', 'Python', 'TypeScript', 'C++', 'SQL', 'Dart'],
    'Backend and data': [
      'Spring Boot',
      'Spring Security',
      'FastAPI',
      'DuckDB',
      'JPA',
      'REST APIs',
      'data quality',
    ],
    'Frontend and mobile': [
      'React',
      'Flutter',
      'Firebase Analytics',
      'Crashlytics',
      'notifications',
      'deep links',
    ],
    'Cloud and delivery': [
      'Microsoft Azure',
      'Git',
      'GitLab',
      'GitHub Actions',
      'CI/CD',
      'technical documentation',
    ],
    'Security and systems': [
      'Threat modeling',
      'risk scoring',
      'vulnerability analysis',
      'authentication',
      'access control',
      'ECU communication',
    ],
  };

  static const languages = [
    'Tamil (Native)',
    'English (Fluent)',
    'German (B1 - Intermediate)',
  ];

  static const Map<String, String> rupeeRouteApp = {
    'githubUrl': 'https://github.com/mithulram/rupee-route',
    'coverImage': 'assets/images/cover-rupee-route.svg',
    'coverLabel': 'RupeeRoute',
    'coverTagline': 'Remittance Platform',
    'title': 'RupeeRoute',
    'iconUrl': 'assets/svg/javascript.svg',
    'type': 'Fintech systems',
    'about': '''
A sandbox-to-pilot remittance-platform monorepo demonstrating integer money, immutable audit trails, transfer state machines, RBAC operations, and deterministic providers.

**Proof:** 133 Vitest tests; 7 PostgreSQL integration tests; desktop E2E and accessibility smoke coverage.

**Technologies:** TypeScript, NestJS, PostgreSQL, Redis, Next.js, Expo React Native

Sandbox only. No live money, payment rails, settlement, regulatory authorization, or production remittance claim.
''',
  };

  static const Map<String, String> secureAssetApiApp = {
    'githubUrl': 'https://github.com/mithulram/secure-asset-access-api',
    'coverImage': 'assets/images/cover-secure-api.svg',
    'coverLabel': 'Secure API',
    'coverTagline': 'Spring Boot · RBAC',
    'title': 'Secure Asset Access API',
    'iconUrl': 'assets/svg/java.svg',
    'type': 'Backend and security',
    'about': '''
A production-style Java backend demonstrator for classified technical assets, role-based endpoints, audit events, validation, and health checks.

**Proof:** MockMvc security tests cover unauthenticated rejection, role boundaries, validation, audit records, and missing resources.

**Technologies:** Java, Spring Boot, Spring Security, JPA, H2, REST APIs, Actuator, JUnit/MockMvc

Named asset grants are recorded for audit review; runtime asset-level grant evaluation is intentionally out of scope. H2 is local and ephemeral.
''',
  };

  static const Map<String, String> dataPipelineApp = {
    'githubUrl': 'https://github.com/mithulram/data-quality-lineage-pipeline',
    'coverImage': 'assets/images/cover-data-pipeline.svg',
    'coverLabel': 'Data Pipeline',
    'coverTagline': 'Python · DuckDB',
    'title': 'Data Quality and Lineage Pipeline',
    'iconUrl': 'assets/svg/python.svg',
    'type': 'Data and reliability',
    'about': '''
A Python and DuckDB pipeline that validates order batches, quarantines invalid records, enriches valid data, and creates lineage-aware analytical artifacts.

**Proof:** Configurable error-rate gate with quality reports, lineage JSON, CSV, and Parquet outputs.

**Technologies:** Python, DuckDB, SQL, CSV, Parquet, GitHub Actions

Synthetic source data and a local analytical pipeline, not a production warehouse or data catalog.
''',
  };

  static const Map<String, String> healthMonitorApp = {
    'githubUrl': 'https://github.com/mithulram/service-health-incident-monitor',
    'coverImage': 'assets/images/cover-health-monitor.svg',
    'coverLabel': 'Health Monitor',
    'coverTagline': 'FastAPI · SLOs',
    'title': 'Service Health and Incident Monitor',
    'iconUrl': 'assets/svg/python.svg',
    'type': 'Operations and observability',
    'about': '''
A FastAPI monitor that exposes readiness, Prometheus-format metrics, availability SLOs, synthetic error-budget reasoning, and incident context.

**Proof:** HTTP tests prove that a demo fault injection changes error-budget headroom.

**Technologies:** Python, FastAPI, Prometheus text metrics, health endpoints, SLO/error budget, GitHub Actions

Events are synthetic and in memory; SLO/error budget is process-lifetime, not a monthly production measurement.
''',
  };

  static const Map<String, String> automotiveSecurityApp = {
    'githubUrl': 'https://github.com/mithulram/automotive-security-test-bench',
    'coverImage': 'assets/images/cover-auto-security.svg',
    'coverLabel': 'Auto Security',
    'coverTagline': 'Cybersecurity CLI',
    'title': 'Automotive Security Test Bench',
    'iconUrl': 'assets/svg/java.svg',
    'type': 'Automotive cybersecurity',
    'about': '''
A reproducible assessment tool that validates ECU threat scenarios, prioritizes risks with a transparent 5x5 likelihood-impact model, and maps controls to attack categories.

**Proof:** Generates tested JSON and responsive HTML technical-review reports plus an optional CI policy gate.

**Technologies:** Python, typed domain model, CLI, JSON/HTML reports, Docker, GitHub Actions

A portfolio demonstrator inspired by research, not ISO/SAE 21434 compliance, a production vehicle-security product, or a safety case.
''',
  };

  static const Map<String, String> batteryTelemetryApp = {
    'githubUrl':
        'https://github.com/mithulram/battery-telemetry-validation-harness',
    'coverImage': 'assets/images/cover-battery-telemetry.svg',
    'coverLabel': 'Telemetry Harness',
    'coverTagline': 'C++17 · Validation',
    'title': 'Battery Telemetry Validation Harness',
    'iconUrl': 'assets/svg/java.svg',
    'type': 'Automotive validation',
    'about': '''
A deterministic validation gate for synthetic BMS cell telemetry that quarantines malformed, duplicate, out-of-range, and timestamp-invalid readings.

**Proof:** C++17 core with 7 deterministic rules, Python fault injection, CMake/CTest, and CI.

**Technologies:** C++17, CMake, CTest, Python, CSV/JSON, fault injection, GitHub Actions

Synthetic telemetry only; not connected to production vehicle hardware, firmware, or a BMS ECU.
''',
  };

  static const Map<String, String> opsDashboardApp = {
    'githubUrl': 'https://github.com/mithulram/operations-dashboard',
    'coverImage': 'assets/images/cover-ops-dashboard.svg',
    'coverLabel': 'Ops Dashboard',
    'coverTagline': 'React · Metrics',
    'title': 'Operations Dashboard',
    'iconUrl': 'assets/svg/react.svg',
    'type': 'Operations and observability',
    'about': '''
A React dashboard that consumes the service-health monitor API to visualise availability, error-budget headroom, and incident context for engineering review.

**Proof:** Typed API client, responsive layout, and dashboard views wired to live monitor endpoints in local demo mode.

**Technologies:** React, TypeScript, REST API integration

Demo dashboard for the portfolio monitor; not a production NOC or multi-tenant operations product.
''',
  };

  static const Map<String, String> aiLabApp = {
    'githubUrl': 'https://github.com/mithulram/ai-engineering-lab-project',
    'coverImage': 'assets/images/cover-ai-lab.svg',
    'coverLabel': 'AI Lab',
    'coverTagline': 'Object Counting · ML',
    'title': 'AI Engineering Lab — Object Counting',
    'iconUrl': 'assets/svg/python.svg',
    'type': 'AI engineering',
    'about': '''
University of Passau AI Engineering Lab project implementing an object-counting pipeline from image input through model inference, evaluation, and reproducible experiment reporting.

**Proof:** Structured lab workflow with tested preprocessing, inference, and evaluation steps documented for review.

**Technologies:** Python, computer vision, ML pipeline foundations

Academic lab coursework and experimentation, not a production computer-vision product or deployed service.
''',
  };

  static const List<Map<String, String>> featuredProjects = [
    rupeeRouteApp,
    secureAssetApiApp,
    dataPipelineApp,
    healthMonitorApp,
    opsDashboardApp,
    automotiveSecurityApp,
    batteryTelemetryApp,
    aiLabApp,
  ];
}
