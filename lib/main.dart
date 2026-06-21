import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/homepage/home_view.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/text_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        return GetMaterialApp(
          title: 'Mithulram Gunasekaran - Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            primaryColor: AppColors.background,
            scaffoldBackgroundColor: AppColors.background,
            canvasColor: AppColors.lightBlackContainer,
            cardColor: AppColors.lightBlackContainer,
            dividerColor: AppColors.borderColor,
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.selectionColor.withValues(alpha: 0.7),
              selectionHandleColor: AppColors.accentDark,
              cursorColor: AppColors.accent,
            ),
            textTheme: size.deviceScreenType == DeviceScreenType.mobile
                ? mobileTextTheme
                : deskTopTextTheme,
            fontFamily: 'Poppins',
          ),
          home: const HomeView(),
        );
      },
    );
  }
}
