import 'package:intl/intl.dart';

class IntlConfig {
  static final formatCurrency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );
}