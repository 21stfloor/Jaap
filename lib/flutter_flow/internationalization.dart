import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tl'];

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
    String? tlText = '',
  }) =>
      [enText, tlText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_WelcomeScreen
  {
    '63c5kls8': {
      'en': 'Find your Job or find a worker here in JAAP',
      'tl': '',
    },
    'ttum0opo': {
      'en': 'View Job List',
      'tl': '',
    },
    '3fvtcom2': {
      'en': 'Login',
      'tl': '',
    },
    'sk1h4yo4': {
      'en': 'Create Account as Applicant ?',
      'tl': '',
    },
    'xf677z8v': {
      'en': '  Click here',
      'tl': '',
    },
    't7ipwbq0': {
      'en': 'Create Account as Agency?',
      'tl': '',
    },
    't8a1r0hw': {
      'en': '   Click here',
      'tl': '',
    },
    'pesplko8': {
      'en': 'Home',
      'tl': '',
    },
  },
  // auth_CreateApplicant
  {
    'bz4kvu9y': {
      'en': 'Create Applicant account',
      'tl': '',
    },
    'k3qihcyu': {
      'en': 'Full Name',
      'tl': '',
    },
    'rm0350j0': {
      'en': 'Email Address',
      'tl': '',
    },
    'ei2060sa': {
      'en': 'Password',
      'tl': '',
    },
    'bxfgetq0': {
      'en': 'Password',
      'tl': '',
    },
    'uno5xrnw': {
      'en': 'Upload Resume',
      'tl': '',
    },
    'lpqf1f69': {
      'en': 'Read Terms and Conditions',
      'tl': '',
    },
    'c1uravtq': {
      'en': 'I have read and agreed to the terms and conditions',
      'tl': '',
    },
    'i50mu7rk': {
      'en': 'Create Account',
      'tl': '',
    },
    'q4q9av5n': {
      'en': 'Make an account as Agency?',
      'tl': '',
    },
    '9jpqu5pn': {
      'en': ' Click here!',
      'tl': '',
    },
    'hckf4nx5': {
      'en': 'Already Have An Account ?',
      'tl': '',
    },
    'oevtt5p7': {
      'en': ' Click here!',
      'tl': '',
    },
    'tvtg15te': {
      'en': 'Field is required',
      'tl': 'Field is required',
    },
    '6b5qfs0o': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'ilqemry0': {
      'en': 'Field is required',
      'tl': 'Field is required',
    },
    'o9xxzsvo': {
      'en': 'Email is required',
      'tl': '',
    },
    'fi3zkgkh': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '405k8cn9': {
      'en': 'Field is required',
      'tl': 'Field is required',
    },
    'tp7fweio': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '3wrijvy8': {
      'en': 'Field is required',
      'tl': 'field is Required',
    },
    'k9vmltip': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'vhdwdrl4': {
      'en': 'Home',
      'tl': '',
    },
  },
  // auth_Login
  {
    'rramc8pw': {
      'en': 'Login',
      'tl': '',
    },
    'do6h4fgx': {
      'en': 'Access your wonderful things by logging in below.',
      'tl': '',
    },
    'gh7v18ia': {
      'en': 'Email Address',
      'tl': '',
    },
    'ucxxu8df': {
      'en': 'Password',
      'tl': '',
    },
    '5gop8k5n': {
      'en': 'Login',
      'tl': '',
    },
    'hszgkpuy': {
      'en': 'Forgot Password?',
      'tl': '',
    },
    'hmugeaj0': {
      'en': 'Make Account as Applicant?',
      'tl': '',
    },
    'ylvyln3b': {
      'en': 'Click Here!',
      'tl': '',
    },
    'bqk63h06': {
      'en': 'Make Account as Agency?',
      'tl': '',
    },
    'tepjnf0i': {
      'en': 'Click Here!',
      'tl': '',
    },
    'ns1qv3rq': {
      'en': 'Field is required',
      'tl': '',
    },
    'rx1injh1': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'g6l2msk4': {
      'en': 'Field is required',
      'tl': '',
    },
    '8op5qt1z': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '4urrh8bf': {
      'en': 'Home',
      'tl': '',
    },
  },
  // auth_ForgotPassword
  {
    '553fjj9q': {
      'en': 'Forgot Password',
      'tl': '',
    },
    'n1wmd7y9': {
      'en': 'We will send you a reset link.',
      'tl': '',
    },
    'j7xvdm0z': {
      'en': 'Email Address',
      'tl': '',
    },
    'njcpfcmz': {
      'en': 'Field is required',
      'tl': '',
    },
    'rp6u5c01': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'ihm894q7': {
      'en': 'Send Link',
      'tl': '',
    },
    '9dt683i8': {
      'en': 'Home',
      'tl': '',
    },
  },
  // adminVideos
  {
    'uk8186co': {
      'en': 'Videos',
      'tl': '',
    },
    'i7x2y1xg': {
      'en': 'Below is a list of your uploaded videos',
      'tl': '',
    },
    'atuanj24': {
      'en': 'Upload',
      'tl': '',
    },
    'brd63vy6': {
      'en': 'Thumbnail',
      'tl': '',
    },
    '9e3i7nzw': {
      'en': 'Title',
      'tl': '',
    },
    '26aiomva': {
      'en': 'Updated',
      'tl': '',
    },
    'kdv254ch': {
      'en': 'Actions',
      'tl': '',
    },
    '5ttlmq7k': {
      'en': 'Home',
      'tl': '',
    },
  },
  // adminpayments
  {
    'rc3fhrqs': {
      'en': 'Payment History of Agency',
      'tl': '',
    },
    'qilkfy0c': {
      'en': 'Customer Information',
      'tl': '',
    },
    'q4feir04': {
      'en': 'Paid On',
      'tl': '',
    },
    'hwzgobes': {
      'en': 'Invoice #',
      'tl': '',
    },
    'pchm96tr': {
      'en': 'Amount',
      'tl': '',
    },
    '9j9segex': {
      'en': 'Status',
      'tl': '',
    },
    'wvzxq88k': {
      'en': 'Action',
      'tl': '',
    },
    'fxeprhe7': {
      'en': 'Accepted',
      'tl': '',
    },
    'jut40tgy': {
      'en': 'Pending',
      'tl': '',
    },
    'ojnt1wle': {
      'en': 'Accept',
      'tl': '',
    },
    'wu8kdc9k': {
      'en': 'Home',
      'tl': '',
    },
  },
  // JobPostCreate
  {
    '1c6l2qor': {
      'en': 'Post a Job',
      'tl': '',
    },
    'cvrsj1kq': {
      'en': 'Job Title',
      'tl': '',
    },
    '745qrvp0': {
      'en': 'Enter job title',
      'tl': '',
    },
    'n16qm0wr': {
      'en': 'Job Description',
      'tl': '',
    },
    'f2qxeeda': {
      'en': 'Enter job description',
      'tl': '',
    },
    'rux69yw5': {
      'en': 'Location',
      'tl': '',
    },
    'sniagp5z': {
      'en': 'Enter job location',
      'tl': '',
    },
    '7knjtsao': {
      'en': 'Skills',
      'tl': '',
    },
    'uakskx0b': {
      'en': 'Enter Skills Needed',
      'tl': '',
    },
    'qani6ade': {
      'en': 'Salary',
      'tl': '',
    },
    '64ppz1j0': {
      'en': 'Enter salary',
      'tl': '',
    },
    'o97aky09': {
      'en': 'Upload Video',
      'tl': '',
    },
    '2wn8adfk': {
      'en': 'Uploaded video will be reviewed by admin first',
      'tl': '',
    },
    'b1jydmn8': {
      'en': 'Country',
      'tl': '',
    },
    'wogeakhr': {
      'en': 'Option 1',
      'tl': '',
    },
    '1bwxw0gd': {
      'en': 'Please select...',
      'tl': '',
    },
    'silqhjvc': {
      'en': 'Search country...',
      'tl': '',
    },
    'uiaw5khe': {
      'en': 'Job Type',
      'tl': '',
    },
    'uz4nju7f': {
      'en': 'Option 1',
      'tl': '',
    },
    'x1w888kk': {
      'en': 'Please select...',
      'tl': '',
    },
    'daa3iwaj': {
      'en': 'Search for an item...',
      'tl': '',
    },
    'z2xp1tue': {
      'en': 'Post Job',
      'tl': '',
    },
    'jmpcnf6e': {
      'en': 'Field is required',
      'tl': '',
    },
    'ribacsdd': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'rifr53dj': {
      'en': 'Field is required',
      'tl': '',
    },
    'b9f3qmlt': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'if76ulha': {
      'en': 'Field is required',
      'tl': '',
    },
    'ucwdyubt': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'ag7vcud2': {
      'en': 'Field is required',
      'tl': '',
    },
    '9jlzjchs': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    's806rtbi': {
      'en': 'Field is required',
      'tl': '',
    },
    '4u71pyy5': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // auth_CreateAgency
  {
    'i38ntcfc': {
      'en': 'Create Agency Account',
      'tl': '',
    },
    'q62819bs': {
      'en':
          'After you create your account, it will need to be reviewed. Please allow 2-3 business days for the verification process.',
      'tl': '',
    },
    'l72gdezu': {
      'en': 'Name Of the Agency',
      'tl': '',
    },
    't6cmey4s': {
      'en': 'Email Address',
      'tl': '',
    },
    'cd13mvv7': {
      'en': 'Password',
      'tl': '',
    },
    'brfk2bcu': {
      'en': 'Confirm Password',
      'tl': '',
    },
    'y5pbirxm': {
      'en': 'Upload Documents (pdf)',
      'tl': '',
    },
    'ymlmkq3k': {
      'en': '',
      'tl': '',
    },
    'hrld6krn': {
      'en': 'Upload Buisness Registratrion Certificate (image )',
      'tl': '',
    },
    'lq6tbvrz': {
      'en': '',
      'tl': '',
    },
    'dpbj7qz7': {
      'en': 'Read Terms and Conditions',
      'tl': '',
    },
    'hluspaj7': {
      'en': 'I have read and agreed to the terms and conditions',
      'tl': '',
    },
    '3jvol6h6': {
      'en': 'Create Account',
      'tl': '',
    },
    'yl5zt1f2': {
      'en': 'Already have an account? \n',
      'tl': '',
    },
    '9qwkyjp4': {
      'en': 'Click Here!',
      'tl': '',
    },
    'xtgk1d00': {
      'en': 'Make an Account as Applicant? \n',
      'tl': '',
    },
    'gtuvmbxj': {
      'en': 'Click Here!',
      'tl': '',
    },
    'pst97gb0': {
      'en': 'Field is required',
      'tl': '',
    },
    '6z8nzs2o': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '6mxheapc': {
      'en': 'Field is required',
      'tl': '',
    },
    'yzpdbmh7': {
      'en': 'Email is required',
      'tl': '',
    },
    'tg9agbah': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'rfepcbpz': {
      'en': 'Field is required',
      'tl': '',
    },
    'eemdii2l': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'woxlv53s': {
      'en': 'Field is required',
      'tl': '',
    },
    '7qjb4viu': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'smwj9jvm': {
      'en': 'Home',
      'tl': '',
    },
  },
  // JobList
  {
    'j2bgq4f6': {
      'en': 'Job List',
      'tl': '',
    },
    '7lfiwi6h': {
      'en': 'SEARCH JOB HERE',
      'tl': '',
    },
    'bb8nfvf5': {
      'en': 'Filters',
      'tl': '',
    },
    'tv427z25': {
      'en': 'Clear filter',
      'tl': '',
    },
    'ltc5h9ar': {
      'en': 'Featured Jobs',
      'tl': '',
    },
    '9kg1qge0': {
      'en': 'View Full Details ',
      'tl': '',
    },
    'eaxc4l57': {
      'en': 'More Jobs',
      'tl': '',
    },
    '9iuvbb3p': {
      'en': 'View Full Details ',
      'tl': '',
    },
    't2t74cas': {
      'en': 'Home',
      'tl': '',
    },
  },
  // ProfileApplicant
  {
    'eo2625pm': {
      'en': 'Verified',
      'tl': '',
    },
    'lg4cd8ts': {
      'en': 'Not Verified',
      'tl': '',
    },
    'dyxwu0bp': {
      'en': 'currently Employed at',
      'tl': '',
    },
    'x9frools': {
      'en': '\nas ',
      'tl': '',
    },
    '1hcfqbst': {
      'en': 'Manage your account',
      'tl': '',
    },
    '9b36nxj6': {
      'en': 'Edit Profile',
      'tl': '',
    },
    'lxc3m59v': {
      'en': 'Reset Password',
      'tl': '',
    },
    'lr78tbuz': {
      'en': 'Log out',
      'tl': '',
    },
    'y3g75xws': {
      'en': 'Home',
      'tl': '',
    },
  },
  // ProfileAgency
  {
    'fxfcy0yi': {
      'en': 'Manage your account',
      'tl': '',
    },
    'm4hb6wxw': {
      'en': 'Edit Profile',
      'tl': '',
    },
    '5v6uk0v0': {
      'en': 'Reset Password',
      'tl': '',
    },
    '06l3dmgn': {
      'en': 'Deactivate Account',
      'tl': '',
    },
    'anyrv484': {
      'en': 'Home',
      'tl': '',
    },
  },
  // ListofApplicants
  {
    '45xoyedp': {
      'en': 'Applicants',
      'tl': '',
    },
  },
  // joblistPostedByAgency
  {
    '1xle8y3b': {
      'en': 'Job List',
      'tl': '',
    },
    'fdsch40z': {
      'en': 'Post A New Job',
      'tl': '',
    },
    'dwdqiwwa': {
      'en': 'Edit Details ',
      'tl': '',
    },
    'mpxm1ztw': {
      'en': 'Home',
      'tl': '',
    },
  },
  // redirection
  {
    'k2ztels6': {
      'en': 'Home',
      'tl': '',
    },
  },
  // editprofileapplicant
  {
    'diknh2c8': {
      'en': 'Your information',
      'tl': '',
    },
    'n6h18kf5': {
      'en': 'Change Photo',
      'tl': '',
    },
    'a6dt3tj6': {
      'en': 'User Name',
      'tl': '',
    },
    'elawvzpj': {
      'en': 'Email',
      'tl': '',
    },
    'fxjxzm6k': {
      'en': 'Select',
      'tl': '',
    },
    'ihkfjeae': {
      'en': 'Birthplace',
      'tl': '',
    },
    'vlulnpcs': {
      'en': 'Birthplace',
      'tl': '',
    },
    'hhy40fer': {
      'en': 'Address',
      'tl': '',
    },
    'epn2p9wr': {
      'en': 'Address',
      'tl': '',
    },
    '9rdkjofs': {
      'en': 'Address',
      'tl': '',
    },
    '4ws8o7pg': {
      'en': 'Phone number',
      'tl': '',
    },
    't4hyvdkr': {
      'en': 'Phone number',
      'tl': '',
    },
    'iqipc6z0': {
      'en': 'Upload resume',
      'tl': '',
    },
    'wmak04hg': {
      'en': 'resume uploaded',
      'tl': '',
    },
    'rtgif49f': {
      'en': 'No resume',
      'tl': '',
    },
    '581bgzcq': {
      'en': 'Upload certification',
      'tl': '',
    },
    'ljqxyg84': {
      'en': 'resume uploaded',
      'tl': '',
    },
    '180t5idq': {
      'en': 'No resume',
      'tl': '',
    },
    'r7bfoewj': {
      'en': 'Certification/License/Title/etc.',
      'tl': '',
    },
    'p2qjui5k': {
      'en': 'Save Changes',
      'tl': '',
    },
    'e885rb58': {
      'en': 'Field is required',
      'tl': '',
    },
    'zdslay2a': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '5sxu8y8y': {
      'en': 'Field is required',
      'tl': '',
    },
    'apnu1v8z': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'bmt22r1p': {
      'en': 'Field is required',
      'tl': '',
    },
    'lyj8hecu': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '6caumz4v': {
      'en': 'Field is required',
      'tl': '',
    },
    'w64yvc3j': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'z12src28': {
      'en': 'Field is required',
      'tl': '',
    },
    '8rb94j4g': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'kjpck38e': {
      'en': 'Field is required',
      'tl': '',
    },
    'vbkfo0wt': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'n248ccji': {
      'en': 'Field is required',
      'tl': '',
    },
    'm00kc7ui': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '05jfzm2q': {
      'en': 'Home',
      'tl': '',
    },
  },
  // jobPostPreviewPage
  {
    'zbu2bdh9': {
      'en': 'Job Title',
      'tl': '',
    },
    'y1f83gnx': {
      'en': 'About the job',
      'tl': '',
    },
    'ft7c9acv': {
      'en': 'Job type',
      'tl': '',
    },
    'vzbg78iz': {
      'en': 'Salaryy',
      'tl': '',
    },
    'flxms526': {
      'en': 'Location',
      'tl': '',
    },
    '0xis546y': {
      'en': 'Skill requirements',
      'tl': '',
    },
    'sj6tktmr': {
      'en':
          'You can\'t apply for this job,\n either your account is not activated yet or you are already employed',
      'tl': '',
    },
    'c8nr6sit': {
      'en': 'Login to apply',
      'tl': '',
    },
    '9vf33f3f': {
      'en': 'Home',
      'tl': '',
    },
  },
  // videoPage
  {
    'jkwqbjkm': {
      'en': 'Videos',
      'tl': '',
    },
    'yqe0fl6n': {
      'en': 'Home',
      'tl': '',
    },
  },
  // pendingPage
  {
    'abfw5y1j': {
      'en': 'Home',
      'tl': '',
    },
  },
  // communityPage
  {
    'mi8yg25z': {
      'en': 'JAAP',
      'tl': '',
    },
    'a5isrndg': {
      'en': 'Home',
      'tl': '',
    },
  },
  // createPost
  {
    'zbi99256': {
      'en': 'cancel',
      'tl': '',
    },
    '83xf3pay': {
      'en': 'Post',
      'tl': '',
    },
    't1spv6o9': {
      'en': 'Title',
      'tl': '',
    },
    'jssnmip4': {
      'en': 'Put Description Here...',
      'tl': '',
    },
    'fl2uaihj': {
      'en': 'Field is required',
      'tl': '',
    },
    'rdhma2t0': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'gqcu1w2m': {
      'en': 'Field is required',
      'tl': '',
    },
    '0r4zo5az': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '1kzyau87': {
      'en': 'Home',
      'tl': '',
    },
  },
  // AdminVideoPostCreate
  {
    '5t8kvlit': {
      'en': 'Post a Video',
      'tl': '',
    },
    'e6da9r3b': {
      'en': 'Title',
      'tl': '',
    },
    '2vvdypu9': {
      'en': 'Enter video title...',
      'tl': '',
    },
    '74xsyiiu': {
      'en': 'Description',
      'tl': '',
    },
    'xp5a03q9': {
      'en': 'Enter video description...',
      'tl': '',
    },
    'ybhl6f18': {
      'en': 'delete thumbnail',
      'tl': '',
    },
    'z394d8z9': {
      'en': 'Upload Thumbnail',
      'tl': '',
    },
    'hqub5hun': {
      'en': 'delete video',
      'tl': '',
    },
    'f0i54x5y': {
      'en': 'Upload Video',
      'tl': '',
    },
    '3li1rc0k': {
      'en': 'Post',
      'tl': '',
    },
    'aefsdg0k': {
      'en': 'Field is required',
      'tl': '',
    },
    'jr7rtowv': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'ymvdzxzd': {
      'en': 'Field is required',
      'tl': '',
    },
    'c6wm869u': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // JobPostEdit
  {
    's2rs07j8': {
      'en': 'Post a Job',
      'tl': '',
    },
    'd4zwm09v': {
      'en': 'Job Title',
      'tl': '',
    },
    '08c4k6yx': {
      'en': 'Enter job title',
      'tl': '',
    },
    'ab6vw4uy': {
      'en': 'Job Description',
      'tl': '',
    },
    '2my29kwm': {
      'en': 'Enter job description',
      'tl': '',
    },
    'jii8ec3o': {
      'en': 'Location',
      'tl': '',
    },
    'xswr2ord': {
      'en': 'Enter job location',
      'tl': '',
    },
    'vs7usti1': {
      'en': 'Skills',
      'tl': '',
    },
    'a068zn3d': {
      'en': 'Enter Skills Needed',
      'tl': '',
    },
    's8k4pvn3': {
      'en': 'Salary',
      'tl': '',
    },
    'op4se2js': {
      'en': 'Enter salary',
      'tl': '',
    },
    'r6oki7ze': {
      'en': 'Upload Video',
      'tl': '',
    },
    'v8lo1qjx': {
      'en': 'Visible',
      'tl': '',
    },
    '2wb82e4w': {
      'en': 'Country',
      'tl': '',
    },
    '8io9fpxl': {
      'en': 'Option 1',
      'tl': '',
    },
    '0dw6kbuf': {
      'en': 'Please select...',
      'tl': '',
    },
    'h5y6lx4f': {
      'en': 'Search country...',
      'tl': '',
    },
    'tjv7oivn': {
      'en': 'Job Type',
      'tl': '',
    },
    '1t7m93x2': {
      'en': 'Option 1',
      'tl': '',
    },
    'csj7ocrz': {
      'en': 'Please select...',
      'tl': '',
    },
    'qrfrh20j': {
      'en': 'Search for an item...',
      'tl': '',
    },
    '0d8uldt9': {
      'en': 'Post Job',
      'tl': '',
    },
    '98lzqpgp': {
      'en': 'Delete Job Post',
      'tl': '',
    },
    'y8u97xrr': {
      'en': 'Boost Post',
      'tl': '',
    },
    'da34klk7': {
      'en': 'Field is required',
      'tl': '',
    },
    '64o034g8': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'hzmfx47s': {
      'en': 'Field is required',
      'tl': '',
    },
    'ex3enokw': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '4gsb2g34': {
      'en': 'Field is required',
      'tl': '',
    },
    '766jpkha': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'sac3vlz9': {
      'en': 'Field is required',
      'tl': '',
    },
    'yzrzvyci': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'gbdtq4gm': {
      'en': 'Field is required',
      'tl': '',
    },
    'bp7qqti5': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // chat_2_mainApplicant
  {
    '3i6cun3g': {
      'en': 'My Chats',
      'tl': '',
    },
    'e9jp6dwl': {
      'en': 'Below are your chat applications',
      'tl': '',
    },
    '9m89wli4': {
      'en': '__',
      'tl': '',
    },
  },
  // image_Details
  {
    'vmasgxgt': {
      'en': 'Home',
      'tl': '',
    },
  },
  // editprofileAgency
  {
    '9cft55rx': {
      'en': 'Your information',
      'tl': '',
    },
    'i0e5cob6': {
      'en': 'Change Photo',
      'tl': '',
    },
    'xil42fh0': {
      'en': 'Email',
      'tl': '',
    },
    'xgrj35y8': {
      'en': 'About us',
      'tl': '',
    },
    '7jbqbe8r': {
      'en': 'About us',
      'tl': '',
    },
    '578h6dis': {
      'en': 'Upload Certificate',
      'tl': '',
    },
    '4xkrll52': {
      'en': 'Save Changes',
      'tl': '',
    },
    'ijmmph2y': {
      'en': 'Home',
      'tl': '',
    },
  },
  // adminApplicants
  {
    '6ejkks5i': {
      'en': 'Applicants',
      'tl': '',
    },
    '4ysshwu8': {
      'en': 'List of applicants registered',
      'tl': '',
    },
    '1wtp4zqc': {
      'en': 'User Information',
      'tl': '',
    },
    '3fadebfi': {
      'en': 'Date Created',
      'tl': '',
    },
    'tvuzjswy': {
      'en': 'Resume',
      'tl': '',
    },
    '9fr2kttt': {
      'en': 'Work ID',
      'tl': '',
    },
    'k0x6njsh': {
      'en': 'Status',
      'tl': '',
    },
    '0qd0z8xo': {
      'en': 'Activate',
      'tl': '',
    },
    'r9x1cmpz': {
      'en': 'Verify',
      'tl': '',
    },
    'qzsfcv7p': {
      'en': 'Approve Deployment',
      'tl': '',
    },
    'u1xi9phm': {
      'en': 'None',
      'tl': '',
    },
    'qot4r7gg': {
      'en': 'Verified',
      'tl': '',
    },
    'hxuglzf3': {
      'en': 'Verified',
      'tl': '',
    },
    'ee14g1au': {
      'en': 'Home',
      'tl': '',
    },
  },
  // adminAgencies
  {
    'x8xv1ss2': {
      'en': 'Agencies',
      'tl': '',
    },
    'yfiwo8rj': {
      'en': 'List of agencies registered',
      'tl': '',
    },
    'e75n1w7o': {
      'en': 'User Information',
      'tl': '',
    },
    'vbh7szpa': {
      'en': 'Date Created',
      'tl': '',
    },
    'vbu36zsj': {
      'en': 'Certificate',
      'tl': '',
    },
    'd1vmvwqz': {
      'en': 'Status',
      'tl': '',
    },
    'w8bjy92t': {
      'en': 'Actions',
      'tl': '',
    },
    'tfn8txmr': {
      'en': 'Feedback',
      'tl': '',
    },
    'zfuf5cbv': {
      'en': '#2424',
      'tl': '',
    },
    'ulct0x15': {
      'en': 'Randy Peterson',
      'tl': '',
    },
    'kj0bjyki': {
      'en': 'randy.p@domainname.com',
      'tl': '',
    },
    'e7yzazsw': {
      'en': 'Jan. 20th, 2023',
      'tl': '',
    },
    'oiehdecp': {
      'en': 'A few moments ago',
      'tl': '',
    },
    'fucl2knf': {
      'en': 'Active',
      'tl': '',
    },
    'm6xitoaf': {
      'en': '#2427',
      'tl': '',
    },
    'ork6mrkv': {
      'en': 'Randy Peterson',
      'tl': '',
    },
    '0wr7a5qx': {
      'en': 'randy.p@domainname.com',
      'tl': '',
    },
    'dx715goy': {
      'en': 'Jan. 20th, 2023',
      'tl': '',
    },
    '9msygufb': {
      'en': 'A few moments ago',
      'tl': '',
    },
    'x8nuq7pk': {
      'en': 'Active',
      'tl': '',
    },
    'dr9vpngp': {
      'en': 'Home',
      'tl': '',
    },
  },
  // adminSubscriptions
  {
    'q9n3rtos': {
      'en': 'Subscriptions',
      'tl': '',
    },
    '99baa1ne': {
      'en': '12',
      'tl': '',
    },
    '84sbdmpx': {
      'en': 'Filter',
      'tl': '',
    },
    '2qdm3qse': {
      'en': 'Search users...',
      'tl': '',
    },
    '5vt7ys1n': {
      'en': 'Customer Information',
      'tl': '',
    },
    'b0vkn1dk': {
      'en': 'Paid On',
      'tl': '',
    },
    'x0xriaty': {
      'en': 'Expiry date',
      'tl': '',
    },
    'jhnq2znh': {
      'en': 'Amount',
      'tl': '',
    },
    '43hoirn3': {
      'en': 'Payment method',
      'tl': '',
    },
    '3cck4dah': {
      'en': 'Home',
      'tl': '',
    },
  },
  // adminSettings
  {
    'ylltivnx': {
      'en': 'Settings',
      'tl': '',
    },
    'zzoquknb': {
      'en': 'Price',
      'tl': '',
    },
    '413scz0z': {
      'en': 'Agency Boosting Price',
      'tl': '',
    },
    'y3sfq0z4': {
      'en': 'Applicant Subscription Price',
      'tl': '',
    },
    'p8ucd6f3': {
      'en': 'Save',
      'tl': '',
    },
    'pp0epasl': {
      'en': 'Home',
      'tl': '',
    },
  },
  // editPost
  {
    'mr0xcpb1': {
      'en': 'cancel',
      'tl': '',
    },
    '4ezstfv0': {
      'en': 'Post',
      'tl': '',
    },
    'q3huwdb6': {
      'en': 'Title',
      'tl': '',
    },
    'j9o2vd0z': {
      'en': 'Put Description Here...',
      'tl': '',
    },
    '7p7k35od': {
      'en': 'Field is required',
      'tl': '',
    },
    'dyjom58y': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'u6b1u25j': {
      'en': 'Field is required',
      'tl': '',
    },
    '1ym5ngte': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'dvmqvdp3': {
      'en': 'Home',
      'tl': '',
    },
  },
  // chat_2_mainAgency
  {
    '867pw4br': {
      'en': 'My Chats',
      'tl': '',
    },
    'fbo5tcpp': {
      'en': 'Below are your chat applications',
      'tl': '',
    },
    '2dv7b93x': {
      'en': '__',
      'tl': '',
    },
  },
  // AdminVideosPostEdit
  {
    'n6oep2vz': {
      'en': 'Post a Video',
      'tl': '',
    },
    'vp6a9w72': {
      'en': 'Title',
      'tl': '',
    },
    'amwdng77': {
      'en': 'Enter video title...',
      'tl': '',
    },
    '0mw7lmj9': {
      'en': 'Description',
      'tl': '',
    },
    'tpz58rcz': {
      'en': 'Enter video description...',
      'tl': '',
    },
    'w4fa8xk0': {
      'en': 'delete thumbnail',
      'tl': '',
    },
    'z84h3v8a': {
      'en': 'Upload Thumbnail',
      'tl': '',
    },
    '2rdpyp5u': {
      'en': 'delete video',
      'tl': '',
    },
    '0wmmndax': {
      'en': 'Upload Video',
      'tl': '',
    },
    'rjntzbo4': {
      'en': 'Post',
      'tl': '',
    },
    '3wbeleus': {
      'en': 'Field is required',
      'tl': '',
    },
    'gso6m3zg': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'ah8k8azg': {
      'en': 'Field is required',
      'tl': '',
    },
    'u8beirmu': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // communityPageAgency
  {
    'xu52rt7q': {
      'en': 'JAAP',
      'tl': '',
    },
    'zdx9opzm': {
      'en': 'Home',
      'tl': '',
    },
  },
  // Dashboard
  {
    't853qyqu': {
      'en': 'Great day! ',
      'tl': '',
    },
    '2kg1ayg3': {
      'en': 'Hello',
      'tl': '',
    },
    'v2pglt4q': {
      'en': 'Let\'s find you the best company for your skills!',
      'tl': '',
    },
    'gzew59t6': {
      'en': 'Job List',
      'tl': '',
    },
    'qj5dj7xn': {
      'en': 'Find the right job for you',
      'tl': '',
    },
    'b7zffh91': {
      'en': 'Community Posts',
      'tl': '',
    },
    'j8g5k9eh': {
      'en': 'Read up on the latest topic',
      'tl': '',
    },
    '6mn0oi58': {
      'en': 'Chat',
      'tl': '',
    },
    'rqv3lbpx': {
      'en': 'Catch up on your employers',
      'tl': '',
    },
    'nu31zf2e': {
      'en': 'Create Posts',
      'tl': '',
    },
    '4m91cd5w': {
      'en': 'Contribute to your community',
      'tl': '',
    },
    'ixr1fo02': {
      'en': 'Videos',
      'tl': '',
    },
    'ld6v0h78': {
      'en': 'Watch the latest updates',
      'tl': '',
    },
    'stxqblwa': {
      'en': 'Job History',
      'tl': '',
    },
    'ky0wb1j4': {
      'en': 'Review your latest applications',
      'tl': '',
    },
    'o7j0qbhm': {
      'en': 'Top Agencies',
      'tl': '',
    },
    'tpt4bx5p': {
      'en': 'View Agency',
      'tl': '',
    },
    '66d35g98': {
      'en': 'Home',
      'tl': '',
    },
  },
  // chat_2_DetailsAgency
  {
    'tr418kgs': {
      'en': 'View Applicant Profile',
      'tl': '',
    },
    'lu508opu': {
      'en': 'Hire this Applicant',
      'tl': '',
    },
    'hv4byp6d': {
      'en': 'Rate this Applicant',
      'tl': '',
    },
    'wuozykrr': {
      'en': 'Home',
      'tl': '',
    },
  },
  // chat_2_DetailsApplicant
  {
    '5xikrvqr': {
      'en': 'Answer Video Call',
      'tl': '',
    },
    'yswsgokq': {
      'en': 'Home',
      'tl': '',
    },
  },
  // notificationApplicantPage
  {
    's43nm5wd': {
      'en': 'Notifications',
      'tl': '',
    },
    'sj80n2zd': {
      'en': 'Home',
      'tl': '',
    },
  },
  // notificationAgencyPage
  {
    'br52qehv': {
      'en': 'Notifications',
      'tl': '',
    },
    '4uy4wgtn': {
      'en': 'Home',
      'tl': '',
    },
  },
  // deployedlistByAgency
  {
    'ft09zt3p': {
      'en': 'Deployed Employees',
      'tl': '',
    },
    'plhsxtam': {
      'en': 'View Profile',
      'tl': '',
    },
    't6v00r6b': {
      'en': 'Home',
      'tl': '',
    },
  },
  // jobHistory
  {
    'adh8jmov': {
      'en': 'Job History',
      'tl': '',
    },
    'lsklkgpr': {
      'en': '\$ ',
      'tl': '',
    },
    '0a5et4pd': {
      'en': 'Hello World',
      'tl': '',
    },
    'i6xuttiy': {
      'en': 'Start Date: ',
      'tl': '',
    },
    'ms8u5ems': {
      'en': 'Hello World',
      'tl': '',
    },
    '3jyg9205': {
      'en': 'End Date: ',
      'tl': '',
    },
    '5ha7opza': {
      'en': 'Hello World',
      'tl': '',
    },
    'gakbskrq': {
      'en': 'You already have feedback for this employer...',
      'tl': '',
    },
    'shhkuvk9': {
      'en': 'Write Feedback',
      'tl': '',
    },
    'i8unzyif': {
      'en': 'Home',
      'tl': '',
    },
  },
  // employingHistory
  {
    '007uucm2': {
      'en': 'Applicant History',
      'tl': '',
    },
    'ap4k8nk5': {
      'en': 'Salary: \$ ',
      'tl': '',
    },
    'hnbzsnbi': {
      'en': 'Start Date: ',
      'tl': '',
    },
    'gnaj26e8': {
      'en': 'Hello World',
      'tl': '',
    },
    'wyxypvui': {
      'en': 'EndDate: ',
      'tl': '',
    },
    'ekqbo47u': {
      'en': 'Hello World',
      'tl': '',
    },
    'l8ajmz5r': {
      'en': 'View Applicant Profile',
      'tl': '',
    },
    'ovb6jqz3': {
      'en': 'Already submitted feedback.',
      'tl': '',
    },
    'uft1z646': {
      'en': 'Create Feedback',
      'tl': '',
    },
  },
  // notificationAdmin
  {
    'j9h0kfi3': {
      'en': 'Notifications',
      'tl': '',
    },
    '1q3v6jcs': {
      'en': 'Home',
      'tl': '',
    },
  },
  // PostFullPage
  {
    'p6a1mbnr': {
      'en': 'New comment',
      'tl': '',
    },
    'm1t8y077': {
      'en': 'Home',
      'tl': '',
    },
  },
  // blank_404
  {
    '6gbce9bx': {
      'en': 'Oops! The page you\'re looking for doesn\'t exist.',
      'tl': '',
    },
    'v60dnqjr': {
      'en': 'It might have been moved or deleted.',
      'tl': '',
    },
    '8m6jvatw': {
      'en': 'Go Back Home',
      'tl': '',
    },
  },
  // adminAgencyVideos
  {
    'qppd4lfw': {
      'en': 'Videos to reviewed',
      'tl': '',
    },
    'nh77lnib': {
      'en': 'List of videos uploaded by agencies',
      'tl': '',
    },
    '6lziwq3s': {
      'en': 'Agency',
      'tl': '',
    },
    'k2hto1lp': {
      'en': 'Job title',
      'tl': '',
    },
    't8zbobo1': {
      'en': 'Date Uploaded',
      'tl': '',
    },
    'uk5q1tzw': {
      'en': 'Video',
      'tl': '',
    },
    'e328g5mh': {
      'en': 'Actions',
      'tl': '',
    },
    '3t0tie0o': {
      'en': 'Play  video',
      'tl': '',
    },
    '56xcab5z': {
      'en': 'Approve',
      'tl': '',
    },
    'zu1ejv8n': {
      'en': '#2424',
      'tl': '',
    },
    'so8sg200': {
      'en': 'Randy Peterson',
      'tl': '',
    },
    'pfxi98f4': {
      'en': 'randy.p@domainname.com',
      'tl': '',
    },
    '0uoudyax': {
      'en': 'Jan. 20th, 2023',
      'tl': '',
    },
    'vjvj0sao': {
      'en': 'A few moments ago',
      'tl': '',
    },
    'qj5vk1v5': {
      'en': 'Active',
      'tl': '',
    },
    't6r739ef': {
      'en': '#2427',
      'tl': '',
    },
    'w8ose4bu': {
      'en': 'Randy Peterson',
      'tl': '',
    },
    '20gtrrvf': {
      'en': 'randy.p@domainname.com',
      'tl': '',
    },
    '550hp4hy': {
      'en': 'Jan. 20th, 2023',
      'tl': '',
    },
    'q0qn50ai': {
      'en': 'A few moments ago',
      'tl': '',
    },
    '4ssulswy': {
      'en': 'Active',
      'tl': '',
    },
    'woq06u4h': {
      'en': 'Home',
      'tl': '',
    },
  },
  // agencyVideos
  {
    'k3omdd6d': {
      'en': 'Videos',
      'tl': '',
    },
    '9jjqxipi': {
      'en': 'Below is a list of your uploaded videos',
      'tl': '',
    },
    '9sfdwgc9': {
      'en': 'Upload',
      'tl': '',
    },
    '2tu528xr': {
      'en': 'Thumbnail',
      'tl': '',
    },
    '8m3nq98d': {
      'en': 'Title',
      'tl': '',
    },
    'hq2790h2': {
      'en': 'Updated',
      'tl': '',
    },
    'z6are679': {
      'en': 'Actions',
      'tl': '',
    },
    'u6ti8agk': {
      'en': 'Home',
      'tl': '',
    },
  },
  // sideNavApplicants
  {
    'coerudza': {
      'en': 'Platform Navigation',
      'tl': '',
    },
    'mtnunl2a': {
      'en': 'Dashboard',
      'tl': '',
    },
    'kb1ytukd': {
      'en': 'Community post',
      'tl': '',
    },
    'ihyf5h43': {
      'en': 'Chat',
      'tl': '',
    },
    'ut9f8b79': {
      'en': 'Create Post',
      'tl': '',
    },
    'e723nd9t': {
      'en': 'List Of Jobs',
      'tl': '',
    },
    'fyq3i5pb': {
      'en': 'Videos',
      'tl': '',
    },
    'iv2p2z0u': {
      'en': 'Job History',
      'tl': '',
    },
    '25ocav4i': {
      'en': 'Settings',
      'tl': '',
    },
    'w7da6qvh': {
      'en': 'Notifications',
      'tl': '',
    },
    'aj8uubpc': {
      'en': 'Log out',
      'tl': '',
    },
    'ndoipqds': {
      'en': 'Subscribed',
      'tl': '',
    },
  },
  // profileRating
  {
    '3hts12fx': {
      'en': 'UserName',
      'tl': '',
    },
    'qgehnuxn': {
      'en': 'Overall',
      'tl': '',
    },
    'ejpc1cju': {
      'en': '5',
      'tl': '',
    },
    'ajcowjky': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'tl': '',
    },
  },
  // notification
  {
    'dhugswcj': {
      'en': 'Andrew Hernandez',
      'tl': '',
    },
    'zmkf1vfo': {
      'en': 'Jan. 28th, 4:30pm',
      'tl': '',
    },
    'wu47s4bm': {
      'en': '@username',
      'tl': '',
    },
    '1di98jv2': {
      'en':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. ',
      'tl': '',
    },
  },
  // componentJobList
  {
    'w1zq1h5q': {
      'en': 'company Name',
      'tl': '',
    },
    'ze04n9wd': {
      'en': 'post date',
      'tl': '',
    },
    'bmowiwhy': {
      'en': 'Discription of the Job',
      'tl': '',
    },
    'zbqkktvt': {
      'en': 'View Full Details ',
      'tl': '',
    },
  },
  // sideNavAgency
  {
    'mtu87eah': {
      'en': 'Platform Navigation',
      'tl': '',
    },
    't7qm5fwt': {
      'en': 'Chat',
      'tl': '',
    },
    'pnmrt8wp': {
      'en': 'Community post',
      'tl': '',
    },
    'eoykf8y4': {
      'en': 'Job Post',
      'tl': '',
    },
    '5wqdbli5': {
      'en': 'List of Applicants',
      'tl': '',
    },
    'ndergwkz': {
      'en': 'Deployed Employees',
      'tl': '',
    },
    'mj68maiu': {
      'en': 'Employing History',
      'tl': '',
    },
    'gtzfruw8': {
      'en': 'Videos',
      'tl': '',
    },
    'c4k76lgz': {
      'en': 'Settings',
      'tl': '',
    },
    'riospm9i': {
      'en': 'Notifications',
      'tl': '',
    },
    's0ylsfsj': {
      'en': 'Log out',
      'tl': '',
    },
  },
  // MakeAJobDesicription
  {
    'uv3ggjy5': {
      'en': 'Post a Job',
      'tl': '',
    },
    '6zdvsrxf': {
      'en': 'Job Title',
      'tl': '',
    },
    'z4xxlrw2': {
      'en': 'Enter job title',
      'tl': '',
    },
    '822nqo4i': {
      'en': 'Job Description',
      'tl': '',
    },
    '8g2yvem3': {
      'en': 'Enter job description',
      'tl': '',
    },
    'a6kw5cqz': {
      'en': 'Location',
      'tl': '',
    },
    '6x54v546': {
      'en': 'Enter job location',
      'tl': '',
    },
    'x4ro74ll': {
      'en': 'Salary',
      'tl': '',
    },
    '7lpdma1d': {
      'en': 'Enter salary',
      'tl': '',
    },
    'buggm2dq': {
      'en': 'Post Job',
      'tl': '',
    },
  },
  // videoComponent
  {
    'm5uqc1n0': {
      'en': 'Play',
      'tl': '',
    },
  },
  // pendingpage
  {
    'sjlherlh': {
      'en':
          'thank you for choosing JAAP just wait for 2 to 3 buisness day while we are verifying your documents that youve send',
      'tl': '',
    },
    'pv4bncj3': {
      'en': '\nwe will send the confirmation on your',
      'tl': '',
    },
    '3m1ospz8': {
      'en': 'Email',
      'tl': '',
    },
    'u1wypw6b': {
      'en': '\nthank you very much',
      'tl': '',
    },
  },
  // sidebarAdmin
  {
    '0zcgfshi': {
      'en': 'JAAP - Admin',
      'tl': '',
    },
    'yucf2ogk': {
      'en': 'Platform Navigation',
      'tl': '',
    },
    '3j9ew90d': {
      'en': 'Applicants',
      'tl': '',
    },
    'tc0930rq': {
      'en': 'Agencies',
      'tl': '',
    },
    'w5ysk5sc': {
      'en': 'Videos',
      'tl': '',
    },
    'pbl1te3a': {
      'en': 'Agency Videos',
      'tl': '',
    },
    '8rtor3wj': {
      'en': 'Payments ',
      'tl': '',
    },
    '60s671c2': {
      'en': 'Subscriptions',
      'tl': '',
    },
    '2o2urj3e': {
      'en': 'Settings',
      'tl': '',
    },
    'icerlad8': {
      'en': 'Settings',
      'tl': '',
    },
    '09t26jb3': {
      'en': 'Notifications',
      'tl': '',
    },
    '7bk855e9': {
      'en': 'Log out',
      'tl': '',
    },
  },
  // chat_ThreadComponent
  {
    'l6fc1if0': {
      'en': 'Start typing here...',
      'tl': '',
    },
    '9jpgzr38': {
      'en': 'You must enter a message...',
      'tl': '',
    },
    'nfwqk2k0': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // empty_state_Simple
  {
    '7smgkjqu': {
      'en': 'No featured Jobs',
      'tl': '',
    },
  },
  // user_ListSmall
  {
    'wnrev0lf': {
      'en': 'ME',
      'tl': '',
    },
  },
  // deleteDialog
  {
    'q2tn4alb': {
      'en': 'Options',
      'tl': '',
    },
    '983r1d84': {
      'en': 'Invite Users',
      'tl': '',
    },
    'zdszqjc4': {
      'en': 'Delete Chat',
      'tl': '',
    },
    '32p5cpeb': {
      'en': 'Confirm Delete',
      'tl': '',
    },
    'vagpcrjo': {
      'en': 'You can\'t undo this action.',
      'tl': '',
    },
    '6o4818v7': {
      'en': 'Delete',
      'tl': '',
    },
  },
  // paymentDialogApplicant
  {
    '9zl4d6nq': {
      'en': 'Subscribe now for more access',
      'tl': '',
    },
    'ufb77aj8': {
      'en': 'Monthly',
      'tl': '',
    },
    '14551cxi': {
      'en': 'Select payment method',
      'tl': '',
    },
    'ueeokue6': {
      'en': 'Card number',
      'tl': '',
    },
    'xo1ai1cz': {
      'en': 'Exp. Date',
      'tl': '',
    },
    'as5ieqnn': {
      'en': 'CVV',
      'tl': '',
    },
    'x75f9g0f': {
      'en': 'Price Breakdown',
      'tl': '',
    },
    'i3hmlus9': {
      'en': 'Total',
      'tl': '',
    },
    'p4d6mfa6': {
      'en': 'Pay w/ Credit Card',
      'tl': '',
    },
    'li660x8z': {
      'en': 'Or use an option below',
      'tl': '',
    },
    'jqyly10h': {
      'en': 'Pay w/Paypal',
      'tl': '',
    },
    '7gkev4cb': {
      'en': 'Field is required',
      'tl': '',
    },
    'unrjmvc4': {
      'en': 'Invalid card number',
      'tl': '',
    },
    'smi1t4k3': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'hqxpt1h6': {
      'en': 'Field is required',
      'tl': '',
    },
    'gclrmteh': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '3ev4hqsy': {
      'en': 'Field is required',
      'tl': '',
    },
    'l96zp33b': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'c8wm8h4a': {
      'en': 'Gcash #',
      'tl': '',
    },
    'atn6eh2s': {
      'en': 'Gcash',
      'tl': '',
    },
    'otwen5re': {
      'en': 'Field is required',
      'tl': '',
    },
    'e3dny8g4': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // applicationRow
  {
    'sdxnca2s': {
      'en': 'View Application',
      'tl': '',
    },
  },
  // applicantProfileViewComponent
  {
    '90r515d7': {
      'en': 'Personal Information',
      'tl': '',
    },
    'ht9qgb17': {
      'en': '\nAddress',
      'tl': '',
    },
    'yfp4ajrm': {
      'en': 'birthplace',
      'tl': '',
    },
    '486xtru0': {
      'en': 'birthday',
      'tl': '',
    },
    'gpse1ntj': {
      'en': 'Resume',
      'tl': '',
    },
    '5o2i6cro': {
      'en': '',
      'tl': '',
    },
    'evgx1zpe': {
      'en': 'Work ID',
      'tl': '',
    },
    '5yosodkz': {
      'en': 'Uploading an ID will begin the approval for deployment process.',
      'tl': '',
    },
    '9pyadmeu': {
      'en': 'Download Work ID',
      'tl': '',
    },
    'db4o0f4e': {
      'en': 'Ratings',
      'tl': '',
    },
    'mtcxw029': {
      'en': 'Read the previous reviews agencies have left for this applicant.',
      'tl': '',
    },
    'pyaa8i27': {
      'en': 'Approve application',
      'tl': '',
    },
    'iwgbddq6': {
      'en': 'Reject application',
      'tl': '',
    },
    'tl3tdq3c': {
      'en': 'Terminate this employee',
      'tl': '',
    },
    'x0ebpe20': {
      'en': 'This applicant is no longer available, and currently employed',
      'tl': '',
    },
  },
  // paymentDialogAgency
  {
    'es056dh7': {
      'en': 'Boost this post',
      'tl': '',
    },
    '62hxqdiw': {
      'en': 'Monthly',
      'tl': '',
    },
    'v4peaq5f': {
      'en': 'Select payment method',
      'tl': '',
    },
    '3ez0p9b1': {
      'en': 'Card number',
      'tl': '',
    },
    '960aqx42': {
      'en': 'Exp. Date',
      'tl': '',
    },
    '984cwz8p': {
      'en': 'CVV',
      'tl': '',
    },
    'tkqfrn8p': {
      'en': 'Price Breakdown',
      'tl': '',
    },
    'jtpzriec': {
      'en': 'Total',
      'tl': '',
    },
    'mb8p7ljh': {
      'en': 'Pay w/ Credit Card',
      'tl': '',
    },
    'mi3e3pys': {
      'en': 'Or use an option below',
      'tl': '',
    },
    'zfv9jd6z': {
      'en': 'Pay w/Paypal',
      'tl': '',
    },
    '0qms7ce3': {
      'en': 'Field is required',
      'tl': '',
    },
    'bo8t870a': {
      'en': 'Invalid card number',
      'tl': '',
    },
    '3c8mf6ge': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'p0dsjg77': {
      'en': 'Field is required',
      'tl': '',
    },
    '2idrxew5': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '8v3ds7e7': {
      'en': 'Field is required',
      'tl': '',
    },
    'zktvup87': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '8c2djwa8': {
      'en': 'Gcash #',
      'tl': '',
    },
    'hv0w1s40': {
      'en': 'Gcash',
      'tl': '',
    },
    'g3kelvrj': {
      'en': 'Field is required',
      'tl': '',
    },
    '5hbo149s': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
  },
  // reviewAgencyComponent
  {
    'jfmcypcd': {
      'en': 'Comment...',
      'tl': '',
    },
    'nq4ug0ux': {
      'en': 'Field is required',
      'tl': '',
    },
    '1r3njtes': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '62vulzhu': {
      'en': 'Cancel',
      'tl': '',
    },
    'u9sn6pie': {
      'en': 'Rate Now',
      'tl': '',
    },
  },
  // reviewApplicantComponent
  {
    's9mm3f47': {
      'en': 'Comment...',
      'tl': '',
    },
    '5iu3slk7': {
      'en': 'Field is required',
      'tl': '',
    },
    'xv3awda6': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    '0arxm4og': {
      'en': 'Cancel',
      'tl': '',
    },
    'zkkxjwmb': {
      'en': 'Rate Now',
      'tl': '',
    },
  },
  // agencyProfileViewComponent
  {
    '1g2pawru': {
      'en': 'Agency Information',
      'tl': '',
    },
    'milcoqtb': {
      'en': 'About Us',
      'tl': '',
    },
    'wpbfgj3m': {
      'en': '\n',
      'tl': '',
    },
  },
  // emptyChat
  {
    '6m4jv985': {
      'en': 'No messages yet',
      'tl': '',
    },
  },
  // newComment
  {
    'wtq0t1bt': {
      'en': 'Write something...',
      'tl': '',
    },
    'bb74ozs3': {
      'en': 'Post',
      'tl': '',
    },
  },
  // termsOfService
  {
    'nku3mvsv': {
      'en': 'Terms of Service',
      'tl': '',
    },
  },
  // sideNavGeust
  {
    'edrlzn5r': {
      'en': 'Platform Navigation',
      'tl': '',
    },
    'ags2lvui': {
      'en': 'Log in',
      'tl': '',
    },
  },
  // jobFilters
  {
    'ry7c4ual': {
      'en': 'Country',
      'tl': '',
    },
    'sg759o59': {
      'en': 'Option 1',
      'tl': '',
    },
    'ypk4qew3': {
      'en': 'Option 2',
      'tl': '',
    },
    'v6lyi88n': {
      'en': 'Option 3',
      'tl': '',
    },
    'rr83mjhx': {
      'en': 'Select Country...',
      'tl': '',
    },
    'xhq6soqz': {
      'en': 'Search Country...',
      'tl': '',
    },
    'm6u7anfb': {
      'en': 'Clear',
      'tl': '',
    },
    '8jf23cmz': {
      'en': 'Job Type',
      'tl': '',
    },
    'r6w9kvk4': {
      'en': 'Option 1',
      'tl': '',
    },
    'pqqbrf8p': {
      'en': 'Option 2',
      'tl': '',
    },
    'bffaq51c': {
      'en': 'Option 3',
      'tl': '',
    },
    'upsko58c': {
      'en': 'Select Job type...',
      'tl': '',
    },
    '8ty81zik': {
      'en': 'Search Job type...',
      'tl': '',
    },
    '4aege7hp': {
      'en': 'Clear',
      'tl': '',
    },
    '2pv1xcb1': {
      'en': 'Company',
      'tl': '',
    },
    's5m2n3m5': {
      'en': 'Option 1',
      'tl': '',
    },
    'oboec8vg': {
      'en': 'Option 2',
      'tl': '',
    },
    '93jxj933': {
      'en': 'Option 3',
      'tl': '',
    },
    'sfaxf50s': {
      'en': 'Select Company...',
      'tl': '',
    },
    'v2z3pm9u': {
      'en': 'Search company...',
      'tl': '',
    },
    '8trhbk6t': {
      'en': 'Clear',
      'tl': '',
    },
    'zqeu64mx': {
      'en': 'Date posted',
      'tl': '',
    },
    'rlh4sz9v': {
      'en': 'Any time',
      'tl': '',
    },
    'j0wm97sp': {
      'en': 'Today',
      'tl': '',
    },
    'r1ngheiu': {
      'en': 'Last 3 days',
      'tl': '',
    },
    'uqvqaz4v': {
      'en': 'Last 7 days',
      'tl': '',
    },
    'pru6pt4e': {
      'en': 'Last 14 days',
      'tl': '',
    },
    '6xgdknse': {
      'en': 'Last 30 days',
      'tl': '',
    },
    'tvby3stp': {
      'en': 'Close',
      'tl': '',
    },
    'pbue06a7': {
      'en': 'Filter Jobs',
      'tl': '',
    },
  },
  // commentsToEmployer
  {
    'mhw3vvf6': {
      'en': 'Feedback',
      'tl': '',
    },
    'g5mc7nqd': {
      'en': 'A',
      'tl': '',
    },
  },
  // emptyResult
  {
    'jgmmf97n': {
      'en': 'No result',
      'tl': '',
    },
    'zq2p32tb': {
      'en': 'It seems that there\'s no record result',
      'tl': '',
    },
  },
  // commentsToApplicant
  {
    'sscep2h3': {
      'en': 'Feedback',
      'tl': '',
    },
    'osmte9ok': {
      'en': 'A',
      'tl': '',
    },
  },
  // commentDialog
  {
    '1nuokgxr': {
      'en': 'Write something...',
      'tl': '',
    },
    'yuemslxn': {
      'en': 'Field is required',
      'tl': '',
    },
    'l7218hxl': {
      'en': 'Please choose an option from the dropdown',
      'tl': '',
    },
    'icn06f1c': {
      'en': 'Post',
      'tl': '',
    },
  },
  // Miscellaneous
  {
    'n4gyc9sy': {
      'en': '',
      'tl': '',
    },
    'v2u81w5a': {
      'en': '',
      'tl': '',
    },
    'spviohm7': {
      'en': '',
      'tl': '',
    },
    '695qkuwb': {
      'en': '',
      'tl': '',
    },
    '2z7oypqf': {
      'en': '',
      'tl': '',
    },
    'zuxjv27b': {
      'en': '',
      'tl': '',
    },
    'fgvhuxne': {
      'en': '',
      'tl': '',
    },
    'ycd8vp49': {
      'en': '',
      'tl': '',
    },
    '3b0t0me4': {
      'en': '',
      'tl': '',
    },
    'y7l8dc6i': {
      'en': '',
      'tl': '',
    },
    'jtnu30yy': {
      'en': '',
      'tl': '',
    },
    '13q78k38': {
      'en': '',
      'tl': '',
    },
    'kvg6o2p2': {
      'en': '',
      'tl': '',
    },
    'iqff17st': {
      'en': '',
      'tl': '',
    },
    'er9dwe0h': {
      'en': '',
      'tl': '',
    },
    '9x5fpsb4': {
      'en': '',
      'tl': '',
    },
    '1gidvrhm': {
      'en': '',
      'tl': '',
    },
    'lf2ykyan': {
      'en': '',
      'tl': '',
    },
    '3wjo45qy': {
      'en': '',
      'tl': '',
    },
    'lkn9r09h': {
      'en': '',
      'tl': '',
    },
    '282h5kbd': {
      'en': '',
      'tl': '',
    },
    'brw5utzr': {
      'en': '',
      'tl': '',
    },
    'adkhen2i': {
      'en': '',
      'tl': '',
    },
    'h339fkgs': {
      'en': '',
      'tl': '',
    },
    'ivh3i2aw': {
      'en': '',
      'tl': '',
    },
    'c0nik947': {
      'en': '',
      'tl': '',
    },
    '8to28rqb': {
      'en': '',
      'tl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
