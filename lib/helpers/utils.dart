import 'package:intl/intl.dart';

formatCurrency(double value) {
  final formatter = new NumberFormat("#,##0.00", "en_US");
  return formatter.format(value);
}
