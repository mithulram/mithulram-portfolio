

import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color background = Color(0xFF1E1E1F); // #1E1E1F
  static const Color smokeyBlack = Color(0xFF121212); // #121212
  static const Color bgContainer = Color(0xFF1F1F1E); //
  static const Color lightBlackContainer = Color(0xFF2B2B2C); // #2B2B2C
  static const Color white = Color(0xFFFAFAFA); // #FAFAFA
  static const Color lightGray = Color(0xFFD6D6D6); // #D6D6D6
  static const Color lightGray70 = Color.fromRGBO(214, 214, 214, 0.7); // #D6D6D6 with 70% opacity
  static const Color accent = Color(0xFFFFDB70); // #FFDB70
  static const Color selectionColor = Color(0xFFF7D96A); // #FFDB70
  static const Color accentDark = Color(0xFFCEB15A); // #CEB15A
  static const Color borderColor = Color(0xFF383838); // #383838
  static const linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3D3D44),
      Color(0xFF303030)
    ],
    stops: [0.03, 0.97],
  );
  static const tileLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 64, 64, 64), // #404040, dark gray
      Color.fromARGB(0, 64, 64, 64),   // Transparent dark gray
    ],
    stops: [0.0, 0.5], // Color stops at 0% and 50%
  );
  static const yellowGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF7D96A),
      Color(0xFFF4C35C)
    ],
  );
}