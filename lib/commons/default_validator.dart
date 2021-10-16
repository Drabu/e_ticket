import 'labels.dart';

String? defaultValidator(String? input) =>
    (input?.isEmpty ?? true) ? L.field_blank_valdiator : null;
