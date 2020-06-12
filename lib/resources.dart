import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class R {
  R._();

  static Brightness _brightness;

  static PingerColors _colors;
  static PingerDimens _dimens;
  static PingerThemes _themes;
  static PingerStyles _styles;

  static PingerColors get colors => _colors;
  static PingerDimens get dimens => _dimens;
  static PingerThemes get themes => _themes;
  static PingerStyles get styles => _styles;

  static bool load(Brightness brightness) {
    if (_brightness == brightness) return false;
    if (brightness == Brightness.dark) {
      R._colors = PingerDarkColors();
      R._themes = PingerDarkThemes();
    } else {
      R._colors = PingerLightColors();
      R._themes = PingerLightThemes();
    }
    R._dimens = PingerDimens();
    R._styles = PingerStyles();
    return true;
  }
}

abstract class PingerColors {
  PingerColors._();

  final primaryDark = const Color(0xFF2F2E41);
  final primary = const Color(0xFF3F3D56);
  final primaryLight = const Color(0xFF575A89);
  final secondary = const Color(0xFFEE6C4D);
  final accent = const Color(0xFFFF6584);
  final grayDark = const Color(0xFF929292);
  final gray = const Color(0xFFC2C2C2);
  final grayLight = const Color(0xFFF2F2F2);

  final canvas = const Color(0xFFFFFFFF);
  final shadow = const Color(0x42000000);
  final none = const Color(0x00FFFFFF);

  final pingSuccessful = const Color(0xFF219653);
  final pingFailed = const Color(0xFFEB5757);
  final pingTotal = const Color(0xFF2F80ED);
  final pingMin = const Color(0xFF219653);
  final pingMean = const Color(0xFFF2C94C);
  final pingMax = const Color(0xFFEB5757);
}

class PingerLightColors extends PingerColors {
  PingerLightColors() : super._();
}

class PingerDarkColors extends PingerColors {
  PingerDarkColors() : super._();

  @override
  final canvas = const Color(0xFF333333);
}

class PingerDimens {
  const PingerDimens();
}

abstract class PingerThemes {
  ThemeMode get mode;

  final app = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    canvasColor: R.colors.canvas,
    cursorColor: R.colors.secondary,
    textSelectionColor: R.colors.primaryLight.withOpacity(0.5),
    textSelectionHandleColor: R.colors.primaryLight,
    primaryColor: R.colors.secondary,
    accentColor: R.colors.secondary,
    hintColor: R.colors.gray,
    textTheme: _textTheme,
    buttonTheme: _buttonTheme,
    appBarTheme: _appbarTheme,
  );

  final raisedButton = _buttonTheme.copyWith(minWidth: 216.0);
  final flatButton = _buttonTheme.copyWith(
    colorScheme: ColorScheme.light(primary: R.colors.gray),
  );

  static ButtonThemeData get _buttonTheme => ButtonThemeData(
        height: 48.0,
        buttonColor: R.colors.secondary,
        colorScheme: ColorScheme.light(primary: R.colors.primary),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      );

  static AppBarTheme get _appbarTheme => AppBarTheme(
        elevation: 0.0,
        color: R.colors.canvas,
        iconTheme: IconThemeData(color: R.colors.primaryLight),
        textTheme: TextTheme(
          headline6: GoogleFonts.orbitron(
            color: R.colors.secondary,
            fontSize: 24.0,
          ),
        ),
      );

  static TextTheme get _textTheme => TextTheme(
        bodyText2: TextStyle(),
        button: TextStyle(fontSize: 18.0),
        subtitle1: TextStyle(color: R.colors.primary),
      ).apply(
        bodyColor: R.colors.primary,
        displayColor: R.colors.primary,
      );
}

class PingerLightThemes extends PingerThemes {
  @override
  ThemeMode get mode => ThemeMode.light;
}

class PingerDarkThemes extends PingerThemes {
  @override
  ThemeMode get mode => ThemeMode.dark;
}

class PingerStyles {
  // Theme references
  TextStyle get textFieldText => R.themes.app.textTheme.subtitle1;
  TextStyle get appBarTitle => R.themes.app.appBarTheme.textTheme.headline6;
  TextStyle get text => R.themes.app.textTheme.bodyText2;

  // Common styles
  TextStyle get chartLabel => TextStyle(fontSize: 12.0, color: R.colors.gray);
  TextStyle get bottomSheetTitle => TextStyle(fontSize: 24.0);
  TextStyle get bottomSheetSubitle =>
      TextStyle(color: R.colors.gray, fontSize: 18.0);
  BorderSide get outlineButtonBorder =>
      BorderSide(color: R.colors.grayLight, width: 1.5);
}
