import 'package:flutter/material.dart';

void showCustomDateDialog({
  required DateTime? initialDate,
  required BuildContext context,
  required Function(DateTime? date) callback,
}) {
  showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  ).then((date) {
    callback(date);
  });
}

