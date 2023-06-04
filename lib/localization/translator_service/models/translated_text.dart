import 'package:html_unescape/html_unescape.dart';

class TranslatedText {
  final String text;
  final String language;

  const TranslatedText({required this.text, required this.language});

  factory TranslatedText.fromMap(Map<String, dynamic> json) => TranslatedText(
        text: HtmlUnescape()
            .convert(json['translatedText'])
            .replaceAll('"', "'")
            .replaceAll(' ', ''),
        language: json['detectedSourceLanguage'],
      );

  static List<TranslatedText> resolveList(List<dynamic> json) =>
      json.map((e) => TranslatedText.fromMap(e)).toList();

  @override
  String toString() {
    return text;
  }
}
