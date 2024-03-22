import 'package:flutter/material.dart';

class AppTheme {
  static final lightThemeData = ThemeData(
    fontFamily: 'Poppins',
    primaryTextTheme: const TextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.text80,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.text80,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.linkBlue,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      hintStyle: AppTextStyle.body2.copyWith(
        color: AppColors.hintText,
      ),
      suffixIconColor: AppColors.text,
      filled: true,
      fillColor: AppColors.primaryBlue,
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(width: 1.1, color: AppColors.text),
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.linkBlue;
          }
          return null;
        },
      ),
    ),
  );

  static final darkThemeData = ThemeData(fontFamily: 'Poppins');

  static const primaryGradient = LinearGradient(
    colors: [
      Color(0xff43436b),
      // Color(0xff2a2a42),
      // Color(0xff212134),
      Color(0xff181827),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const secondaryGradient = LinearGradient(
    colors: [
      Color(0xffB9B9B9),
      Color(0xff999999),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class AppColors {
  static const primaryBlue = Color(0xff3D3D60);
  static const text = Color(0xffD8D8D8);
  static final text80 = const Color(0x80D8D8D8).withOpacity(0.8);
  static const hintText = Color(0xff8C8C93);
  static const white = Color(0xffffffff);
  static const linkBlue = Color(0xff0080FF);
  static const black = Color(0x00000000);
  static const black80 = Color(0xff332C2C);

  static const success = Colors.green;
  static const warning = Colors.orange;
  static const info = Colors.grey;
  static const error = Colors.red;
}

class AppTextStyle {
  static TextStyle heading1 = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );
  static TextStyle heading2 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );
  static TextStyle subHeading1 = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static TextStyle subHeading2 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static TextStyle body1 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static TextStyle body2 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    fontFamily: 'Poppins',
  );
  static TextStyle body3 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    fontFamily: 'Poppins',
  );
  static TextStyle caption1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    fontFamily: 'Poppins',
  );
  static TextStyle caption2 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    fontFamily: 'Poppins',
  );
  static TextStyle lead = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
}
