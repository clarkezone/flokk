import 'package:intl/intl.dart';

class DateFormats {
  static DateFormat google = DateFormat.yMd();

  /*
    if today, return the time only
    if yesterday "yesterday"
    if any time in the past 7 days return the day name
    beyond 7 days ago return the date in the provided format
  */
  static String friendlyDateTime(DateTime date, String dateFormatToReturn) {
    if (date == null) throw Exception(); // Should be invalid argument exception

    final today = DateTime.now();
    final todayString = DateFormat('MM/dd/yyy').format(today).toString();
    final dateOnly = DateFormat('MM/dd/yyy').format(date).toString();

    if (dateOnly == todayString) {
      return DateFormat('h:mm a').format(date);
    } else if (dateOnly ==
        DateFormat('MM/dd/yyy')
            .format(today.subtract(Duration(days: 1)))
            .toString()) {
      return "Yesterday";
    } else if (today.difference(date).inDays < 7) {
      return DateFormat('EEEE').format(date);
    } else {
      return DateFormat(dateFormatToReturn).format(date);
    }
  }
}
