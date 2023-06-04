class Language {
  final String englishName, logoUrl, locale, shortName;
  bool isCurrent;
  Language({
    required this.englishName,
    required this.locale,
    required this.logoUrl,
    required this.shortName,
    this.isCurrent = false,
  });
}
