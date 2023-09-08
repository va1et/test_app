import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/presentation/fonts.dart';

class LabelledInputPhone extends StatefulWidget {
  final Function(String?)? onChanged;
  final String? error;
  final String? value;
  final TextInputFormatter? input;
  final TextEditingController controller;
  const LabelledInputPhone(
      {Key? key,
      required this.controller,
      this.input,
      this.error,
      this.onChanged,
      this.value})
      : super(key: key);

  @override
  State<LabelledInputPhone> createState() => _LabelledInputPhoneState();
}

class _LabelledInputPhoneState extends State<LabelledInputPhone> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 52,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          inputFormatters: [widget.input!],
          controller: widget.controller,
          style: LightTextTheme.text.copyWith(color: LightThemeColors.text),
          onTap: () {},
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "**) ***-**-**",
            label: Text(
              "Номер телефона",
              style: LightTextTheme.smalllabel
                  .copyWith(color: LightThemeColors.inputtitle),
            ),
            errorMaxLines: 2,
            errorText: "Неккоректный номер телефона",

            contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 10),

            alignLabelWithHint: true,
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: LightThemeColors.inputbackground),
                borderRadius: BorderRadius.circular(15.0)),
            filled: true,
            fillColor: widget.error == null
                ? LightThemeColors.inputbackground
                : LightThemeColors.inputbackground,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: LightThemeColors.inputbackground),
            ),
            // enabledBorder: UnderlineInputBorder(
            //   borderRadius: BorderRadius.circular(12.0),
            //   borderSide: BorderSide(color: Theme.of(context).cardColor),
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: LightThemeColors.inputbackground),
            ),
            // border: const UnderlineInputBorder(

            //   borderSide: BorderSide(color: Colors.green),
            // ),
          ),
        ),
      ],
    ));
  }
}

class PhoneTextFormatter extends TextInputFormatter {
  final phoneMask = '00) 000-00-00';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = StringBuffer("");
    var text = newValue.text
        .replaceAll('+', '')
        .replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .toUpperCase();

    if (text.length > 1 && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length);
    }

    var readPosition = 0;
    for (var i = 0; i < phoneMask.length; i++) {
      if (readPosition > text.length - 1) {
        break;
      }
      var curSymbol = phoneMask[i];

      if (isZeroSymbol(curSymbol)) {
        curSymbol = text[readPosition];

        readPosition++;
      }

      result.write(curSymbol);
      // print(result);
    }
    final textResult = result.toString();
    return TextEditingValue(
      text: textResult,
      selection: TextSelection.collapsed(
        offset: textResult.length,
      ),
    );
  }

  bool isZeroSymbol(String symbol) => symbol == "0";
}

class TimeTextFormatter extends TextInputFormatter {
  final phoneMask = '00:00';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = StringBuffer();
    var text =
        newValue.text.replaceAll(':', '').replaceAll(' ', '').toUpperCase();
    if (text.length > 1 && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length);
    }
    var readPosition = 0;
    for (var i = 0; i < phoneMask.length; i++) {
      if (readPosition > text.length - 1) {
        break;
      }
      var curSymbol = phoneMask[i];
      if (isZeroSymbol(curSymbol)) {
        curSymbol = text[readPosition];
        readPosition++;
      }
      result.write(curSymbol);
    }
    final textResult = result.toString();
    return TextEditingValue(
      text: textResult,
      selection: TextSelection.collapsed(
        offset: textResult.length,
      ),
    );
  }

  bool isZeroSymbol(String symbol) => symbol == "0";
}

class DateTextFormatter extends TextInputFormatter {
  final phoneMask = '00.00.0000';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final result = StringBuffer();
    var text =
        newValue.text.replaceAll('.', '').replaceAll(' ', '').toUpperCase();
    if (text.length > 1 && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length);
    }
    var readPosition = 0;
    for (var i = 0; i < phoneMask.length; i++) {
      if (readPosition > text.length - 1) {
        break;
      }
      var curSymbol = phoneMask[i];
      if (isZeroSymbol(curSymbol)) {
        curSymbol = text[readPosition];
        readPosition++;
      }
      result.write(curSymbol);
    }
    final textResult = result.toString();
    return TextEditingValue(
      text: textResult,
      selection: TextSelection.collapsed(
        offset: textResult.length,
      ),
    );
  }

  bool isZeroSymbol(String symbol) => symbol == "0";
}

class PhoneNumberMaskFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    // Оставляем только цифры из введенного текста
    final digits = text.replaceAll(RegExp(r'\D'), '');

    // Применяем маску к номеру телефона
    String maskedText = '+7 ';

    for (int i = 0; i < digits.length; i++) {
      if (i == 1) {
        maskedText += '(${digits[i]}';
      } else if (i == 4) {
        maskedText += '${digits[i]}) ';
      } else if (i == 7) {
        maskedText += '${digits[i]}-';
      } else {
        maskedText += '*';
      }
    }

    return newValue.copyWith(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }
}
