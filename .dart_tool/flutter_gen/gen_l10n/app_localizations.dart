
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
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
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Travelover'**
  String get title;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @authorize.
  ///
  /// In en, this message translates to:
  /// **'Authorize'**
  String get authorize;

  /// No description provided for @loginViaGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login via Google'**
  String get loginViaGoogle;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @nothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing Found'**
  String get nothingFound;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @takeQuizes.
  ///
  /// In en, this message translates to:
  /// **'Take Quizes'**
  String get takeQuizes;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @updateUsername.
  ///
  /// In en, this message translates to:
  /// **'New name'**
  String get updateUsername;

  /// No description provided for @checkKnowladge.
  ///
  /// In en, this message translates to:
  /// **'Check your knowledge'**
  String get checkKnowladge;

  /// No description provided for @needAnIdea.
  ///
  /// In en, this message translates to:
  /// **'Need an idea where to go?'**
  String get needAnIdea;

  /// No description provided for @fav.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get fav;

  /// No description provided for @lookPlace.
  ///
  /// In en, this message translates to:
  /// **'Look at your places'**
  String get lookPlace;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @needFunction.
  ///
  /// In en, this message translates to:
  /// **'Need more functions?'**
  String get needFunction;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @totalScore.
  ///
  /// In en, this message translates to:
  /// **'Question: '**
  String get totalScore;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'LogOut'**
  String get logOut;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @needHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get needHelp;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @currentEmail.
  ///
  /// In en, this message translates to:
  /// **'Current mail'**
  String get currentEmail;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @favPlaces.
  ///
  /// In en, this message translates to:
  /// **'Favourite places'**
  String get favPlaces;

  /// No description provided for @dontHaveFav.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have favourites'**
  String get dontHaveFav;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate the place'**
  String get rate;

  /// No description provided for @comm.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comm;

  /// No description provided for @addComm.
  ///
  /// In en, this message translates to:
  /// **'Add comment'**
  String get addComm;

  /// No description provided for @addYourComm.
  ///
  /// In en, this message translates to:
  /// **'Add your comment'**
  String get addYourComm;

  /// No description provided for @toPay.
  ///
  /// In en, this message translates to:
  /// **'\$60/mounth'**
  String get toPay;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @mounthPlan.
  ///
  /// In en, this message translates to:
  /// **'Mounth plan'**
  String get mounthPlan;

  /// No description provided for @premiumActivation.
  ///
  /// In en, this message translates to:
  /// **'Premium activation'**
  String get premiumActivation;

  /// No description provided for @areYouShure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to activate the premium for \$60 per month?'**
  String get areYouShure;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @successActivation.
  ///
  /// In en, this message translates to:
  /// **'You have successfully activated premium'**
  String get successActivation;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get ok;

  /// No description provided for @premiumSub1.
  ///
  /// In en, this message translates to:
  /// **'Our app has many benefits when you purchase a subscription. One of them is access to comments, where you can leave your impressions of the place, as well as look at reviews from others about the same place.'**
  String get premiumSub1;

  /// No description provided for @premiumSub2.
  ///
  /// In en, this message translates to:
  /// **'Possibility to add the place you like to \'Favorites\', as well as delete it.'**
  String get premiumSub2;

  /// No description provided for @premiumSub3.
  ///
  /// In en, this message translates to:
  /// **'The ability to edit your profile will improve your profile.'**
  String get premiumSub3;

  /// No description provided for @premiumSub4.
  ///
  /// In en, this message translates to:
  /// **'Unlimited access to premium quizzes, as well as the ability to share the result of the quiz on social networks.'**
  String get premiumSub4;

  /// No description provided for @quiz.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quiz;

  /// No description provided for @quizes.
  ///
  /// In en, this message translates to:
  /// **'Quizes'**
  String get quizes;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @dontBeUpset.
  ///
  /// In en, this message translates to:
  /// **'Don\'t be upset! Try again'**
  String get dontBeUpset;

  /// No description provided for @rightWay.
  ///
  /// In en, this message translates to:
  /// **'You are on the right way!'**
  String get rightWay;

  /// No description provided for @goodGob.
  ///
  /// In en, this message translates to:
  /// **'Good job!'**
  String get goodGob;

  /// No description provided for @weelDone.
  ///
  /// In en, this message translates to:
  /// **'Well done! Perfect job!'**
  String get weelDone;

  /// No description provided for @res.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get res;

  /// No description provided for @scored.
  ///
  /// In en, this message translates to:
  /// **'You have scored '**
  String get scored;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'SHARE YOUR RESULTS'**
  String get share;

  /// No description provided for @shapeLink1.
  ///
  /// In en, this message translates to:
  /// **'Look what I got in this test!I scored'**
  String get shapeLink1;

  /// No description provided for @shapeLink2.
  ///
  /// In en, this message translates to:
  /// **'out of 100!I completed this quiz on the incredible Travelover app! Download this app to test your knowledge!'**
  String get shapeLink2;

  /// No description provided for @shareButton.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareButton;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @supportText.
  ///
  /// In en, this message translates to:
  /// **'Our unique TraveLover app invites users to take advantage of our support! Write to us on social networks or by mail what worries you or you notice an error. Our staff will be happy to answer you during the working day. All your suggestions will be heard. Stay with us! '**
  String get supportText;

  /// No description provided for @chooseTheLan.
  ///
  /// In en, this message translates to:
  /// **'Choose the right language'**
  String get chooseTheLan;

  /// No description provided for @chooseLan.
  ///
  /// In en, this message translates to:
  /// **'Choose the language'**
  String get chooseLan;

  /// No description provided for @hintVasya.
  ///
  /// In en, this message translates to:
  /// **'Vasiliy..'**
  String get hintVasya;

  /// No description provided for @changeYourName.
  ///
  /// In en, this message translates to:
  /// **'Change your name'**
  String get changeYourName;

  /// No description provided for @sucessChanged.
  ///
  /// In en, this message translates to:
  /// **'Successfully changed!'**
  String get sucessChanged;

  /// No description provided for @waitApprove.
  ///
  /// In en, this message translates to:
  /// **'Wait till approving'**
  String get waitApprove;

  /// No description provided for @passwordIsReq.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordIsReq;

  /// No description provided for @passwordMustBe.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 digits long'**
  String get passwordMustBe;

  /// No description provided for @emailIsReq.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsReq;

  /// No description provided for @enterCorrectEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter correct email'**
  String get enterCorrectEmail;

  /// No description provided for @nosuchUser.
  ///
  /// In en, this message translates to:
  /// **'No such user'**
  String get nosuchUser;

  /// No description provided for @smthWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get smthWentWrong;

  /// No description provided for @enterCorrectFields.
  ///
  /// In en, this message translates to:
  /// **'Enter correct fields'**
  String get enterCorrectFields;

  /// No description provided for @nameIsReq.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameIsReq;

  /// No description provided for @searching.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searching;

  /// No description provided for @searchAndFind.
  ///
  /// In en, this message translates to:
  /// **'Search and find out...'**
  String get searchAndFind;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
