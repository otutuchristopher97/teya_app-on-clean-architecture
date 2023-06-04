import 'package:get/get.dart';

import 'package:teya/localization/translations/en_us.dart';
import 'package:teya/localization/translations/es.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'es': es,
      };
}
