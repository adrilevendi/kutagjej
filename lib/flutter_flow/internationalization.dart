import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sq'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? sqText = '',
  }) =>
      [enText, sqText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // DetailedProfile
  {
    'pks2mmj1': {
      'en': ' reviews',
      'sq': '',
    },
    'rynszofa': {
      'en': 'Send Message',
      'sq': '',
    },
    '78hcswp8': {
      'en': 'Leave a review',
      'sq': '',
    },
    'f1yjope4': {
      'en': 'Descripcion',
      'sq': 'Pershkrimi',
    },
    'vj2nnfp7': {
      'en': 'Gallery',
      'sq': 'Galería',
    },
    'tt0av5a6': {
      'en': 'Upload',
      'sq': '',
    },
    'y62kzoqa': {
      'en': 'Reviews',
      'sq': '',
    },
    '5zfuzblf': {
      'en': 'Jan. 29',
      'sq': '',
    },
    '5lxifj0i': {
      'en': 'Andrew Daniels',
      'sq': '',
    },
    '57270t7j': {
      'en': 'Jan. 29',
      'sq': '',
    },
    'ji43sri2': {
      'en':
          'Helo helo helo Helo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo helo',
      'sq': '',
    },
    '859zkkth': {
      'en': 'Andrew Daniels',
      'sq': '',
    },
    'j5u23blf': {
      'en': 'Jan. 29',
      'sq': '',
    },
    'jodpj7m9': {
      'en':
          'Helo helo helo Helo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo helo',
      'sq': '',
    },
    'm74jucyq': {
      'en': 'Home',
      'sq': '',
    },
  },
  // FavouriteProfs
  {
    'w39t4lm1': {
      'en': 'Favourites',
      'sq': 'Te perferuar',
    },
    'faytvopi': {
      'en': 'Home',
      'sq': 'Hoe',
    },
  },
  // Search
  {
    'f8ppmmr2': {
      'en': 'Search...',
      'sq': 'Kerko',
    },
    'x5bwgg87': {
      'en': 'Results',
      'sq': 'Rezultate',
    },
    '7wnx4cg4': {
      'en': 'Search',
      'sq': 'Kerko',
    },
  },
  // Motivation--5--
  {
    'kgjv0n3t': {
      'en': 'WATCH THE VIDEO BEFORE GOING TO THE NEXT STEP',
      'sq': '',
    },
    'bndkub9h': {
      'en': 'CONTINUE',
      'sq': 'VAZHDO',
    },
  },
  // paymentConfirm
  {
    "ye6ejsp1": {"en": "Payment Confirmed!", "sq": "Pagesa e Konfirmuar!"},

    '7vtpypja': {
      'en': '\$425.24',
      'sq': '',
    },
    "v8gyntzr": {"en": "Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transaction list.", "sq": "Pagesa juaj është konfirmuar, mund të marrë 1-2 orë për t'u procesuar dhe për t'u shfaqur në listën e transaksioneve."},

    'd7yawxn1': {
      'en': 'Mastercard Ending in 4021',
      'sq': '',
    },
    'lwp51gkp': {
      'en': '\$425.24',
      'sq': '',
    },
    '88pbly9k': {
      'en': 'Go Home',
      'sq': '',
    },
    'quurb5qf': {
      'en': 'Home',
      'sq': '',
    },
  },
  // Auth1
  {
    '8u0p6qqp': {
      'en': 'brand.ai',
      'sq': '',
    },
    'djahv8iq': {
      'en': 'Create Account',
      'sq': '',
    },
    '6wbs31ez': {
      'en': 'Get Started',
      'sq': '',
    },
    '0z9v1veb': {
      'en': 'Create an account by using the form below.',
      'sq': '',
    },
    '7akymx0s': {
      'en': 'Email',
      'sq': '',
    },
    '38hu89qy': {
      'en': 'Password',
      'sq': '',
    },
    '3l74i9k5': {
      'en': 'Or sign up as',
      'sq': '',
    },
    'w6pwc3jm': {
      'en': 'Professional Account',
      'sq': '',
    },
    'othnrjaa': {
      'en': 'Button',
      'sq': '',
    },
    'is38v6f4': {
      'en': 'Log In',
      'sq': '',
    },
    'wuq2qr6x': {
      'en': 'Welcome Back',
      'sq': '',
    },
    '1w2vu3ff': {
      'en': 'Fill out the information below in order to access your account.',
      'sq': '',
    },
    'g7tykmwp': {
      'en': 'Email',
      'sq': '',
    },
    'oyaz8qzb': {
      'en': 'Password',
      'sq': '',
    },
    'mh27hti1': {
      'en': 'Log In',
      'sq': '',
    },
    'l3xn08lf': {
      'en': 'Don\'t have an account?  ',
      'sq': '',
    },
    '3o6a8ibp': {
      'en': 'Create Account',
      'sq': '',
    },
    'i570x8gc': {
      'en': 'Forgot password?',
      'sq': '',
    },
    '03zykcam': {
      'en': 'Home',
      'sq': '',
    },
  },
  // CheckoutForm
  {
    'ir52sjie': {
      'en': 'Checkout',
      'sq': '',
    },
    'h0gukdas': {
      'en': 'Fill in the information below to place your order.',
      'sq': '',
    },
    '880naswj': {
      'en': 'Price Breakdown',
      'sq': '',
    },
    'eplbz8md': {
      'en': 'Base Price',
      'sq': '',
    },
    'q8n8fl0n': {
      'en': '\$156.00',
      'sq': '',
    },
    'rhzxfprs': {
      'en': 'Taxes',
      'sq': '',
    },
    'lhb71kd0': {
      'en': '\$24.20',
      'sq': '',
    },
    'e3fhjnx7': {
      'en': 'Cleaning Fee',
      'sq': '',
    },
    'f9bdpdq6': {
      'en': '\$40.00',
      'sq': '',
    },
    '7emfevgx': {
      'en': 'Total',
      'sq': '',
    },
    'tyx06u8p': {
      'en': '\$230.20',
      'sq': '',
    },
     "b8pbibzh": {"en": "Pay w/ Credit Card", "sq": "Paguaj me Kartë Krediti"},
  "tfgnw40i": {"en": "Or use an option below", "sq": "Ose përdorni një mundësi më poshtë"},
  "z8ri0881": {"en": "Pay w/Paypal", "sq": "Paguaj me Paypal"},
  },
  // Messages
  {
    'zdy2fqhf': {
      'en': 'Below are messages with professionals.',
           'sq': "Më poshtë janë mesazhe me profesionistët.",

    },
    '69n8aq43': {
      'en': 'Randy Mcdonald',
      'sq': '',
    },
    'rgu0twsr': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'sq': '',
    },
    'u77cgk20': {
      'en': 'Mon. July 3rd - 4:12pm',
      'sq': '',
    },
    'oyhjcln2': {
      'en': 'Randy Mcdonald',
      'sq': '',
    },
    '3papcqtj': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'sq': '',
    },
    'lnwntd5s': {
      'en': 'Mon. July 3rd - 4:12pm',
      'sq': '',
    },
    'ajgudyay': {
      'en': '3',
      'sq': '',
    },
    'tvhsjo3r': {
      'en': 'Randy Mcdonald',
      'sq': '',
    },
    '47nxmpld': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'sq': '',
    },
    '6ebxkzfh': {
      'en': 'Mon. July 3rd - 4:12pm',
      'sq': '',
    },
    'if6ets4p': {
      'en': 'My Messages',
      'sq': '',
    },
    '1x0lhkf0': {
      'en': '__',
      'sq': '',
    },
  },
  // INCOMING-CALL
  {
    'wsoxrn14': {
      'en': 'Incoming Call',
      'sq': '',
    },
    '63tnepct': {
      'en': '00:00',
      'sq': '',
    },
    'q23s73s6': {
      'en': '[NAME]',
      'sq': '',
    },
  },
  // CALL
  {
    'ypn5tpts': {
      'en': '[NAME]',
      'sq': '',
    },
    'ov7gwmdh': {
      'en': '[PROFESSION]',
      'sq': '',
    },
  },
  // auth_2_ForgotPassword
  {
    'shjttaj1': {
      'en': 'flow.io',
      'sq': '',
    },
    'kodvz6ek': {
      'en': 'Forgot Password',
      'sq': '',
    },
    'ihjojb3s': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'sq': '',
    },
    'exejwqbn': {
      'en': 'Email',
      'sq': '',
    },
    'li44goux': {
      'en': 'Send Reset Link',
      'sq': '',
    },
    '88bb57yi': {
      'en': 'Home',
      'sq': '',
    },
  },
  // CreateProfile--4--
  {
    'oio5ciju': {
      'en': 'Get Started',
      'sq': '',
    },
    'sru6lihk': {
      'en': 'Adjust the content below to update your profile.',
      'sq': '',
    },
    'xd74z8aw': {
      'en': 'Edit Photo',
      'sq': '',
    },
    '454cnwq5': {
      'en': ' User Name',
      'sq': '',
    },
    'u2z58nb4': {
      'en': 'Location',
      'sq': '',
    },
    'ctepjjw3': {
      'en': 'Description',
      'sq': '',
    },
    'sqwbmdx2': {
      'en': 'Save & Continue',
      'sq': '',
    },
    'kcmurbjn': {
      'en': 'Home',
      'sq': '',
    },
  },
  // Profile--1--
  {
    '1kp9vqjz': {
      'en': 'Your Account',
      'sq': '',
    },
    '49bdpxzr': {
      'en': 'Edit Profile',
      'sq': 'Ndrysho Profilin',
    },
    'qqbzvx3c': {
      'en': 'My Posts',
      'sq': 'Njoftimet e mia',
    },
    'lpzil045': {
      'en': 'Financat',
      'sq': 'Billing'
    },
    'v8jxp2vh': {
      'en': 'Change Password',
      'sq': 'Ndrysho fjalekalimin',
    },
    '2av7eib6': {
      'en': 'Language',
      'sq': 'Gjuha',
    },
    '2o8yzuo6': {
      'en': 'Subscription',
      'sq': 'Subscription',
    },
    'ppbcyrey': {
      'en': 'Switch to Dark Mode',
      'sq': 'Dark Mode',
    },
    '0qg6gb15': {
      'en': 'Switch to Light Mode',
      'sq': 'Light Mode',
    },
    'l06p0svj': {
      'en': 'App Settings',
      'sq': '',
    },
    '4tf7bssu': {
      'en': 'Invite Professional For Discount',
      'sq': 'Ftoni miq per te perfituar ulje',
    },
    '7laat5vd': {
      'en': 'Support',
      'sq': '',
    },
    'ymt187xn': {
      'en': 'Terms of Service',
      'sq': '',
    },
    'syqjj0v5': {
      'en': 'Log Out',
      'sq': 'Log Out',
    },
    'qcml4dzz': {
      'en': 'Profile',
      'sq': 'Profili',
    },
  },
  // EditProfile--2--
  {
    'jmczu8rf': {
      'en': 'Edit Profile',
      'sq': '',
    },
    '8kdv0czi': {
      'en': 'Adjust the content below to update your profile.',
      'sq': '',
    },
    'iux3g7s3': {
      'en': 'Edit Photo',
      'sq': '',
    },
    'i9p9ebqm': {
      'en': ' User Name',
      'sq': '',
    },
    'wtl0dg5c': {
      'en': ' Profession',
      'sq': '',
    },
    'lr9gyqex': {
      'en': 'Phone Number',
      'sq': '',
    },
    '94yb2lh0': {
      'en': 'Option 1',
      'sq': '',
    },
    '0akfjt4k': {
      'en': ' Location',
      'sq': '',
    },
    '5v8cnolc': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'cdx01por': {
      'en': 'Description',
      'sq': '',
    },
    '8lzabq4a': {
      'en': 'Save & Continue',
      'sq': '',
    },
    'cws0vkoq': {
      'en': 'Home',
      'sq': '',
    },
  },
  // CreateProfessionalAcc-3-
  {
    'ithmdff1': {
      'en': 'KU TA GJEJ',
      'sq': '',
    },
    '7dgj2p2a': {
      'en': 'Create Proffessional account.',
      'sq': '',
    },
    '6lepfqxr': {
      'en': 'Create an account by using the form below.',
      'sq': '',
    },
    'keeb31g0': {
      'en': 'Name',
      'sq': '',
    },
    'xe7uhz7k': {
      'en': 'Email',
      'sq': '',
    },
    'yr1gzu28': {
      'en': 'Option 1',
      'sq': '',
    },
    't8j82yj7': {
      'en': 'Proffession',
      'sq': '',
    },
    '2p9c27rb': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'n7boe57j': {
      'en': 'Phone Number',
      'sq': '',
    },
    'h9ugqwpf': {
      'en': 'Password',
      'sq': '',
    },
    'xty7rh8a': {
      'en': 'Referral Code (Optional)',
      'sq': '',
    },
    'vrd7pbsx': {
      'en': 'Continue',
      'sq': '',
    },
    'r25ngkt2': {
      'en': 'Hello World',
      'sq': '',
    },
    'sjtkipuq': {
      'en': 'Home',
      'sq': '',
    },
  },
  // SelectCategory-2-
  {
    'w0dv2a5q': {
      'en':
          'Jeni profesionist qe po kerkoni te rrisni karrieren tuaj? \nApo po kerkoni dicka tjeter...',
      'sq': '',
    },
    'yg2c0erp': {
      'en': 'Select Category:',
      'sq': '',
    },
    'jtpa5yi3': {
      'en': 'Professional',
      'sq': '',
    },
    'zg8u0tuj': {
      'en': 'Looking For..',
      'sq': '',
    },
  },
  // WelcomeScreen-1-
  {
    'd7jqq837': {
      'en': 'Welcome to \"KuTaGjej\"',
      'sq': '',
    },
    'spvu5o9s': {
      'en': 'Aplikacioni ku do te gjeni cdo gje qe ju nevojitet',
      'sq': '',
    },
    '252i5s4n': {
      'en': 'Te gjesh kliente per biznesin tuaj nuk ka qene kurre kaq e lehte',
      'sq': 'Receta te vecanta',
    },
    'irxpvuqx': {
      'en': 'Kompletoni me staf biznesin tuaj per me pak se 1 jave',
      'sq': '',
    },
    'n0jk137o': {
      'en': 'Njoftimet me te lira dhe me shikueshmeri te larte',
      'sq': '',
    },
    'xwnno6jl': {
      'en': 'Start Exploring',
      'sq': 'Fillo te eskplorosh',
    },
    'dsejx1l0': {
      'en': 'ose',
      'sq': '',
    },
    'f8p6x7bm': {
      'en': 'Login',
      'sq': 'Fillo',
    },
    'o0z3lzos': {
      'en': 'Home',
      'sq': '',
    },
  },
  // ForgotPasswordConfirmation
  {
    'trf1dg22': {
      'en': 'flow.io',
      'sq': '',
    },
    'o36qmbrf': {
      'en': 'Email has been sent',
      'sq': 'Emaili u dergua',
    },
    '21koy56y': {
      'en': 'Please check your email to update your password.',
      'sq': 'Kontrolloni emailin per te rivendosur password-in',
    },
    'ldwoggi2': {
      'en': 'Go Back',
      'sq': 'Shko pas',
    },
    'lxwkn7n3': {
      'en': 'Home',
      'sq': 'Home',
    },
  },
  // Home
  {
    'jfrnfxck': {
      'en': 'Hello, ',
      'sq': 'Miresevini, ',
    },
    'v8bbuj3g': {
      'en': 'What are you looking for...',
      'sq': 'Cfare po kerkoni...',
    },
    'vh3917gt': {
      'en': 'Hidraulik',
      'sq': 'Hidraulik',
    },
    'q7fl1qx0': {
      'en': 'Staff\n',
      'sq': 'Staff\n',
    },
    'm7ovcnnw': {
      'en': 'Coming soon',
      'sq': 'Se shpejti',
    },
    'ukajjdcq': {
      'en': 'Bojaxhi',
      'sq': '',
    },
    'hygk1czm': {
      'en': 'Feedback',
      'sq': 'Feedback',
    },
    'x971qhtz': {
      'en': '\"TRUSTED\" \nProfessional',
      'sq': '\"TRUSTED\" \nProfessional',
    },
    'ufpy02fc': {
      'en': 'Become a professional\nwhere people can \nrely on !',
      'sq': '',
    },
    '13aeiowf': {
      'en': 'REAL',
      'sq': 'REAL',
    },
    'm8swomv0': {
      'en': 'ESTATE',
      'sq': 'ESTATE',
    },
    '5sgqwawu': {
      'en': 'COMING\nSOON',
      'sq': 'SE SHPEJTI',
    },
    's7r2c3i8': {
      'en': 'SELL YOUR CAR',
      'sq': 'SHITJE MAKINASH',
    },
    '1jpgz6t0': {
      'en': 'COMING\nSOON!',
      'sq': '',
    },
    '470rwmdk': {
      'en': 'Recommended',
      'sq': 'Te Rekomanduara',
    },
    '151u47hk': {
      'en': 'Home',
      'sq': 'Home',
    },
  },
  // testCreateUserPage
  {
    '9cden3q6': {
      'en': 'Email',
      'sq': '',
    },
    'zwn8c0gc': {
      'en': 'Enter your email',
      'sq': 'Vendosni emailin tuaj.',
    },
    '5kk6fa7g': {
      'en': 'Display Name',
      'sq': 'Emri i plote',
    },
    'ye3dv89r': {
      'en': 'Enter your display name',
      'sq': 'Vendosni emrin tuaj te plote',
    },
    'ie2afq64': {
      'en': 'Password',
      'sq': 'Password',
    },
    'fcjugcbl': {
      'en': 'Enter your password',
      'sq': '',
    },
    'qdmoab44': {
      'en': 'Confirm Password',
      'sq': 'Confirm Password',
    },
    '7os2uf4k': {
      'en': 'Confirm your password',
      'sq': 'Confirm your password',
    },
    'n06flw8e': {
      'en': 'Create User',
      'sq': 'Create User',
    },
  },
  // NjoftimePune2
  {
    'n1ogo7bu': {
      'en': 'Search...',
      'sq': '',
    },
    'avzsynyu': {
      'en': 'Post',
      'sq': 'Posto',
    },
    'jdqapd1l': {
      'en': 'Results',
      'sq': 'Rezultate',
    },
    'f2842vls': {
      'en': 'Home',
      'sq': 'Home',
    },
  },
  // NjoftimSingle
  {
    '7gutatm0': {
      'en': '1 Day - 12 : 34 : 22',
      'sq': '',
    },
    '4wtml42f': {
      'en': 'Description',
      'sq': 'Pershkrimi',
    },
    'j69srszj': {
      'en': 'Send Message',
      'sq': 'Dergo mesazh',
    },
    '5u2ohkt7': {
      'en': 'Edit Post',
      'sq': 'Ndrysho njoftimin',
    },
    'squq3lw1': {
      'en': 'Pay & Publish',
      'sq': 'Paguaj & Publiko',
    },
    's24bjmaw': {
      'en': 'Home',
      'sq': 'Home',
    },
  },
  // Plans
  {
    'thkx6kuo': {
      'en': 'Subscription / Payment',
      'sq': '',
    },
    '2s98omym': {
      'en': 'Your Subscription',
      'sq': 'Abonimi juaj',
    },
    'thqopx66': {
      'en': 'Monthly',
      'sq': '',
    },
    'xol2ofki': {
      'en': 'ALL 1,000/muaj',
      'sq': '',
    },
    '4wygwnrt': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'sq': '',
    },
    'jmi7pme2': {
      'en': 'Other Offers',
      'sq': '',
    },
    '5s0a0pya': {
      'en': 'Annual (kurse 2,000 Leke)',
      'sq': '',
    },
    'sefj30hz': {
      'en': 'ALL 10,000/vit',
      'sq': '',
    },
    '05uo6wui': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'sq': '',
    },
    '2h6ilub1': {
      'en': 'Free Limited Access',
      'sq': '',
    },
    'q5ild3cu': {
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'sq': '',
    },
    '5ldlakku': {
      'en': 'Change Plan',
      'sq': '',
    },
    'pljdrpbg': {
      'en': 'Home',
      'sq': '',
    },
  },
  // TransactionDetails
  {
    '2t27x3l1': {
      'en': 'Recipient',
      'sq': '',
    },
    'yzk48gn2': {
      'en': 'Haily Brown',
      'sq': '',
    },
    'j26imapf': {
      'en': '@brownisthenewblack',
      'sq': '',
    },
    'qe4yzpnk': {
      'en': 'Transaction ID',
      'sq': '',
    },
    'vnjtig1u': {
      'en': 'TXN123456789',
      'sq': '',
    },
    '385xn2vh': {
      'en': 'Date',
      'sq': '',
    },
    't1mkvc6l': {
      'en': 'Fri, Jun 23 - 4:30pm',
      'sq': '',
    },
    '735yqvn9': {
      'en': 'Amount',
      'sq': '',
    },
    'sle5m5de': {
      'en': '\$500.00',
      'sq': '',
    },
    'cj8xov3w': {
      'en': 'Status',
      'sq': '',
    },
    'tccbkp6d': {
      'en': 'Completed',
      'sq': '',
    },
    '5wvk3ioq': {
      'en': 'Payment Method',
      'sq': '',
    },
    '6nnlsids': {
      'en': 'Visa ****1234',
      'sq': '',
    },
    'g5m5bc6b': {
      'en': 'Transaction Breakdown',
      'sq': '',
    },
    '4tas6tet': {
      'en': 'Subtotal',
      'sq': '',
    },
    'ftpr6rnj': {
      'en': '\$480.00',
      'sq': '',
    },
    'jseyqkcz': {
      'en': 'Tax',
      'sq': '',
    },
    '9ey2hnf5': {
      'en': '\$20.00',
      'sq': '',
    },
    'hvfcvk5a': {
      'en': 'Total',
      'sq': '',
    },
    'spubyjo6': {
      'en': '\$500.00',
      'sq': '',
    },
    'cmkgt52o': {
      'en': 'Notes',
      'sq': '',
    },
    'd3gxapxf': {
      'en': 'Transaction for monthly subscription.',
      'sq': '',
    },
    'xoefgznu': {
      'en': 'Report Now',
      'sq': '',
    },
    '6rd6wtys': {
      'en': 'Payment Details',
      'sq': '',
    },
  },
  // SendMedia
  {
    'gg12m6cv': {
      'en': 'Send Media',
      'sq': '',
    },
    '4owayr3h': {
      'en': 'Write a message...',
      'sq': 'Mesazhi...',
    },
    '8nwbr25r': {
      'en': 'Home',
      'sq': '',
    },
  },
  // ViewMedia
  {
    'cymp2kr2': {
      'en':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'sq': '',
    },
    'lutho8nz': {
      'en': 'Home',
      'sq': '',
    },
  },
  // List11Messages
  {
    'oqmpl6wx': {
      'en': 'Below are messages with others.',
      'sq': 'Me poshte jane mesazhet me te tjeret',
    },
    'g725sjit': {
      'en': 'My Messages',
      'sq': 'Mesazhet e mia',
    },
    '4d1gy4y2': {
      'en': 'Messages',
      'sq': '',
    },
  },
  // NewNjoftim
  {
    'gm8ff7m2': {
      'en': 'Title',
      'sq': 'Titulli i njoftimit',
    },
    '1bgvn3iy': {
      'en': 'Name Of Business',
      'sq': 'Emri i Biznesit',
    },
    'raoj48zo': {
      'en': 'Option 1',
      'sq': '',
    },
    '7izyj76g': {
      'en': 'Job position',
      'sq': 'Pozicioni / Lloji punes',
    },
    'h02qvo9u': {
      'en': 'Search for an item...',
      'sq': 'Kerko',
    },
    'v4hfps1e': {
      'en': 'Salary (Euro)',
      'sq': 'Pagesa',
    },
    'etqw5g14': {
      'en': 'Option 1',
      'sq': '',
    },
    'u6x5pkv6': {
      'en': 'Choose city',
      'sq': 'Zgjidh qytetin',
    },
    
  'oe1rqbjg': {
    'en': 'Search for an item...',
    'sq': 'Kërko një artikull...'
  },
  'ol6bm9dp': {
    'en': '1 hour',
    'sq': '1 orë'
  },
  'ndmblibi': {
    'en': '2 hours',
    'sq': '2 orë'
  },
  '2as2hwwy': {
    'en': '3 hours',
    'sq': '3 orë'
  },
  '19f60eme': {
    'en': '4 hours',
    'sq': '4 orë'
  },
  '7r25220u': {
    'en': '5 hours',
    'sq': '5 orë'
  },
  '1kv0i49u': {
    'en': '6 hours',
    'sq': '6 orë'
  },
  'taxt61pp': {
    'en': '7 hours',
    'sq': '7 orë'
  },
  '15t2g73u': {
    'en': '8 hours',
    'sq': '8 orë'
  },
  'eiugurpe': {
    'en': '9 hours',
    'sq': '9 orë'
  },
  '91fzsoxp': {
    'en': '10 hours',
    'sq': '10 orë'
  },
  'bd1ayh9d': {
    'en': 'Shift hours',
    'sq': 'Orët e turnit'
  },
  'c4kvx2oi': {
    'en': 'Search for an item...',
    'sq': 'Kërko një artikull...'
  },
  'ae3kkkvs': {
    'en': 'Turn 1',
    'sq': 'Turni 1'
  },
  '6q5bvlch': {
    'en': 'Turn 2',
    'sq': 'Turni 2'
  },
  'l6o5ky5f': {
    'en': 'Turn 3',
    'sq': 'Turni 3'
  },
  'y8u1jmb5': {
    'en': 'Shift',
    'sq': 'Turn'
  },
  'jai5smje': {
    'en': 'Search for an item...',
    'sq': 'Kërko një artikull...'
  },
  '628hi321': {
    'en': 'Description',
    'sq': 'Përshkrimi'
  },
  'zk1cxpx2': {
    'en': '1 day',
    'sq': '1 ditë'
  },
  'myvy3b4n': {
    'en': '2 days',
    'sq': '2 ditë'
  },
  'igu1a2ju': {
    'en': '3 days',
    'sq': '3 ditë'
  },
  '5qckw1ow': {
    'en': '4 days',
    'sq': '4 ditë'
  },
  'kype3e97': {
    'en': '5 days',
    'sq': '5 ditë'
  },
  '89vj2tz5': {
    'en': '6 days',
    'sq': '6 ditë'
  },
  '6by13azy': {
    'en': '7 days',
    'sq': '7 ditë'
  },
  'aphz3j6k': {
    'en': '8 days',
    'sq': '8 ditë'
  },
  '35p5c63t': {
    'en': '9 days',
    'sq': '9 ditë'
  },
  'qd6bm0ka': {
    'en': 'Duration of the notification',
    'sq': 'Kohëzgjatja e njoftimit'
  },
  'uuksmoik': {
    'en': 'Search for an item...',
    'sq': 'Kërko një artikull...'
  },
  '7kxmfq6z': {
    'en': 'POST THE NOTIFICATION - ',
    'sq': 'POSTO NJOFTIMIN - '
  },
  'p56zvft7': {
    'en': 'ALL',
    'sq': 'TË GJITHA'
  },
  '124v5pi6': {
    'en': 'Home',
    'sq': 'Shtëpia'
  }

  },
  // Affiliate
  {
    'gej8ndpl': {
      'en': 'My Referrals',
      'sq': 'Referimet e tua',
    },
    'q5b6q6t4': {
      'en': 'Home',
      'sq': '',
    },
  },
  // CreateReferal
  {
    'r0t7e0z8': {
      'en': 'Task...',
      'sq': '',
    },
    'tusvuqg4': {
      'en': 'Description...',
      'sq': '',
    },
    'uhyl7ipx': {
      'en': 'Add tags',
      'sq': '',
    },
    'frs320ec': {
      'en': 'Due Date',
      'sq': '',
    },
    'ikambkha': {
      'en': 'Get Started',
      'sq': '',
    },
    'd0h7qrmf': {
      'en': 'Create Task',
      'sq': '',
    },
    '9z4tkgft': {
      'en': 'Please fill out the form below to continue.',
      'sq': '',
    },
    'ndpgwqz5': {
      'en': 'Home',
      'sq': '',
    },
  },
  // Createreferal2
  {
    'pdguazml': {
      'en': 'Share the code',
      'sq': 'Shperndaje kodin',
    },
    '25mp2lba': {
      'en': 'Submit',
      'sq': 'Perfundo',
    },
    '0yl4wf01': {
      'en': 'New Code',
      'sq': 'Kod i ri',
    },
    '8j02r99j': {
      'en': 'Home',
      'sq': '',
    },
  },
  // Billing
  {
    'rhtwvp9m': {
      'en': 'Back',
      'sq': 'Pas',
    },
    'wow6nsn6': {
      'en': 'Cards',
      'sq': '',
    },
    '1ftomnux': {
      'en': 'Add',
      'sq': '',
    },
    '2xr3vj6v': {
      'en': 'Controller Basic',
      'sq': '',
    },
    '1wekb6rp': {
      'en': '\$125.50',
      'sq': '',
    },
    'ejnhx0d3': {
      'en': 'Quanity: 1',
      'sq': '',
    },
    'hba7z4c2': {
      'en': 'Home',
      'sq': '',
    },
  },
  // newCard
  {
    '8bwy1ljz': {
      'en': 'Name on card',
      'sq': '',
    },
    '7q56t5zr': {
      'en': 'Ruaj karten',
      'sq': '',
    },
    'pbziqj56': {
      'en': 'Karte e re',
      'sq': '',
    },
    'gcjtgdf4': {
      'en': 'Home',
      'sq': '',
    },
  },
  // Login1
  {
    'trog371y': {
      'en': 'KU TA GJEJ',
      'sq': '',
    },
    'exlz90nr': {
      'en': 'Welcome Back',
      'sq': 'Miresevini perseri',
    },
    'uvhmk9tj': {
      'en': 'Let\'s get started by filling out the form below.',
      'sq': 'Fillo duke plotesuar fushat me poshte',
    },
    '3wypenjl': {
      'en': 'Email',
      'sq': '',
    },
    'kyvvopus': {
      'en': 'Password',
      'sq': '',
    },
    'n4czop51': {
      'en': 'Sign In',
      'sq': '',
    },
    'wt0mfqz2': {
      'en': 'Don\'t have an account? ',
      'sq': 'Nuk keni llogari?',
    },
    'slr54t74': {
      'en': ' Sign Up here',
      'sq': 'Rregjistrohu ketu',
    },
    'xipjfm1o': {
      'en': 'Home',
      'sq': '',
    },
  },
  // Checkout37
  {
    'ff7zf7r3': {
      'en': 'New Post for',
      'sq': 'Abonim postimi per ',
    },
    'rk955aqs': {
      'en': 'Credit Card',
      'sq': '',
    },
    '1z4h45y6': {
      'en': 'Your Name',
      'sq': 'Emri juaj',
    },
    'gf2ubl43': {
      'en': 'Paypal',
      'sq': '',
    },
    'vpra4r2b': {
      'en': 'Apple Pay',
      'sq': '',
    },
    'lv79q16l': {
      'en': 'Apple Pay',
      'sq': '',
    },
    'itsqqzjq': {
      'en': 'Pay Now',
      'sq': 'Paguaj',
    },
    'i2ie6ai0': {
      'en': 'Pay w/Paypal',
      'sq': '',
    },
    'opkabh8s': {
      'en': 'Subscription',
      'sq': '',
    },
    '8u5vzo9w': {
      'en': 'Home',
      'sq': '',
    },
  },
  // profilePostsList
  {
    'gx78s542': {
      'en': 'check.io',
      'sq': '',
    },
    'em7ng1y5': {
      'en': 'Platform Navigation',
      'sq': '',
    },
    'hniboz54': {
      'en': 'Dashboard',
      'sq': '',
    },
    'bu1seres': {
      'en': 'Chats',
      'sq': '',
    },
    'h817zuhj': {
      'en': 'Projects',
      'sq': '',
    },
    'fbc78woo': {
      'en': 'Recent Orders',
      'sq': '',
    },
    'rcd7lwbd': {
      'en': '12',
      'sq': '',
    },
    'jndvumtk': {
      'en': 'Settings',
      'sq': '',
    },
    'zk0wb7s1': {
      'en': 'Billing',
      'sq': '',
    },
    'm1puri9h': {
      'en': 'Explore',
      'sq': '',
    },
    'e50u5nca': {
      'en': 'Light Mode',
      'sq': '',
    },
    'g0ozdrul': {
      'en': 'Dark Mode',
      'sq': '',
    },
    'tidfwp6r': {
      'en': 'Andrew D.',
      'sq': '',
    },
    '99oxf0e8': {
      'en': 'admin@gmail.com',
      'sq': '',
    },
    '3z7g31g7': {
      'en': 'Filters',
      'sq': '',
    },
    'edyaeh6a': {
      'en': 'Active',
      'sq': '',
    },
    '2e3lqdfy': {
      'en': 'In Progress',
      'sq': '',
    },
    'bksr0zbv': {
      'en': 'Active',
      'sq': '',
    },
    '9z5bhkky': {
      'en': 'ID#: ',
      'sq': '',
    },
    'nhlxseb4': {
      'en': '429242424',
      'sq': '',
    },
    'ltdj2qc5': {
      'en': 'Product Testing',
      'sq': '',
    },
    'vpvkypxr': {
      'en':
          'Conduct comprehensive testing of a new product before its official release. Set up a structured testing plan, define test cases, and assign team members for various testing phases. Document bugs and issues discovered during testing...',
      'sq': '',
    },
    '45e7viqx': {
      'en': 'In Progress',
      'sq': '',
    },
    'baxlxosi': {
      'en': 'ID#: ',
      'sq': '',
    },
    '8s8z0nab': {
      'en': '429242424',
      'sq': '',
    },
    'h1zj8rh9': {
      'en': 'Team Training Workshop',
      'sq': '',
    },
    '1z2ihosc': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'sq': '',
    },
    '4425cwe9': {
      'en': 'Active',
      'sq': '',
    },
    'p3evg5bf': {
      'en': 'ID#: ',
      'sq': '',
    },
    'a6c0n5wt': {
      'en': '429242424',
      'sq': '',
    },
    'hb8pxsdd': {
      'en': 'Budget Planning',
      'sq': '',
    },
    'p4ezjwat': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'sq': '',
    },
    'owwpf8vh': {
      'en': 'Active',
      'sq': '',
    },
    'm4g74ekv': {
      'en': 'ID#: ',
      'sq': '',
    },
    'wuy56nr5': {
      'en': '429242424',
      'sq': '',
    },
    '7m33a1dy': {
      'en': 'Client Onboarding Process',
      'sq': '',
    },
    '6kpvfbrw': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'sq': '',
    },
    'x7dveo94': {
      'en': 'Active',
      'sq': '',
    },
    'u1n2hxjd': {
      'en': 'In Progress',
      'sq': '',
    },
    '2ie5nkbt': {
      'en': 'Njofimet  e mia',
      'sq': '',
    },
    'l3npe5fi': {
      'en': 'Home',
      'sq': '',
    },
  },
  // editNjoftim
  {
    'lvfefi8c': {
      'en': 'Post title',
      'sq': 'Titulli i njoftimit',
    },
    'vs45d3iz': {
      'en': 'Emri i biznesit',
      'sq': 'Name Of Business',
    },
    '72ev2duw': {
      'en': 'Option 1',
      'sq': '',
    },
    '2ipr60bj': {
      'en': 'Job position',
      'sq': 'Pozicioni / Lloji punes',
    },
    'ou85vsxn': {
      'en': 'Search for an item...',
      'sq': 'Kerko',
    },
    'p0gqmwha': {
      'en': 'Salary (Euro)',
      'sq': 'Paga (Euro)',
    },
    '1l30rtpa': {
      'en': 'Option 1',
      'sq': '',
    },
    '0xl34dzt': {
      'en': 'Choose city',
      'sq': 'Zgjidh qytetin',
    },
    '24fut04y': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'jov0yccc': {
      'en': '1 ore',
      'sq': '',
    },
    '99w96fj0': {
      'en': '2 ore',
      'sq': '',
    },
    'uaeji00w': {
      'en': '3 ore',
      'sq': '',
    },
    'ia1wb7ws': {
      'en': '4 ore ',
      'sq': '',
    },
    'o7tkw61p': {
      'en': '5 ore',
      'sq': '',
    },
    '4ibcyifo': {
      'en': '6 ore',
      'sq': '',
    },
    '4ja3319q': {
      'en': '7 ore',
      'sq': '',
    },
    '631ku4hv': {
      'en': '8 ore',
      'sq': '',
    },
    'wj6o4ajb': {
      'en': '9 ore',
      'sq': '',
    },
    '48rqbk9w': {
      'en': '10 ore',
      'sq': '',
    },
    'uq8yj2w3': {
      'en': 'Shift',
      'sq': '',
    },
    '1lkk06ei': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'x9xz86y0': {
      'en': 'Turni 1',
      'sq': '',
    },
    'v9l216rv': {
      'en': 'Turni 2',
      'sq': '',
    },
    'z7c4sols': {
      'en': 'Turni 3',
      'sq': '',
    },
    'yl11tmzg': {
      'en': 'Shift',
      'sq': '',
    },
    '00gdq02y': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'kgjf42mn': {
      'en': 'Description',
      'sq': '',
    },
    'xvn79lns': {
      'en': '1 dite',
      'sq': '',
    },
    '0ialvkkz': {
      'en': '2 dite',
      'sq': '',
    },
    'qkwaua7w': {
      'en': '3 dite',
      'sq': '',
    },
    '6m2hbqia': {
      'en': '4 dite',
      'sq': '',
    },
    'wsq3ammd': {
      'en': '5 dite',
      'sq': '',
    },
    '4sn1h9tc': {
      'en': '6 dite',
      'sq': '',
    },
    'lnbzqad6': {
      'en': '7 dite',
      'sq': '',
    },
    'h578upwt': {
      'en': '8 dite',
      'sq': '',
    },
    'fp62larv': {
      'en': '9 dite',
      'sq': '',
    },
    's6y6k2ze': {
      'en': 'Kohezgjatja  e njofitmit',
      'sq': '',
    },
    'a04fs5wj': {
      'en': 'Search for an item...',
      'sq': '',
    },
    '52kb45pr': {
      'en': 'Edit Post',
      'sq': 'NDRYSHO NJOFTIMIN',
    },
    'snq2pz4x': {
      'en': 'Home',
      'sq': '',
    },
  },
  // freeTrial
  {
    'oo9kj768': {
      'en': 'Reklamoni bisnesin tuaj per vetem ALL99/muaj',
      'sq': 'Advertise your business only for ALL 99/mo.',
    },
    '2av8dyc0': {
      'en':
          'Stepping up your career or business is in your hands. For the first 45 days you will be able to try the app for only ALL100.',
      'sq': '',
    },
    'py5fq08b': {
      'en': 'APPLY NOW !',
      'sq': 'APLIKONI TANI !',
    },
    '4v3klkud': {
      'en': 'Home',
      'sq': '',
    },
  },
  // editProfile
  {
    'xkdbtgjl': {
      'en': 'Edit Profile',
      'sq': 'Edit Profile',
    },
    'dll65idv': {
      'en': 'Adjust the content below to update your profile.',
      'sq': '',
    },
    '6gtk2ns9': {
      'en': 'Change Photo',
      'sq': '',
    },
    'hinmkgg7': {
      'en': 'Full Name',
      'sq': '',
    },
    's0cc35fs': {
      'en': 'Your full name...',
      'sq': '',
    },
    '5aerw5l1': {
      'en': 'Durres',
      'sq': '',
    },
    'l6sdgyyx': {
      'en': 'Tirana',
      'sq': '',
    },
    'cew3xlbi': {
      'en': 'Elbasan',
      'sq': '',
    },
    'r8lcxjkz': {
      'en': 'Vlora',
      'sq': '',
    },
    '9pmpul4w': {
      'en': 'Shkoder',
      'sq': '',
    },
    '0qhj1jc9': {
      'en': 'Durres',
      'sq': '',
    },
    'vkh9qnhc': {
      'en': 'Location',
      'sq': '',
    },
    '95rcvpg4': {
      'en': 'Search for an item...',
      'sq': '',
    },
    '35xpb02k': {
      'en': 'Short Description',
      'sq': '',
    },
    'yi91juka': {
      'en': 'A little about you...',
      'sq': '',
    },
    'z6bs6qqi': {
      'en': '[bio]',
      'sq': '',
    },
  },
  // ChangeLanguage
  {
    '6l62sxvj': {
      'en': 'Select Language:',
      'sq': 'Zgjidh gjuhen',
    },
    'apyxtuo6': {
      'en': 'English',
      'sq': 'Anglisht',
    },
    '5p4tae0f': {
      'en': 'Albanian',
      'sq': 'Shqip',
    },
    '5mtt2a3y': {
      'en': 'Language',
      'sq': 'Gjuha',
    },
    'mvm1tivv': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'hpxgk760': {
      'en': '  Save  ',
      'sq': 'Ruaj',
    },
  },
  // RatingModal
  {
    'v3rqxilw': {
      'en': 'Write your feedback...',
      'sq': 'Shkruani pershtypjet tuaja...',
    },
    'vmviczb2': {
      'en': 'Rate',
      'sq': '',
    },
  },
  // reviewComment
  {
    'y2s0rmea': {
      'en': 'Andrew Daniels',
      'sq': '',
    },
    '3t2ete1j': {
      'en': 'Tuesday, Feb 19',
      'sq': '',
    },
    'thbsolzh': {
      'en':
          'Helo helo helo Helo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo heloHelo helo helo',
      'sq': '',
    },
  },
  // ProfSnippet
  {
    'jvgai793': {
      'en': '4,5',
      'sq': '',
    },
    '5xh3a9um': {
      'en': '[profession name]',
      'sq': '',
    },
    'bbiyqefn': {
      'en': '[Location]',
      'sq': '',
    },
    'yhbtl7x8': {
      'en':
          'Hello World Hello World Hello World Hello World Hello World Hello World Hello World ',
      'sq': '',
    },
  },
  // FeedbackModal
  {
    'c4wsgi7d': {
      'en': 'Jepni pershtypjet tuaja',
      'sq': 'Choose Category',
    },
    '47oea1pj': {
      'en': 'Write your feedback...',
      'sq': '',
    },
    'vdgnv7pr': {
      'en': 'Submit',
      'sq': '',
    },
  },
  // emptyList
  {
    'zm0a2y2i': {
      'en': 'No Activity',
      'sq': '',
    },
    'iepax3oz': {
      'en': 'It seems that you don\'t have any recent activity.',
      'sq': '',
    },
  },
  // postTease
  {
    '45xrvosa': {
      'en': ' - ',
      'sq': '',
    },
    'zcc8gba7': {
      'en': '400-800',
      'sq': '',
    },
    '45riosft': {
      'en': '1 Day',
      'sq': '',
    },
  },
  // profFeaturedTease
  {
    'mbef9ave': {
      'en': '[Location]',
      'sq': '',
    },
  },
  // FilterSidebar
  {
    'ddwh7sfy': {
      'en': 'Filter Results',
      'sq': 'Filtro Rezultatet',
    },
    'j9lgcojy': {
      'en': 'Reset',
      'sq': '',
    },
    '3ej3piiv': {
      'en': 'Choose city...',
      'sq': 'Zgjidh qytetin...',
    },
    '52b3m91q': {
      'en': 'Search for an item...',
      'sq': '',
    },
    '2dnsgrvo': {
      'en': 'Zgjidh qytetin...',
      'sq': '',
    },
    'zci5m1kx': {
      'en': 'Search for an item...',
      'sq': '',
    },
    'bsrmmig1': {
      'en': 'Zgjidh profesionin..',
      'sq': '',
    },
    'jizlss2u': {
      'en': 'Search for an item...',
      'sq': '',
    },
  },
  // NjoftimTease
  {
    'cokbrvx0': {
      'en': '6 Days - 19 : 32 : 15',
      'sq': '',
    },
  },
  // Miscellaneous
  {
    'rj7btlmt': {
      'en': '',
      'sq': '',
    },
    '3aeg2b9h': {
      'en': '',
      'sq': '',
    },
    'ex2496xu': {
      'en': '',
      'sq': '',
    },
    'yhpv6ka0': {
      'en': '',
      'sq': '',
    },
    '5ny74tma': {
      'en': '',
      'sq': '',
    },
    'u0r1knwy': {
      'en': '',
      'sq': '',
    },
    'auk7n9sf': {
      'en': '',
      'sq': '',
    },
    '9hvbjyit': {
      'en': '',
      'sq': '',
    },
    'qz9r9n3b': {
      'en': '',
      'sq': '',
    },
    '2pa11alq': {
      'en': '',
      'sq': '',
    },
    'v6d05o65': {
      'en': '',
      'sq': '',
    },
    'felbtbz4': {
      'en': '',
      'sq': '',
    },
    '7sz30sys': {
      'en': '',
      'sq': '',
    },
    'pn3136kl': {
      'en': '',
      'sq': '',
    },
    '0w9fs043': {
      'en': '',
      'sq': '',
    },
    'p4v5u9ms': {
      'en': '',
      'sq': '',
    },
    'w1dvcjya': {
      'en': '',
      'sq': '',
    },
    'mqx14gpy': {
      'en': '',
      'sq': '',
    },
    'wsa4sv0h': {
      'en': '',
      'sq': '',
    },
    'qe9dz420': {
      'en': '',
      'sq': '',
    },
    'ex9vrdo6': {
      'en': '',
      'sq': '',
    },
    'tix3c9no': {
      'en': '',
      'sq': '',
    },
    'xg2g7aaw': {
      'en': '',
      'sq': '',
    },
    'u4rhdvuh': {
      'en': '',
      'sq': '',
    },
    'q4jm6rba': {
      'en': '',
      'sq': '',
    },
    'nh7e65kf': {
      'en': '',
      'sq': '',
    },
    'fuhj9y8n': {
      'en': '',
      'sq': '',
    },
    'tukx3olp': {
      'en': 'COMING SOON',
      'sq': 'Se shpejti...'
    },
    'zlkfywcf': {
      'en': 'Closing Announcements',  
      'sq': 'Njoftimet ne mbarim'
    },
    'mxcw8tl7': {
      'en': 'See all',
      'sq': 'Te gjitha'
    }
    
  },
  {
    'e6sermra': {
      'en': 'KU TA GJEJ',
      'sq': '', 
    },
    'qil5wfmt': {
      'en': 'Create Business account.',
      'sq': '',
    },
    '4ckph5hq': {
      'en': 'Create an account by using the form below.',
      'sq': '',
    },
    't816mky8': {
      'en': 'Name',
      'sq': '',
    },
    'awdo4kft': {
      'en': 'Email',
      'sq': '',
    },
    '3r97nxbn': {
      'en': 'Phone Number',
      'sq': '',
    },
    '2vmx3l3k': {
      'en': 'Password',
      'sq': '',
    },
    '7tf2i2dz': {
      'en': 'Continue',
      'sq': 'Vazhdo',
    },
    'h9hud29z': {
      'en': 'Hello World',
      'sq': '',
    },
    '9pw0bgnd': {
      'en': 'Home',
      'sq': '',
    },
    '4v101yfv': {
      'en': "Phone Number",
      'sq': "Numri i telefonit"
    },
    '3emfzyuu': {
      'en': "Subscription",
      'sq': "Subscription"
    },
'to2qy1sm': {
      'en': "Professional - ALL 962 / MONTH",
      'sq': "Professional - ALL 962 / Muaj"
    },
'z1kqub8q': {
      'en': "Access category list",
      'sq': "Access ne listen e kategorise se profesionisteve"
    },
'ol4t0yb1': {
      'en': "Ftoni miq per te fituar ulje te paketes (1 mik - 20%)  5 miq eshte maksimumi qe mund te ftoni.",
      'sq': "Ftoni miq per te fituar ulje te paketes (1 mik - 20%)  5 miq eshte maksimumi qe mund te ftoni."
    },
'spqliimi': {
      'en': "Cancel",
      'sq': "Anulloje"
    },
'hhwuypv8': {
      'en': "Get ProBadge - ALL 12866",
      'sq': "Merr ProBadge - ALL 12866"
    },
'l4qi61ea': {
      'en': "Me ProBadge do fitoni Iconen  tek emri juaj bashke me nje Carte shkelqyese dhe 2x me e  madhe, si ne figure. - Kjo pakete eshte pa limit. E blini vetem njehere dhe do ta  keni pergjithmone!",
      'sq': " - Me ProBadge do fitoni Iconen  tek emri juaj bashke me nje Carte shkelqyese dhe 2x me e  madhe, si ne figure. - Kjo pakete eshte pa limit. E blini vetem njehere dhe do ta  keni pergjithmone!"
    },
's60i3a0x': {
      'en': "Name Name Description Descrip..",
      'sq': "Name Name Description Descrip.."
    },
'39l3slho': {
      'en': "Name Name",
      'sq': "Name Name"
    },

    'hoedqemy': {
      'en': "Description Description Descrip..",
      'sq': "Description Description Descrip.."
    },
    'a8jkqn4n': {
      'en': "Name Name Description Descrip..",
      'sq': "Name Name Description Descrip.."
    },
   

  },

].reduce((a, b) => a..addAll(b));
