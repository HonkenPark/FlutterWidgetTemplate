import 'package:intl/intl.dart';

bool isSameDay(DateTime date1, DateTime date2) {
  if (date1.year == date2.year && date1.month == date2.month && date1.day == date2.day) {
    return true;
  } else {
    return false;
  }
}

int getLastDayofSelectedMonth(DateTime date) {
  int month = date.month + 1 > 12 ? 1 : date.month + 1;
  int year = month == 1 ? date.year + 1 : date.year;

  DateTime lastDate = DateTime(year, month, 0);
  return lastDate.day;
}
