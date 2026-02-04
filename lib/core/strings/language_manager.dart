class LanguageManager {
  LanguageManager._private();
  static final LanguageManager instance = LanguageManager._private();

  String _lang = 'en';
  String get lang => _lang;

  void updateLanguage(String newLang) {
    _lang = newLang;
  }
}