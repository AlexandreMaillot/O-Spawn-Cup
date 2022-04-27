import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:o_spawn_cup/services/utils.dart';

void main() {
  final dateNow = DateTime.now();

  test('formater une date', () {
    expect(
      Utils.formatDate(dateNow),
      DateFormat('dd/MM/yyyy hh:mm').format(dateNow),
    );
  });
}
