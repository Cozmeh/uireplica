// Light mode colors
import 'package:flutter/material.dart';
import 'package:uireplica/Utils/constants.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Constants.DARK_BACKGROUND),
  colorScheme: ColorScheme.light(
      background: Constants.LIGHT_BACKGROUND,
      primary: Constants.PRIMARY,
      secondary: Constants.SECONDARY,
      surface: Constants.LIGHT_SURFACE),
);

// Dark mode colors
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: Constants.LIGHT_BACKGROUND),
  colorScheme: const ColorScheme.dark(
      background: Constants.DARK_BACKGROUND,
      primary: Constants.PRIMARY,
      secondary: Constants.SECONDARY,
      surface: Constants.DARK_SURFACE),
);