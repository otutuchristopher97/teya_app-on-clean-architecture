import 'dart:io';

import 'package:teya/localization/translations/en_us.dart';
import './models/translated_text.dart';
import './translator.dart';

void main() {
  final languages = [
    'es', //Spanish US
  ];

  for (final lang in languages) {
    translate(lang);
  }
}

void translate(String lang) async {
  final texts = <String>[];
  for (final value in enUs.values) {
    texts.add(value);
  }

  late final List<TranslatedText> items;
  try {
    items = await Translator.it.translate(texts, lang);
  } catch (e) {
    return;
  }
  final file = File('../../../lib/localization/translations/$lang.dart');
  final sink = file.openWrite();
  sink.writeln('// ignore_for_file: prefer_single_quotes');
  sink.writeln('const lang${lang.toUpperCase()} = <String, String>{');

  final keys = enUs.keys.toList();
  for (int i = 0; i < items.length; i++) {
    final key = keys[i];
    final value = items[i].text;

    sink.writeln('  "$key": """$value""",');
  }
  sink.writeln('};');

  await sink.close();
}
