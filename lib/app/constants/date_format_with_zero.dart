import 'package:intl/intl.dart';

String dateFormatWithZero(DateTime time) {
  return DateFormat("H:m").format(time);
}
