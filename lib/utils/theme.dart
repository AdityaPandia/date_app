import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3929b8),
      surfaceTint: Color(0xff5449d2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5e54dd),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5d5e65),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff9f7ff),
      onSecondaryContainer: Color(0xff53545b),
      tertiary: Color(0xff5d5f5f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffffff),
      onTertiaryContainer: Color(0xff575859),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(4294768895),
      onBackground: Color(4279966499),
      surface: Color(4294768895),
      onSurface: Color(4279966499),
      surfaceVariant: Color(4293189875),
      onSurfaceVariant: Color(4282860884),
      outline: Color(4286018950),
      outlineVariant: Color(4291347671),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281347896),
      inverseOnSurface: Color(4294176763),
      inversePrimary: Color(4291084543),
      primaryFixed: Color(4293124095),
      onPrimaryFixed: Color(4279369832),
      primaryFixedDim: Color(4291084543),
      onPrimaryFixedVariant: Color(4282068154),
      secondaryFixed: Color(4293059306),
      onSecondaryFixed: Color(4279900961),
      secondaryFixedDim: Color(4291217102),
      onSecondaryFixedVariant: Color(4282730061),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279901212),
      tertiaryFixedDim: Color(4291217095),
      onTertiaryFixedVariant: Color(4282730311),
      surfaceDim: Color(4292663524),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374142),
      surfaceContainer: Color(4293979384),
      surfaceContainerHigh: Color(4293584626),
      surfaceContainerHighest: Color(4293255661),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281804470),
      surfaceTint: Color(4283714002),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284372189),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282466889),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285756540),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282467139),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285756789),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294768895),
      onBackground: Color(4279966499),
      surface: Color(4294768895),
      onSurface: Color(4279966499),
      surfaceVariant: Color(4293189875),
      onSurfaceVariant: Color(4282597712),
      outline: Color(4284439917),
      outlineVariant: Color(4286282121),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281347896),
      inverseOnSurface: Color(4294176763),
      inversePrimary: Color(4291084543),
      primaryFixed: Color(4285161962),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283516624),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285756540),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284177251),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285756789),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284111964),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663524),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374142),
      surfaceContainer: Color(4293979384),
      surfaceContainerHigh: Color(4293584626),
      surfaceContainerHighest: Color(4293255661),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279697531),
      surfaceTint: Color(4283714002),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281804470),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280361512),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282466889),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280296227),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282467139),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294768895),
      onBackground: Color(4279966499),
      surface: Color(4294768895),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293189875),
      onSurfaceVariant: Color(4280492592),
      outline: Color(4282597712),
      outlineVariant: Color(4282597712),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281347896),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293782015),
      primaryFixed: Color(4281804470),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280221849),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282466889),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281019443),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282467139),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281019693),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292663524),
      surfaceBright: Color(4294768895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374142),
      surfaceContainer: Color(4293979384),
      surfaceContainerHigh: Color(4293584626),
      surfaceContainerHighest: Color(4293255661),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291084543),
      surfaceTint: Color(4291084543),
      onPrimary: Color(4280418467),
      primaryContainer: Color(4283779796),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294967295),
      onSecondary: Color(4281282615),
      secondaryContainer: Color(4292137948),
      onSecondaryContainer: Color(4282269510),
      tertiary: Color(4294967295),
      onTertiary: Color(4281282865),
      tertiaryContainer: Color(4292138196),
      onTertiaryContainer: Color(4282269760),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279439899),
      onBackground: Color(4293255661),
      surface: Color(4279439899),
      onSurface: Color(4293255661),
      surfaceVariant: Color(4282860884),
      onSurfaceVariant: Color(4291347671),
      outline: Color(4287729568),
      outlineVariant: Color(4282860884),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255661),
      inverseOnSurface: Color(4281347896),
      inversePrimary: Color(4283714002),
      primaryFixed: Color(4293124095),
      onPrimaryFixed: Color(4279369832),
      primaryFixedDim: Color(4291084543),
      onPrimaryFixedVariant: Color(4282068154),
      secondaryFixed: Color(4293059306),
      onSecondaryFixed: Color(4279900961),
      secondaryFixedDim: Color(4291217102),
      onSecondaryFixedVariant: Color(4282730061),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279901212),
      tertiaryFixedDim: Color(4291217095),
      onTertiaryFixedVariant: Color(4282730311),
      surfaceDim: Color(4279439899),
      surfaceBright: Color(4281940033),
      surfaceContainerLowest: Color(4279110933),
      surfaceContainerLow: Color(4279966499),
      surfaceContainer: Color(4280229671),
      surfaceContainerHigh: Color(4280953138),
      surfaceContainerHighest: Color(4281676861),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291413503),
      surfaceTint: Color(4291084543),
      onPrimary: Color(4279107673),
      primaryContainer: Color(4287136255),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294967295),
      onSecondary: Color(4281282615),
      secondaryContainer: Color(4292137948),
      onSecondaryContainer: Color(4280164133),
      tertiary: Color(4294967295),
      onTertiary: Color(4281282865),
      tertiaryContainer: Color(4292138196),
      onTertiaryContainer: Color(4280164384),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279439899),
      onBackground: Color(4293255661),
      surface: Color(4279439899),
      onSurface: Color(4294900223),
      surfaceVariant: Color(4282860884),
      onSurfaceVariant: Color(4291610843),
      outline: Color(4288979378),
      outlineVariant: Color(4286874002),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255661),
      inverseOnSurface: Color(4280953138),
      inversePrimary: Color(4282133947),
      primaryFixed: Color(4293124095),
      onPrimaryFixed: Color(4278845514),
      primaryFixedDim: Color(4291084543),
      onPrimaryFixedVariant: Color(4280815274),
      secondaryFixed: Color(4293059306),
      onSecondaryFixed: Color(4279177495),
      secondaryFixedDim: Color(4291217102),
      onSecondaryFixedVariant: Color(4281677373),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279177490),
      tertiaryFixedDim: Color(4291217095),
      onTertiaryFixedVariant: Color(4281611831),
      surfaceDim: Color(4279439899),
      surfaceBright: Color(4281940033),
      surfaceContainerLowest: Color(4279110933),
      surfaceContainerLow: Color(4279966499),
      surfaceContainer: Color(4280229671),
      surfaceContainerHigh: Color(4280953138),
      surfaceContainerHighest: Color(4281676861),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294900223),
      surfaceTint: Color(4291084543),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291413503),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294967295),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292137948),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294967295),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292138196),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279439899),
      onBackground: Color(4293255661),
      surface: Color(4279439899),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282860884),
      onSurfaceVariant: Color(4294900223),
      outline: Color(4291610843),
      outlineVariant: Color(4291610843),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255661),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280090769),
      primaryFixed: Color(4293453055),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291413503),
      onPrimaryFixedVariant: Color(4279107673),
      secondaryFixed: Color(4293388015),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291480274),
      onSecondaryFixedVariant: Color(4279571996),
      tertiaryFixed: Color(4293322727),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291480523),
      onTertiaryFixedVariant: Color(4279506711),
      surfaceDim: Color(4279439899),
      surfaceBright: Color(4281940033),
      surfaceContainerLowest: Color(4279110933),
      surfaceContainerLow: Color(4279966499),
      surfaceContainer: Color(4280229671),
      surfaceContainerHigh: Color(4280953138),
      surfaceContainerHighest: Color(4281676861),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
