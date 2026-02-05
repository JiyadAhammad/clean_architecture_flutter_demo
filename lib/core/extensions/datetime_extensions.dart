import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get readableDate {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String get readableDateTime {
    return DateFormat('dd MMM yyyy, hh:mm a').format(this);
  }

  String get time12h {
    return DateFormat('hh:mm a').format(this);
  }

  String get apiFormat {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}
