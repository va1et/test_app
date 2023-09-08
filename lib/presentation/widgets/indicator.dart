import 'package:flutter/material.dart';
import 'package:test_app_effective/colors.dart';

class Indicator extends StatelessWidget {
  const Indicator(
      {Key? key,
      required this.isActive,
      required this.index,
      required this.activeindex})
      : super(key: key);

  final bool isActive;
  final int index;
  final int activeindex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: index > 0
          ? const EdgeInsets.only(
              left: 5,
            )
          : EdgeInsets.zero,
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: isActive
            ? LightThemeColors.text
            : index - activeindex == 1
                ? LightThemeColors.grey2
                : index - activeindex == 2
                    ? LightThemeColors.grey3
                    : index - activeindex == 3
                        ? LightThemeColors.grey4
                        : index - activeindex == 4
                            ? LightThemeColors.grey5
                            : LightThemeColors.grey2,
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        // boxShadow: <BoxShadow>[
        //   isActive
        //       ? BoxShadow(
        //           color: Colors.black.withOpacity(0.25),
        //           offset: const Offset(0.0, 2.0),
        //           blurRadius: 4.0,
        //         )
        //       : const BoxShadow(color: Colors.transparent),
        // ],
      ),
    );
  }
}
