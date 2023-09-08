// ignore_for_file: unnecessary_import

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:test_app_effective/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:test_app_effective/presentation/fonts.dart';
import 'package:test_app_effective/presentation/routes/app_routes.gr.dart';
import 'package:test_app_effective/presentation/widgets/button_main.dart';
import 'package:test_app_effective/presentation/widgets/indicator.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selectedindex = 0;
  final controller = PageController();
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i == selectedindex
          ? Indicator(
              isActive: true,
              index: i,
              activeindex: selectedindex,
            )
          : Indicator(
              isActive: false,
              index: i,
              activeindex: selectedindex,
            ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              border: Border.all(color: LightThemeColors.maincolor),
              backgroundColor: LightThemeColors.maincolor,
              middle: Text(
                "Отель",
                style: LightTextTheme.appBar.copyWith(
                  color: LightThemeColors.text,
                ),
              ),
            ),
            backgroundColor: LightThemeColors.backgroundMain,
            child: BlocBuilder<HotelBloc, HotelState>(
                builder: (context, state) => state.when(
                    loadingSuccess: (hotel) {
                      final pages = List.generate(
                          hotel.images.length,
                          (index) => ExtendedImage.network(hotel.images[index],
                                  fit: BoxFit.cover,
                                  cache: false,
                                  borderRadius: BorderRadius.circular(15.0),
                                  loadStateChanged: (ExtendedImageState state) {
                                switch (state.extendedImageLoadState) {
                                  case LoadState.loading:
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Shimmer.fromColors(
                                        baseColor: const Color(0xffEBEBF4),
                                        highlightColor: const Color(0xFFFFFFFF),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          color: Theme.of(context).cardColor,
                                        ),
                                      ),
                                    );
                                  case LoadState.completed:
                                    return ClipRect(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              shape: BoxShape.rectangle),
                                          child: ExtendedRawImage(
                                            fit: BoxFit.cover,
                                            height: 250,
                                            width: double.infinity,
                                            image:
                                                state.extendedImageInfo?.image,
                                          )),
                                    );
                                  case LoadState.failed:
                                    return GestureDetector(
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Text(
                                              "Ошибка при загрузке изображения. Нажмите, чтобы перезагрузить",
                                              textAlign: TextAlign.center,
                                              style: LightTextTheme.text
                                                  .copyWith(
                                                      color: LightThemeColors
                                                          .text),
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        state.reLoadImage();
                                      },
                                    );
                                }
                              }));
                      return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(children: [
                            Container(
                                decoration: const BoxDecoration(
                                    color: LightThemeColors.maincolor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 257,
                                              child: Stack(children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: PageView.builder(
                                                            onPageChanged:
                                                                (int page) {
                                                              setState(() {
                                                                selectedindex =
                                                                    page;
                                                              });
                                                            },
                                                            controller:
                                                                controller,
                                                            itemCount: hotel
                                                                .images.length,
                                                            pageSnapping: true,
                                                            itemBuilder: (context,
                                                                pagePosition) {
                                                              return pages[
                                                                  pagePosition %
                                                                      pages
                                                                          .length];
                                                            }))),
                                                Positioned.fill(
                                                    bottom: 10,
                                                    child: Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                            width: 75,
                                                            height: 17,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  LightThemeColors
                                                                      .maincolor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                            ),
                                                            child: Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    left: 8,
                                                                    right: 10),
                                                                child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children:
                                                                        _buildPageIndicator())
                                                                //     SmoothPageIndicator(
                                                                //   controller:
                                                                //       controller,
                                                                //   count: 5,
                                                                //   effect: const ScrollingDotsEffect(
                                                                //       spacing: 5,
                                                                //       dotHeight:
                                                                //           7,
                                                                //       dotWidth: 7,
                                                                //       activeDotScale:
                                                                //           1,
                                                                //       activeDotColor:
                                                                //           LightThemeColors
                                                                //               .text,
                                                                //       dotColor:
                                                                //           LightThemeColors
                                                                //               .grey2),
                                                                // ),
                                                                )))),
                                              ])),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: Container(
                                            height: 29,
                                            width: 149,
                                            decoration: BoxDecoration(
                                                color: LightThemeColors
                                                    .yellowlight,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(children: [
                                                  SvgPicture.asset(
                                                      'assets/icon/star.svg'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 2),
                                                    child: Text(
                                                      hotel.rating.toString(),
                                                      style: LightTextTheme.pin
                                                          .copyWith(
                                                              color:
                                                                  LightThemeColors
                                                                      .yellow),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 2),
                                                      child: Text(
                                                        hotel.ratingName!,
                                                        style: LightTextTheme
                                                            .pin
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .yellow),
                                                      )),
                                                ])),
                                          ),
                                        ),

                                        ///[check]
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(
                                              hotel.name!,
                                              style: LightTextTheme
                                                  .expansionButton
                                                  .copyWith(
                                                      color: LightThemeColors
                                                          .text),
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: TextButton(
                                            style: ButtonStyle(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: MaterialStateProperty.all(
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero))),
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.zero),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              foregroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color>((Set<
                                                              MaterialState>
                                                          states) {
                                                if (states.contains(
                                                    MaterialState.pressed)) {
                                                  return LightThemeColors.blue
                                                      .withRed((LightThemeColors
                                                                  .blue.red *
                                                              0.85)
                                                          .round())
                                                      .withGreen(
                                                          (LightThemeColors.blue
                                                                      .green *
                                                                  0.85)
                                                              .round())
                                                      .withBlue(
                                                          (LightThemeColors.blue
                                                                      .blue *
                                                                  0.85)
                                                              .round());
                                                }
                                                return LightThemeColors.blue;
                                              }),
                                            ),
                                            onPressed: () {},
                                            child: Text(hotel.adress!,
                                                style:
                                                    LightTextTheme.smallabout),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, bottom: 16),
                                            child: Row(
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "от ${hotel.minimalPrice} ₽",
                                                  style: LightTextTheme
                                                      .xLargeTitleMS
                                                      .copyWith(
                                                          color:
                                                              LightThemeColors
                                                                  .text),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: Text(
                                                      hotel.priceDescription!,
                                                      style: LightTextTheme.text
                                                          .copyWith(
                                                              color:
                                                                  LightThemeColors
                                                                      .grey),
                                                    )),
                                              ],
                                            ))
                                      ]),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: LightThemeColors.maincolor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: Text(
                                                  "Об отеле",
                                                  style: LightTextTheme
                                                      .expansionButton
                                                      .copyWith(
                                                          color:
                                                              LightThemeColors
                                                                  .text),
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: Wrap(
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  spacing: 8,
                                                  // runSpacing: 0.1,
                                                  children: List.generate(
                                                      hotel
                                                          .hotelAbout!
                                                          .peculiarities
                                                          .length, (index) {
                                                    return Chip(
                                                        backgroundColor:
                                                            LightThemeColors
                                                                .pincolor,
                                                        color: MaterialStateProperty
                                                            .all(
                                                                LightThemeColors
                                                                    .pincolor),
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        label: Text(
                                                          hotel.hotelAbout!
                                                                  .peculiarities[
                                                              index],
                                                          style: LightTextTheme
                                                              .pin
                                                              .copyWith(
                                                                  color:
                                                                      LightThemeColors
                                                                          .grey),
                                                        ));
                                                  }),
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  hotel
                                                      .hotelAbout!.description!,
                                                  style: LightTextTheme.text
                                                      .copyWith(
                                                          color:
                                                              LightThemeColors
                                                                  .text),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16, bottom: 16),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      LightThemeColors.pincolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ListTileTheme(
                                                          minVerticalPadding: 2,
                                                          horizontalTitleGap:
                                                              12,
                                                          child: ListTile(
                                                            minLeadingWidth: 0,
                                                            dense: true,

                                                            title: Text(
                                                                "Удобства",
                                                                style: LightTextTheme
                                                                    .pin
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .tilecolor)),
                                                            // ignore: sized_box_for_whitespace
                                                            leading: SizedBox(
                                                              height: double
                                                                  .infinity,
                                                              child: SvgPicture
                                                                  .asset(
                                                                      'assets/icon/emoji_happy.svg'),
                                                            ),
                                                            subtitle: Text(
                                                                "Самое необходимое",
                                                                style: LightTextTheme
                                                                    .smallabout
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .grey)),
                                                            trailing:
                                                                const ImageIcon(
                                                              AssetImage(
                                                                'assets/icon/forward.png',
                                                              ),
                                                              color:
                                                                  LightThemeColors
                                                                      .tilecolor,
                                                            ),
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(15),
                                                              bottomLeft:
                                                                  Radius.zero,
                                                              bottomRight:
                                                                  Radius.zero,
                                                            )),
                                                            onTap: () => {},
                                                          )),
                                                      const Divider(
                                                        height: 0,
                                                        indent: 60,
                                                        endIndent: 16,
                                                        thickness: 1,
                                                        color: LightThemeColors
                                                            .tiledivider,
                                                      ),
                                                      ListTileTheme(
                                                          horizontalTitleGap:
                                                              12,
                                                          child: ListTile(
                                                            minLeadingWidth: 0,
                                                            dense: true,

                                                            title: Text(
                                                                "Что включено",
                                                                style: LightTextTheme
                                                                    .pin
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .tilecolor)),
                                                            // ignore: sized_box_for_whitespace
                                                            leading: SizedBox(
                                                              height: double
                                                                  .infinity,
                                                              child: SvgPicture
                                                                  .asset(
                                                                      'assets/icon/tick_square.svg'),
                                                            ),
                                                            subtitle: Text(
                                                                "Самое необходимое",
                                                                style: LightTextTheme
                                                                    .smallabout
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .grey)),
                                                            trailing:
                                                                const ImageIcon(
                                                              AssetImage(
                                                                'assets/icon/forward.png',
                                                              ),
                                                              color:
                                                                  LightThemeColors
                                                                      .tilecolor,
                                                            ),
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                              topLeft:
                                                                  Radius.zero,
                                                              topRight:
                                                                  Radius.zero,
                                                              bottomLeft:
                                                                  Radius.zero,
                                                              bottomRight:
                                                                  Radius.zero,
                                                            )),
                                                            onTap: () => {},
                                                          )),
                                                      const Divider(
                                                        height: 0,
                                                        thickness: 1,
                                                        indent: 60,
                                                        endIndent: 16,
                                                        color: LightThemeColors
                                                            .tiledivider,
                                                      ),
                                                      ListTileTheme(
                                                          horizontalTitleGap:
                                                              12,
                                                          child: ListTile(
                                                            minLeadingWidth: 0,
                                                            dense: true,
                                                            title: Text(
                                                                "Что не включено",
                                                                style: LightTextTheme
                                                                    .pin
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .tilecolor)),
                                                            // ignore: sized_box_for_whitespace
                                                            leading: SizedBox(
                                                              height: double
                                                                  .infinity,
                                                              child: SvgPicture
                                                                  .asset(
                                                                      'assets/icon/close_square.svg'),
                                                            ),
                                                            subtitle: Text(
                                                                "Самое необходимое",
                                                                style: LightTextTheme
                                                                    .smallabout
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .grey)),
                                                            trailing:
                                                                const ImageIcon(
                                                              AssetImage(
                                                                'assets/icon/forward.png',
                                                              ),
                                                              color:
                                                                  LightThemeColors
                                                                      .tilecolor,
                                                            ),
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                              topLeft:
                                                                  Radius.zero,
                                                              topRight:
                                                                  Radius.zero,
                                                              bottomLeft: Radius
                                                                  .circular(15),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          15),
                                                            )),
                                                            onTap: () => {},
                                                          )),
                                                    ]),
                                              ),
                                            )
                                          ]))),
                            ),
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
                                            text: 'К выбору номера',
                                            onClick: () {
                                              context.read<RoomsBloc>().add(
                                                  const RoomsEvent.getRooms());
                                              context.router.push(
                                                  RoomsRoute(hotel: hotel));
                                            },
                                          ))),
                                )),

                            // Center(child: Text(hotel.adress!)),
                          ]));
                    },
                    loading: () => const _LoadingHomeStatePage(),
                    loadingError: (String cause) {
                      return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [])));
                    }))));
  }
}

