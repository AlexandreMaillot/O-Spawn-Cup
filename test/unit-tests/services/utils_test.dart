import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:o_spawn_cup/services/utils.dart';

void main() {
  late Utils utils;
  final dateNow = DateTime.now();
  setUp(() {
    utils = Utils();
  });
  test('formater une date', () {
    expect(
      Utils.formatDate(dateNow),
      DateFormat('dd/MM/yyyy hh:mm').format(dateNow),
    );
  });
}
