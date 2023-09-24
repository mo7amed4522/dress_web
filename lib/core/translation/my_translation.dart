import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'start': 'مرحبا بك في My Dresses',
        },
        'en': {
          'start': 'Welcome at My Dresses',
        }
      };
}
