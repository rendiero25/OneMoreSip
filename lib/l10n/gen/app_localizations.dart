import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_id.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('id'),
    Locale('pt'),
  ];

  /// Bottom navbar tab label for the Home screen (UI-03).
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom navbar tab label for the Statistics & history screen (UI-09).
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get navStats;

  /// Bottom navbar tab label for the Family & caregiver screen (UI-12).
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get navFamily;

  /// Bottom navbar tab label for the Me / settings screen (UI-15).
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get navMe;

  /// Screen-reader label for the Sippy mascot in its "fresh" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy looks fresh'**
  String get sippyFresh;

  /// Screen-reader label for the Sippy mascot in its "happy" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy is happy'**
  String get sippyHappy;

  /// Screen-reader label for the Sippy mascot in its "thirsty" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy is a little thirsty'**
  String get sippyThirsty;

  /// Screen-reader label for the Sippy mascot in its "tired" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy is tired'**
  String get sippyTired;

  /// Screen-reader label for the Sippy mascot in its "sleeping" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy is sleeping'**
  String get sippySleeping;

  /// Screen-reader label for the Sippy mascot in its "celebrating" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy is celebrating'**
  String get sippyCelebrating;

  /// Screen-reader label for the Sippy mascot in its "waiting" state (DS-8).
  ///
  /// In en, this message translates to:
  /// **'Sippy is waiting patiently'**
  String get sippyWaiting;

  /// Screen-reader label of the round "+" button in the navbar that opens the log-drink sheet (DS-5 FabLog).
  ///
  /// In en, this message translates to:
  /// **'Log drink'**
  String get fabLogLabel;

  /// Hydration status badge: the user is at or ahead of today's pace (DS-1 status).
  ///
  /// In en, this message translates to:
  /// **'Hydrated'**
  String get statusHydrated;

  /// Hydration status badge: the user is 10-30% behind today's pace (DS-1 status). Friendly, no shame.
  ///
  /// In en, this message translates to:
  /// **'Getting thirsty'**
  String get statusThirsty;

  /// Hydration status badge: the user is more than 30% behind today's pace (DS-1 status). Friendly, no shame.
  ///
  /// In en, this message translates to:
  /// **'Behind'**
  String get statusBehind;

  /// Snackbar action that reverts the drink that was just logged (DS-5 UndoSnackbar).
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// Short label on a native ad card that marks it as an advertisement (F-24). Keep very short.
  ///
  /// In en, this message translates to:
  /// **'Ad'**
  String get adLabel;

  /// Screen-reader label and tooltip of the "..." menu button on an ad card (F-24).
  ///
  /// In en, this message translates to:
  /// **'Ad options'**
  String get adOptions;

  /// Menu item on an ad card to report the ad (F-24).
  ///
  /// In en, this message translates to:
  /// **'Report ad'**
  String get adReport;

  /// AI quota meter: how many uses remain this period (DS-5 QuotaMeter), e.g. "8 left".
  ///
  /// In en, this message translates to:
  /// **'{count} left'**
  String quotaLeft(int count);

  /// AI quota meter: the date the monthly quota resets (DS-5 QuotaMeter), e.g. "Resets Nov 1".
  ///
  /// In en, this message translates to:
  /// **'Resets {date}'**
  String quotaResets(DateTime date);

  /// Screen-reader label of the water glass that shows today's progress (DS-5 ProgressGlass), e.g. "Glass 54% full".
  ///
  /// In en, this message translates to:
  /// **'Glass {percent} full'**
  String progressGlassLabel(String percent);

  /// Disclaimer shown in onboarding, About and AI screens (F-28, SC-03). Calm, no health claims. Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'One More Sip is not a medical device. For questions about your health, talk to your doctor.'**
  String get medicalDisclaimer;

  /// Onboarding/settings question about a doctor's fluid restriction (F-01, F-28), answered Yes/No. Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Has a doctor limited how much you can drink?'**
  String get restrictionQuestion;

  /// Answer to the fluid restriction question: a doctor has set a limit (F-28). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get restrictionYes;

  /// Answer to the fluid restriction question: no doctor's limit (F-28). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get restrictionNo;

  /// Label of the field where the user enters the doctor's daily fluid limit in millilitres (F-28). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Daily limit (ml)'**
  String get restrictionLimitLabel;

  /// Hint under the daily fluid limit field (F-28). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Use the exact amount your doctor gave you.'**
  String get restrictionHint;

  /// Reassurance shown once a fluid limit is entered (F-28, BR-01a). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'We\'ll never ask you to drink more than this.'**
  String get restrictionReassurance;

  /// Validation message when the typed fluid limit is out of range or not a multiple of the step (D-34), e.g. "Enter 500–3,000 ml, in steps of 50 ml.". Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Enter {min}–{max} ml, in steps of {step} ml.'**
  String restrictionInvalid(int min, int max, int step);

  /// Screen-reader label and tooltip of the minus button next to the fluid limit field (F-28). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Decrease by {step} ml'**
  String restrictionDecrease(int step);

  /// Screen-reader label and tooltip of the plus button next to the fluid limit field (F-28). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Increase by {step} ml'**
  String restrictionIncrease(int step);

  /// Gentle note after more than 1,000 ml was logged within 60 minutes (BR-06). Never shames. Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'That\'s a lot in one hour.'**
  String get overDrinkingHourlyTitle;

  /// Second line of the hourly over-drinking note (BR-06). Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Take it easy — sip slowly.'**
  String get overDrinkingHourlyBody;

  /// Title of the warning card when today's total is above the daily threshold or the doctor's limit (BR-06, BR-01a). Never shames. Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'That\'s a lot for one day.'**
  String get overDrinkingDailyTitle;

  /// Body of the daily over-drinking warning card (BR-06). Must keep the advice to talk to a doctor. Non-EN translations are drafts for review in T-130/T-131.
  ///
  /// In en, this message translates to:
  /// **'Go easy for the rest of today. Talk to a doctor if you often feel very thirsty.'**
  String get overDrinkingDailyBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'es', 'id', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'id':
      return AppLocalizationsId();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
