import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime? datetime = DateTime.tryParse(date);
  if (datetime == null) return 'Data desconhecida';
  return DateFormat("d 'de' MMM 'de' y", "pt_BR").format(datetime);
}
