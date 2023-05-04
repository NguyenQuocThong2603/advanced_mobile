import 'package:intl/intl.dart';

String formatDateFromTimestamp(String format, int timestamp){
  return DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(timestamp));
}