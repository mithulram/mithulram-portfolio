import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/homepage/portfolio_view.dart';
import 'package:portfolio/utils/common_strings.dart';

Widget _portfolioTestApp(Widget child) {
  return GetMaterialApp(
    theme: ThemeData.dark(),
    home: Scaffold(body: child),
  );
}

Future<void> openProjectDialog(WidgetTester tester, String coverLabel) async {
  final inkWell = find.ancestor(
    of: find.text(coverLabel),
    matching: find.byType(InkWell),
  );
  await tester.ensureVisible(inkWell.first);
  await tester.tap(inkWell.first);
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('portfolio view shows the live operations demo CTA', (tester) async {
    tester.view.physicalSize = const Size(390, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_portfolioTestApp(const PortfolioView()));
    await tester.pumpAndSettle();

    expect(
      find.text('Ops Monitor — Uptime & Status Pages'),
      findsOneWidget,
    );
    expect(find.text('Open live demo'), findsOneWidget);
    expect(find.text('Data Quality and Lineage Pipeline'), findsOneWidget);
    expect(find.text('Data and reliability'), findsWidgets);
  });

  testWidgets('data and reliability projects remain visible together', (tester) async {
    tester.view.physicalSize = const Size(390, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_portfolioTestApp(const PortfolioView()));
    await tester.pumpAndSettle();

    expect(find.text('Data Quality and Lineage Pipeline'), findsOneWidget);
    expect(
      find.text('Ops Monitor — Uptime & Status Pages'),
      findsOneWidget,
    );
  });

  testWidgets('repository-only project dialog still shows GitHub link', (tester) async {
    tester.view.physicalSize = const Size(390, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_portfolioTestApp(const PortfolioView()));
    await tester.pumpAndSettle();
    await openProjectDialog(tester, 'RupeeRoute');

    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('Frontend repo'), findsNothing);
    expect(find.text('Backend repo'), findsNothing);
  });

  testWidgets('operations project dialog exposes live demo and repo links',
      (tester) async {
    tester.view.physicalSize = const Size(900, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_portfolioTestApp(const PortfolioView()));
    await tester.pumpAndSettle();
    await openProjectDialog(tester, 'Ops Monitor');

    expect(find.text('Open live demo'), findsWidgets);
    expect(find.text('Frontend repo'), findsOneWidget);
    expect(find.text('Backend repo'), findsOneWidget);
  });

  test('featured projects include the live operations stack entry', () {
    final titles = CommonStrings.featuredProjects
        .map((project) => project['title'])
        .toList();

    expect(
      titles,
      contains('Ops Monitor — Uptime & Status Pages'),
    );
    expect(titles, isNot(contains('Operations Dashboard')));
    expect(titles, isNot(contains('Service Health and Incident Monitor')));
  });
}
