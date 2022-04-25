import 'dart:math';

import 'package:intl/intl.dart';

class Utils {
  int? numRound = 0;

  String generateCode(String beforeCode, int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final _rnd = Random();

    return beforeCode +
        String.fromCharCodes(
          Iterable.generate(
            length,
            (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
          ),
        );
  }

  String formatDate(DateTime? date) {
    return date != null ? DateFormat('dd/MM/yyyy').add_Hm().format(date) : '';
  }
}
