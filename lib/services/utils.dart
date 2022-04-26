import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime? date) {
    return date != null ? DateFormat('dd/MM/yyyy hh:mm').format(date) : '';
  }
}
