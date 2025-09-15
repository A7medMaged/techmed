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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TecMed`
  String get title {
    return Intl.message('TecMed', name: 'title', desc: '', args: []);
  }

  /// `TEC`
  String get appTitle1 {
    return Intl.message('TEC', name: 'appTitle1', desc: '', args: []);
  }

  /// `MED`
  String get appTitle2 {
    return Intl.message('MED', name: 'appTitle2', desc: '', args: []);
  }

  /// `register`
  String get register {
    return Intl.message('register', name: 'register', desc: '', args: []);
  }

  /// `login`
  String get login {
    return Intl.message('login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Create your account`
  String get create_your_account {
    return Intl.message(
      'Create your account',
      name: 'create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? login`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? login',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? register`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? register',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Medication`
  String get medication {
    return Intl.message('Medication', name: 'medication', desc: '', args: []);
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Vaccination`
  String get vaccination {
    return Intl.message('Vaccination', name: 'vaccination', desc: '', args: []);
  }

  /// `Prescriptions`
  String get prescriptions {
    return Intl.message(
      'Prescriptions',
      name: 'prescriptions',
      desc: '',
      args: [],
    );
  }

  /// `View and manage your prescriptions`
  String get view_and_manage_your_vaccination {
    return Intl.message(
      'View and manage your prescriptions',
      name: 'view_and_manage_your_vaccination',
      desc: '',
      args: [],
    );
  }

  /// `View and manage your medications`
  String get view_and_manage_your_medications {
    return Intl.message(
      'View and manage your medications',
      name: 'view_and_manage_your_medications',
      desc: '',
      args: [],
    );
  }

  /// `Today's Medications:`
  String get today_medications {
    return Intl.message(
      'Today\'s Medications:',
      name: 'today_medications',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `female`
  String get female {
    return Intl.message('female', name: 'female', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_your_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get enter_your_phone {
    return Intl.message(
      'Enter your phone',
      name: 'enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your confirm password`
  String get enter_your_confirm_password {
    return Intl.message(
      'Enter your confirm password',
      name: 'enter_your_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your national id`
  String get enter_your_national_id {
    return Intl.message(
      'Enter your national id',
      name: 'enter_your_national_id',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get select_gender {
    return Intl.message(
      'Select Gender',
      name: 'select_gender',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get password_does_not_match {
    return Intl.message(
      'Password does not match',
      name: 'password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get weak_password {
    return Intl.message(
      'Weak password',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found {
    return Intl.message(
      'User not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrong_password {
    return Intl.message(
      'Wrong password',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Wlecome back to TecMed`
  String get wlecome_back_to_TecMed {
    return Intl.message(
      'Wlecome back to TecMed',
      name: 'wlecome_back_to_TecMed',
      desc: '',
      args: [],
    );
  }

  /// `please fill the input below here`
  String get please_fill_the_input_below_here {
    return Intl.message(
      'please fill the input below here',
      name: 'please_fill_the_input_below_here',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_your_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_your_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_your_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone`
  String get please_enter_your_phone {
    return Intl.message(
      'Please enter your phone',
      name: 'please_enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get please_enter_your_confirm_password {
    return Intl.message(
      'Please enter your confirm password',
      name: 'please_enter_your_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your national id`
  String get please_enter_your_national_id {
    return Intl.message(
      'Please enter your national id',
      name: 'please_enter_your_national_id',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Gender`
  String get please_enter_your_gender {
    return Intl.message(
      'Please enter your Gender',
      name: 'please_enter_your_gender',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful`
  String get registration_successful {
    return Intl.message(
      'Registration successful',
      name: 'registration_successful',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_successful {
    return Intl.message(
      'Login successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Logout successful`
  String get logout_successful {
    return Intl.message(
      'Logout successful',
      name: 'logout_successful',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