class _LoadingHomeStatePage extends StatelessWidget {
  const _LoadingHomeStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          decoration: const BoxDecoration(
              color: LightThemeColors.maincolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 257,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Shimmer.fromColors(
                                baseColor: const Color(0xffEBEBF4),
                                highlightColor: const Color(0xFFFFFFFF),
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        height: 29,
                        width: 149,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Shimmer.fromColors(
                          baseColor: const Color(0xffEBEBF4),
                          highlightColor: const Color(0xFFFFFFFF),
                          child: Container(
                            height: 29,
                            width: 149,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Shimmer.fromColors(
                        baseColor: const Color(0xffEBEBF4),
                        highlightColor: const Color(0xFFFFFFFF),
                        child: Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Shimmer.fromColors(
                          baseColor: const Color(0xffEBEBF4),
                          highlightColor: const Color(0xFFFFFFFF),
                          child: Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: Shimmer.fromColors(
                          baseColor: const Color(0xffEBEBF4),
                          highlightColor: const Color(0xFFFFFFFF),
                          child: Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ))
                  ]))),
      Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: LightThemeColors.maincolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Shimmer.fromColors(
                              baseColor: const Color(0xffEBEBF4),
                              highlightColor: const Color(0xFFFFFFFF),
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Shimmer.fromColors(
                                baseColor: const Color(0xffEBEBF4),
                                highlightColor: const Color(0xFFFFFFFF),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    ]))),
                        Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Shimmer.fromColors(
                              baseColor: const Color(0xffEBEBF4),
                              highlightColor: const Color(0xFFFFFFFF),
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Shimmer.fromColors(
                              baseColor: const Color(0xffEBEBF4),
                              highlightColor: const Color(0xFFFFFFFF),
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: LightThemeColors.pincolor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(children: [
                                    Shimmer.fromColors(
                                      baseColor: const Color(0xffEBEBF4),
                                      highlightColor: const Color(0xFFFFFFFF),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: const Color(0xffEBEBF4),
                                      highlightColor: const Color(0xFFFFFFFF),
                                      child: Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    )
                                  ]),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Divider(
                                        height: 0,
                                        indent: 60,
                                        endIndent: 16,
                                        thickness: 1,
                                        color: LightThemeColors.tiledivider,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(children: [
                                        Shimmer.fromColors(
                                          baseColor: const Color(0xffEBEBF4),
                                          highlightColor:
                                              const Color(0xFFFFFFFF),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: const Color(0xffEBEBF4),
                                          highlightColor:
                                              const Color(0xFFFFFFFF),
                                          child: Container(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ])),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Divider(
                                        height: 0,
                                        indent: 60,
                                        endIndent: 16,
                                        thickness: 1,
                                        color: LightThemeColors.tiledivider,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(children: [
                                        Shimmer.fromColors(
                                          baseColor: const Color(0xffEBEBF4),
                                          highlightColor:
                                              const Color(0xFFFFFFFF),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: const Color(0xffEBEBF4),
                                          highlightColor:
                                              const Color(0xFFFFFFFF),
                                          child: Container(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ])),
                                ]),
                          ),
                        )
                      ]))))
    ]);
  }
}
