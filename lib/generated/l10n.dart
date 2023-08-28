// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello, World!`
  String get helloWorld {
    return Intl.message(
      'Hello, World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the App.`
  String get greeting {
    return Intl.message(
      'Welcome to the App.',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Click me!`
  String get buttonText {
    return Intl.message(
      'Click me!',
      name: 'buttonText',
      desc: '',
      args: [],
    );
  }

  /// `Addition`
  String get addition {
    return Intl.message(
      'Addition',
      name: 'addition',
      desc: '',
      args: [],
    );
  }

  /// `Subtraction`
  String get subtraction {
    return Intl.message(
      'Subtraction',
      name: 'subtraction',
      desc: '',
      args: [],
    );
  }

  /// `Multiplication`
  String get multiplication {
    return Intl.message(
      'Multiplication',
      name: 'multiplication',
      desc: '',
      args: [],
    );
  }

  /// `Division`
  String get division {
    return Intl.message(
      'Division',
      name: 'division',
      desc: '',
      args: [],
    );
  }

  /// `Square`
  String get square {
    return Intl.message(
      'Square',
      name: 'square',
      desc: '',
      args: [],
    );
  }

  /// `Exponential`
  String get exponential {
    return Intl.message(
      'Exponential',
      name: 'exponential',
      desc: '',
      args: [],
    );
  }

  /// `Nth Root`
  String get nthRoot {
    return Intl.message(
      'Nth Root',
      name: 'nthRoot',
      desc: '',
      args: [],
    );
  }

  /// `Percentage`
  String get percentage {
    return Intl.message(
      'Percentage',
      name: 'percentage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
