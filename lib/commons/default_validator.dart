String? defaultValidator(String? input) =>
    (input?.isEmpty ?? true) ? 'Field can\'t be left blank' : null;
