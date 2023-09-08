import 'package:flutter/material.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/presentation/fonts.dart';

class TouristAddButton extends StatelessWidget {
  const TouristAddButton({Key? key, required this.onClick}) : super(key: key);

  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: LightThemeColors.maincolor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: InkWell(
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Добавить туриста",
                  style: LightTextTheme.expansionButton
                      .copyWith(color: LightThemeColors.text),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: LightThemeColors.blue),
                  child: const Icon(
                    Icons.add,
                    color: LightThemeColors.maincolor,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
