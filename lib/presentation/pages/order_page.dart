import 'dart:math';

// ignore: unnecessary_import
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/presentation/fonts.dart';
import 'package:test_app_effective/presentation/routes/app_routes.gr.dart';
import 'package:test_app_effective/presentation/widgets/button_main.dart';

@RoutePage()
class OrderPage extends StatelessWidget {
  const OrderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Material(
            type: MaterialType.transparency,
            child: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  leading: Material(
                      color: LightThemeColors.maincolor,
                      surfaceTintColor: Colors.transparent,
                      child: IconButton(
                        color: LightThemeColors.maincolor,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () => context.router.pop(),
                      )),
                  border: Border.all(color: LightThemeColors.maincolor),
                  backgroundColor: LightThemeColors.maincolor,
                  middle: Text(
                    "Заказ оплачен",
                    style: LightTextTheme.appBar.copyWith(
                      color: LightThemeColors.text,
                    ),
                  ),
                ),
                backgroundColor: LightThemeColors.maincolor,
                child: CustomScrollView(slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                  Center(
                                      child: Container(
                                          width: 94,
                                          height: 94,
                                          decoration: BoxDecoration(
                                              color: LightThemeColors
                                                  .backgroundMain,
                                              borderRadius:
                                                  BorderRadius.circular(1000)),
                                          child: Image.asset(
                                              'assets/images/order.png'))),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 32),
                                    child: Text(
                                      "Ваш заказ принят в работу",
                                      style: LightTextTheme.expansionButton
                                          .copyWith(
                                              color: LightThemeColors.text),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 23, right: 23),
                                    child: Text(
                                      "Подтверждение заказа №${Random().nextInt(100000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
                                      style: LightTextTheme.text.copyWith(
                                          color: LightThemeColors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ])),
                            Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: LightThemeColors.maincolor,
                                    border: Border(
                                      top: BorderSide(
                                        width: 1,
                                        color:
                                            LightThemeColors.buttonbottomborder,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 12,
                                          bottom: 15),
                                      child: SizedBox(
                                          width: 343,
                                          height: 48,
                                          child: ButtonMain(
                                            text: 'Супер!',
                                            onClick: () {
                                              context.router
                                                  .popUntilRouteWithName(
                                                      HomeRoute.name);
                                            },
                                          ))),
                                )),
                          ]))
                ]))));
  }
}
