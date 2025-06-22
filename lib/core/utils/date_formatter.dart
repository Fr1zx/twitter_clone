import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  static String formatDateFromString(String dateString) {
    final date = DateFormat('yyyy-MM-dd').parse(dateString);
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }
}
