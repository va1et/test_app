// ignore: unnecessary_import
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/domain/models/hotel.dart';
import 'package:test_app_effective/presentation/bloc/book_info_bloc/book_info_bloc.dart';
import 'package:test_app_effective/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:test_app_effective/presentation/fonts.dart';
import 'package:test_app_effective/presentation/routes/app_routes.gr.dart';
import 'package:test_app_effective/presentation/widgets/button_main.dart';
import 'package:test_app_effective/presentation/widgets/indicator.dart';

@RoutePage()
class RoomsPage extends StatefulWidget {
  final Hotel hotel;
  const RoomsPage({super.key, required this.hotel});
  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  void initState() {
    super.initState();
  }

  late List<PageController> controller = [];
  List<int> selectedindex = [];
  List<List<Widget>> indicators = [];
  List<Widget> _buildPageIndicator(int a) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i == selectedindex[a]
          ? Indicator(
              isActive: true,
              index: i,
              activeindex: selectedindex[a],
            )
          : Indicator(
              isActive: false,
              index: i,
              activeindex: selectedindex[a],
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
              leading: Material(
                  color: LightThemeColors.maincolor,
                  surfaceTintColor: Colors.transparent,
                  child: IconButton(
                    color: LightThemeColors.text,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
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
              middle: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: widget.hotel.name?.substring(0, 24) ?? " ",
                  style: LightTextTheme.appBar.copyWith(
                    color: LightThemeColors.text,
                  ),
                ),
                TextSpan(
                  text: "...",
                  style: LightTextTheme.appBar.copyWith(
                    color: LightThemeColors.text,
                  ),
                )
              ])),
            ),
            backgroundColor: LightThemeColors.backgroundMain,
            child: BlocBuilder<RoomsBloc, RoomsState>(
                builder: (context, state) => state.when(
                      loadingSuccess: (rooms) {
                        return ListView.builder(
                          itemCount: rooms.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            for (int i = 0; i < rooms.length; i++) {
                              selectedindex.add(0);

                              indicators.add(_buildPageIndicator(i));

                              controller.add(PageController());
                            }
                            final pages = List.generate(
                                rooms[index].images.length,
                                (index2) => ExtendedImage.network(
                                        rooms[index].images[index2],
                                        fit: BoxFit.cover,
                                        cache: false,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        loadStateChanged:
                                            (ExtendedImageState state) {
                                      switch (state.extendedImageLoadState) {
                                        case LoadState.loading:
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xffEBEBF4),
                                              highlightColor:
                                                  const Color(0xFFFFFFFF),
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                            ),
                                          );
                                        case LoadState.completed:
                                          return ClipRect(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    shape: BoxShape.rectangle),
                                                child: ExtendedRawImage(
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                  width: double.infinity,
                                                  image: state
                                                      .extendedImageInfo?.image,
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
                                                  child: Center(
                                                      child: Text(
                                                    "Ошибка при загрузке изображения. Нажмите, чтобы перезагрузить",
                                                    textAlign: TextAlign.center,
                                                    style: LightTextTheme.text
                                                        .copyWith(
                                                            color:
                                                                LightThemeColors
                                                                    .text),
                                                  )),
                                                )
                                              ],
                                            ),
                                            onTap: () {
                                              state.reLoadImage();
                                            },
                                          );
                                      }
                                    }));
                            return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: LightThemeColors.maincolor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12))),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, bottom: 16),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 257,
                                                      child: Stack(children: [
                                                        ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: PageView
                                                                    .builder(
                                                                        onPageChanged:
                                                                            (int
                                                                                page) {
                                                                          setState(
                                                                              () {
                                                                            selectedindex[index] =
                                                                                page;
                                                                          });
                                                                        },
                                                                        controller:
                                                                            controller[
                                                                                index],
                                                                        itemCount: rooms[index]
                                                                            .images
                                                                            .length,
                                                                        pageSnapping:
                                                                            true,
                                                                        itemBuilder:
                                                                            (context,
                                                                                pagePosition) {
                                                                          return pages[pagePosition %
                                                                              pages.length];
                                                                        }))),
                                                        Positioned.fill(
                                                            bottom: 10,
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    Container(
                                                                        width:
                                                                            75,
                                                                        height:
                                                                            17,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              LightThemeColors.maincolor,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5.0)),
                                                                        ),
                                                                        child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 8, right: 10),
                                                                            child: Row(mainAxisSize: MainAxisSize.min, children: _buildPageIndicator(index)))))),
                                                      ])),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Text(
                                                        rooms[index].name!,
                                                        style: LightTextTheme
                                                            .expansionButton
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .text),
                                                      )),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8),
                                                      child: Wrap(
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        spacing: 8,
                                                        // runSpacing: 0.1,
                                                        children: List.generate(
                                                            rooms[index]
                                                                .roomAbout
                                                                .length,
                                                            (index3) {
                                                          return Chip(
                                                              backgroundColor:
                                                                  LightThemeColors
                                                                      .pincolor,
                                                              color: MaterialStateProperty.all(
                                                                  LightThemeColors
                                                                      .pincolor),
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5))),
                                                              label: Text(
                                                                rooms[index]
                                                                        .roomAbout[
                                                                    index3],
                                                                style: LightTextTheme
                                                                    .pin
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .grey),
                                                              ));
                                                        }),
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Container(
                                                      height: 29,
                                                      width: 192,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              LightThemeColors
                                                                  .bluelight,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 10,
                                                            right: 2,
                                                          ),
                                                          child: Row(children: [
                                                            Text(
                                                              "Подробнее о номере",
                                                              style: LightTextTheme
                                                                  .pin
                                                                  .copyWith(
                                                                      color: LightThemeColors
                                                                          .blue),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 2),
                                                              child: ImageIcon(
                                                                AssetImage(
                                                                  'assets/icon/forward.png',
                                                                ),
                                                                color:
                                                                    LightThemeColors
                                                                        .blue,
                                                              ),
                                                            ),
                                                          ])),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 16),
                                                      child: Row(
                                                        textBaseline:
                                                            TextBaseline
                                                                .alphabetic,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .baseline,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "от ${rooms[index].price} ₽",
                                                            style: LightTextTheme
                                                                .xLargeTitleMS
                                                                .copyWith(
                                                                    color: LightThemeColors
                                                                        .text),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 8),
                                                              child: Text(
                                                                rooms[index]
                                                                    .priceDescription!,
                                                                style: LightTextTheme
                                                                    .text
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .grey),
                                                              )),
                                                        ],
                                                      )),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 16),
                                                      child: SizedBox(
                                                          height: 48,
                                                          child: ButtonMain(
                                                            text:
                                                                'Выбрать номер',
                                                            onClick: () {
                                                              context
                                                                  .read<
                                                                      BookInfoBloc>()
                                                                  .add(const BookInfoEvent
                                                                      .getBookInfo());
                                                              context.router.push(
                                                                  const BookRoute());
                                                            },
                                                          )))
                                                ])))));
                          },
                        );
                      },
                      loading: () => const _LoadingRoomStatePage(),
                      loadingError: (cause) => Container(),
                    ))));
  }
}

class _LoadingRoomStatePage extends StatelessWidget {
  const _LoadingRoomStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 257,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Shimmer.fromColors(
                                            baseColor: const Color(0xffEBEBF4),
                                            highlightColor:
                                                const Color(0xFFFFFFFF),
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Shimmer.fromColors(
                                    baseColor: const Color(0xffEBEBF4),
                                    highlightColor: const Color(0xFFFFFFFF),
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                  ),
                                ),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                              ),
                                              Container(
                                                height: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                              ),
                                              Container(
                                                height: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                              ),
                                              Container(
                                                height: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                              ),
                                              Container(
                                                height: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                              ),
                                            ]))),
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
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 16),
                                    child: Shimmer.fromColors(
                                      baseColor: const Color(0xffEBEBF4),
                                      highlightColor: const Color(0xFFFFFFFF),
                                      child: Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    ))
                              ]))));
            }));
  }
}
