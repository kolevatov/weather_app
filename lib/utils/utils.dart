import 'package:intl/intl.dart';

class Utils {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, y').format(dateTime);
  }
}
