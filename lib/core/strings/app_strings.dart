import 'language/ar_strings.dart';
import 'language/en_strings.dart';
import 'language_manager.dart';

class AppStrings {
  static String ar = 'ar';
  static String en = 'en';

  static String get appName => LanguageManager.instance.lang == ar
      ? ArStrings.appName
      : EnStrings.appName;

}
