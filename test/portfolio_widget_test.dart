import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/portfolio_app.dart';
import 'package:portfolio/app/portfolio_controller.dart';
import 'package:portfolio/app/portfolio_shell.dart';
import 'package:portfolio/content/portfolio_content.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/services/contact_service.dart';
import 'package:portfolio/theme/app_theme.dart';

void main() {
  testWidgets('starts on About view with full name', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('About me'), findsOneWidget);
    expect(find.text(PortfolioContent.fullName), findsWidgets);
    expect(find.text('Mithulram G'), findsNothing);
  });

  testWidgets('navigates to every primary view', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    for (final item in PortfolioContent.navItems) {
      await tester.tap(find.text(item.$2).first);
      await tester.pumpAndSettle();
    }

    expect(find.text('Send a message'), findsOneWidget);
  });

  testWidgets('contact form validates invalid input', (tester) async {
    tester.view.physicalSize = const Size(1280, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Contact').first);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Send message'));
    await tester.tap(find.text('Send message'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Enter a name between'), findsOneWidget);
    expect(find.textContaining('Enter a valid email'), findsOneWidget);
    expect(find.textContaining('Enter a message between'), findsOneWidget);
  });

  testWidgets('contact form shows success on valid submission', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildPortfolioTheme(),
        home: Scaffold(
          body: ContactScreen(
            contactService: _FakeContactService(success: true),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Alex Recruiter');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'alex@example.com',
    );
    await tester.enterText(
      find.byType(TextFormField).at(2),
      'Hello, I would like to connect about a backend role.',
    );

    await tester.tap(find.text('Send message'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Thanks'), findsOneWidget);
  });

  testWidgets('desktop layout uses split shell at wide width', (tester) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    final controller = PortfolioController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        theme: buildPortfolioTheme(),
        home: Scaffold(
          body: PortfolioShell(controller: controller),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(PortfolioContent.fullName), findsOneWidget);
    expect(find.text('About me'), findsOneWidget);
  });

  testWidgets('projects filter narrows visible cards', (tester) async {
    tester.view.physicalSize = const Size(1440, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Projects').first);
    await tester.pumpAndSettle();

    expect(find.text('RupeeRoute'), findsOneWidget);
    expect(find.text('Secure Asset Access API'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilterChip, 'Fintech systems'));
    await tester.pumpAndSettle();

    expect(find.text('RupeeRoute'), findsOneWidget);
    expect(find.text('Secure Asset Access API'), findsNothing);
  });
}

class _FakeContactService extends ContactService {
  _FakeContactService({required this.success});

  final bool success;

  @override
  Future<ContactResult> send({
    required String name,
    required String email,
    required String message,
    String? honeypot,
  }) async {
    if (success) {
      return const ContactResult.success();
    }
    return const ContactResult.failure('Failed');
  }
}
