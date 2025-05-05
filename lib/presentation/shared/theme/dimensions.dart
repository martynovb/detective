import 'package:flutter/material.dart';

class Dimensions {
  static const double maxMobileWidth = minDesktopWidth;
  static const double minDesktopWidth = 1240;
  static const double formWidth = 400;

  static const double menuDesktopHeight = 120;
  static const double menuMobileHeight = 64;
  static const double inputFieldErrorHeight = 20;

  static const double dialogBorderRadius = 0;
}

class AppSpacing {
  const AppSpacing();

  static SizedBox horizontal(double size) => SizedBox(width: size);

  static SizedBox vertical(double size) => SizedBox(height: size);

  static SizedBox get w4 => horizontal(Sizes.s4);

  static SizedBox get w8 => horizontal(Sizes.s8);

  static SizedBox get w16 => horizontal(Sizes.s16);

  static SizedBox get w24 => horizontal(Sizes.s24);

  static SizedBox get w32 => horizontal(Sizes.s32);

  static SizedBox get w40 => horizontal(Sizes.s40);

  static SizedBox get w48 => horizontal(Sizes.s48);

  static SizedBox get h4 => vertical(Sizes.s4);

  static SizedBox get h8 => vertical(Sizes.s8);

  static SizedBox get h12 => vertical(Sizes.s12);

  static SizedBox get h16 => vertical(Sizes.s16);

  static SizedBox get h24 => vertical(Sizes.s24);

  static SizedBox get h32 => vertical(Sizes.s32);

  static SizedBox get h40 => vertical(Sizes.s40);

  static SizedBox get h48 => vertical(Sizes.s48);

  static SizedBox get h56 => vertical(Sizes.s56);

  static SizedBox get h64 => vertical(Sizes.s64);

  static SizedBox get h72 => vertical(Sizes.s72);
}

class Sizes {
  const Sizes();

  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s48 = 48;
  static const double s56 = 56;
  static const double s64 = 64;
  static const double s72 = 72;
  static const double s80 = 80;
}
