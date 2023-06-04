import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

import './models/translated_text.dart';

class Translator {
  // ignore: constant_identifier_names
  static const _API_KEY = '';

  static Translator? _instance;

  static Translator get it => _instance ??= Translator();

  Future<List<TranslatedText>> translate(List<String> texts, String to) async {
    const chunkSize = 100;

    final chunks = [];

    for (var i = 0; i < texts.length; i += chunkSize) {
      chunks.add(
        texts.sublist(
          i,
          i + chunkSize > texts.length ? texts.length : i + chunkSize,
        ),
      );
    }

    final items = <TranslatedText>[];

    for (final chunk in chunks) {
      final res = await _process(chunk, to);
      items.addAll(res);
    }
    return items;
  }

  Future<List<TranslatedText>> _process(List<String> texts, String to) async {
    final uri = Uri.parse(
      'https://translation.googleapis.com/language/translate/v2?key=$_API_KEY',
    );
    var body = jsonEncode({
      'q': texts,
      'target': to,
    });

    // add notranslate tag so it doesn't get translated by google
    body = body.replaceAllMapped(RegExp(r'@(\w+)'), (match) {
      return "<span class='notranslate'>${match.group(1)}</span>";
    });

    final res = await post(
      uri,
      body: body,
    );

    // remove spans
    final text = res.body.replaceAllMapped(
        RegExp(
          r"\\u003cspan class='notranslate'\\u003e(\w+)\\u003c/span\\u003e",
        ), (match) {
      return '@${match.group(1)}';
    });

    final Map<String, dynamic> json = jsonDecode(text);
    if (json['error'] != null) {
      throw Map.of(json['error'])['message'];
    }
    return TranslatedText.resolveList(Map.of(json['data'])['translations']);
  }
}
