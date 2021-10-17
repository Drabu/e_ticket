import 'package:flutter/material.dart';

void showCustomDateDialog({
  required DateTime? initialDate,
  required BuildContext context,
  required Function(DateTime? date) callback,
}) {
  showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1800),
    lastDate: DateTime(2030),
  ).then((date) {
    if (date != null) callback(date);
  });
}
