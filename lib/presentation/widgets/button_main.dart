import 'package:flutter/material.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/presentation/fonts.dart';

class ButtonMain extends StatelessWidget {
  const ButtonMain({Key? key, required this.text, required this.onClick})
      : super(key: key);

  final String text;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return LightThemeColors.blue
                .withRed((Theme.of(context).primaryColor.red * 0.95).round())
                .withGreen(
                    (Theme.of(context).primaryColor.green * 0.95).round())
                .withBlue((Theme.of(context).primaryColor.blue * 0.95).round());
          }

          return LightThemeColors.blue;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Center(
            child: Text(
          text,
          style: LightTextTheme.pin.copyWith(color: LightThemeColors.maincolor),
        )),
      ),
    );
  }
}
