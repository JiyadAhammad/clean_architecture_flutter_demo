import 'package:intl/intl.dart';

extension NumExtensions on num {
  String toCurrency({String symbol = '₹'}) {
    return NumberFormat.currency(symbol: symbol, decimalDigits: 2).format(this);
  }

  String get compact {
    return NumberFormat.compact().format(this);
  }

  bool get isZero => this == 0;

  bool get isPositive => this > 0;

  bool get isNegative => this < 0;
}
