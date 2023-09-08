import 'package:flutter/material.dart';
import 'package:test_app_effective/colors.dart';

// ignore: camel_case_extensions
extension extString on String {
  bool get isValidPhone {
    final phoneRegExp =
        RegExp(r'^[0-9]{2}[)][\s][0-9]{3}[-][0-9]{2}[-][0-9]{2}$');
    // r'^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

class ValidationModel {
  String? value;
  String? error;
  Color color;
  ValidationModel(this.value, this.error, this.color);
}

class FormProvider extends ChangeNotifier {
  ValidationModel _email =
      ValidationModel(null, null, LightThemeColors.inputbackground);
  ValidationModel _phone =
      ValidationModel(null, null, LightThemeColors.inputbackground);
  ValidationModel get email => _email;
  ValidationModel get phone => _phone;
  late BuildContext context;
  void getcontext(BuildContext cont) {
    context = cont;
  }

  void disposeValues() {
    _email = ValidationModel(null, null, LightThemeColors.inputbackground);
    _phone = ValidationModel(null, null, LightThemeColors.inputbackground);
  }

  void validateEmail(String? val) {
    if (val != null && val.isValidEmail) {
      _email = ValidationModel(val, null, LightThemeColors.inputbackground);
    } else if (val!.isEmpty) {
      _email = ValidationModel(null, "Поле пустое", LightThemeColors.error);
    } else {
      _email =
          ValidationModel(null, "Неправильный формат", LightThemeColors.error);
    }
    notifyListeners();
  }

  void validatePhone(String? val) {
    if (val != null && val.isValidPhone) {
      _phone = ValidationModel(val, null, LightThemeColors.inputbackground);
    } else if (val!.isEmpty) {
      _phone = ValidationModel(null, "Поле пустое", LightThemeColors.error);
    } else {
      _phone =
          ValidationModel(null, "Неправильный формат", LightThemeColors.error);
    }
    notifyListeners();
  }

  void changeColor() {
    if (_email.value == null) {
      _email.color = LightThemeColors.error;
    }
    if (_phone.value == null) {
      _phone.color = LightThemeColors.error;
    }
    notifyListeners();
  }

  bool get validate {
    return _email.value != null && _phone.value != null;

    // _name.value != null;
  }
}

class FormTouristProvider extends ChangeNotifier {
  List<ValidationModel> _name = [
    ValidationModel(null, null, LightThemeColors.inputbackground)
  ];
  List<ValidationModel> _surname = [
    ValidationModel(null, null, LightThemeColors.inputbackground)
  ];
  List<ValidationModel> _date = [
    ValidationModel(null, null, LightThemeColors.inputbackground)
  ];
  List<ValidationModel> _citizenship = [
    ValidationModel(null, null, LightThemeColors.inputbackground)
  ];
  List<ValidationModel> _paspnumber = [
    ValidationModel(null, null, LightThemeColors.inputbackground)
  ];
  List<ValidationModel> _passdate = [
    ValidationModel(null, null, LightThemeColors.inputbackground)
  ];

  List<ValidationModel> get name => _name;
  List<ValidationModel> get surname => _surname;
  List<ValidationModel> get date => _date;
  List<ValidationModel> get citizenship => _citizenship;
  List<ValidationModel> get paspnumber => _paspnumber;
  List<ValidationModel> get passdate => _passdate;
  late BuildContext context;
  void getcontext(BuildContext cont) {
    context = cont;
  }

  void disposeValues() {
    _name = [ValidationModel(null, null, LightThemeColors.inputbackground)];
    _surname = [ValidationModel(null, null, LightThemeColors.inputbackground)];
    _date = [ValidationModel(null, null, LightThemeColors.inputbackground)];
    _citizenship = [
      ValidationModel(null, null, LightThemeColors.inputbackground)
    ];
    _paspnumber = [
      ValidationModel(null, null, LightThemeColors.inputbackground)
    ];
    _passdate = [ValidationModel(null, null, LightThemeColors.inputbackground)];
  }

  void validateName(String? val, int number) {
    if (val!.isEmpty) {
      _name[number] = ValidationModel(null, null, LightThemeColors.error);
    } else {
      _name[number] =
          ValidationModel(val, null, LightThemeColors.inputbackground);
    }
    notifyListeners();
  }

  void addModel() {
    _name.add(ValidationModel(null, null, LightThemeColors.inputbackground));
    _surname.add(ValidationModel(null, null, LightThemeColors.inputbackground));
    _date.add(ValidationModel(null, null, LightThemeColors.inputbackground));
    _citizenship
        .add(ValidationModel(null, null, LightThemeColors.inputbackground));
    _paspnumber
        .add(ValidationModel(null, null, LightThemeColors.inputbackground));
    _passdate
        .add(ValidationModel(null, null, LightThemeColors.inputbackground));
  }

  void validateSurname(String? val, int number) {
    if (val!.isEmpty) {
      _surname[number] = ValidationModel(null, null, LightThemeColors.error);
    } else {
      _surname[number] =
          ValidationModel(val, null, LightThemeColors.inputbackground);
    }
    notifyListeners();
  }

  void validateDate(String? val, int number) {
    if (val!.isEmpty) {
      _date[number] = ValidationModel(null, null, LightThemeColors.error);
    } else {
      _date[number] =
          ValidationModel(val, null, LightThemeColors.inputbackground);
    }
    notifyListeners();
  }

  void validateCitizenship(String? val, int number) {
    if (val!.isEmpty) {
      _citizenship[number] =
          ValidationModel(null, null, LightThemeColors.error);
    } else {
      _citizenship[number] =
          ValidationModel(val, null, LightThemeColors.inputbackground);
    }
    notifyListeners();
  }

  void validatePassnumber(String? val, int number) {
    if (val!.isEmpty) {
      _paspnumber[number] = ValidationModel(null, null, LightThemeColors.error);
    } else {
      _paspnumber[number] =
          ValidationModel(val, null, LightThemeColors.inputbackground);
    }
    notifyListeners();
  }

  void validatePassdate(String? val, int number) {
    if (val!.isEmpty) {
      _passdate[number] = ValidationModel(null, null, LightThemeColors.error);
    } else {
      _passdate[number] =
          ValidationModel(val, null, LightThemeColors.inputbackground);
    }
    notifyListeners();
  }

  void changeColor() {
    for (int i = 0; i < _name.length; i++) {
      if (_name[i].value == null) {
        _name[i].color = LightThemeColors.error;
      }
      if (_surname[i].value == null) {
        _surname[i].color = LightThemeColors.error;
      }
      if (_date[i].value == null) {
        _date[i].color = LightThemeColors.error;
      }
      if (_citizenship[i].value == null) {
        _citizenship[i].color = LightThemeColors.error;
      }
      if (_paspnumber[i].value == null) {
        _paspnumber[i].color = LightThemeColors.error;
      }
      if (_passdate[i].value == null) {
        _passdate[i].color = LightThemeColors.error;
      }
    }
    notifyListeners();
  }

  bool get validate {
    return _name.every((element) => element.value != null) &&
        _surname.every((element) => element.value != null) &&
        _date.every((element) => element.value != null) &&
        _citizenship.every((element) => element.value != null) &&
        _paspnumber.every((element) => element.value != null) &&
        _passdate.every((element) => element.value != null);
  }
}
