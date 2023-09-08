import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_app_effective/colors.dart';
import 'package:test_app_effective/presentation/bloc/book_info_bloc/book_info_bloc.dart';
import 'package:test_app_effective/presentation/fonts.dart';
import 'package:test_app_effective/presentation/provider/forms/form_book.dart';
import 'package:test_app_effective/presentation/routes/app_routes.gr.dart';
import 'package:test_app_effective/presentation/widgets/button_main.dart';
import 'package:test_app_effective/presentation/widgets/labelled_input.dart';
import 'package:test_app_effective/presentation/widgets/tourist_add_button.dart';
import 'package:test_app_effective/presentation/widgets/tourist_expansion.dart';

@RoutePage()
class BookPage extends StatefulWidget {
  const BookPage({super.key});
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final List<TextEditingController> _nameController = [TextEditingController()];
  final List<TextEditingController> _surnameController = [
    TextEditingController()
  ];
  final List<TextEditingController> _dateController = [TextEditingController()];
  final List<TextEditingController> _citizenshipController = [
    TextEditingController()
  ];
  final List<TextEditingController> _passnumberController = [
    TextEditingController()
  ];
  final List<TextEditingController> _passdateController = [
    TextEditingController()
  ];

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool validateemail = true;
  static String hintVal = "**) ***-**-**";
  late FormProvider _formProvider;
  late FormTouristProvider _formTouristProvider;
  int number = 0;

  ///[Для POST запроса к API ]

  // static List<Tourist> tourists = [];

  @override
  void initState() {
    validateemail = true;
    _phoneController.text = hintVal;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _phoneController.clear();
    _surnameController.clear();

    _nameController.clear();

    _dateController.clear();

    _citizenshipController.clear();
    _passnumberController.clear();

    _passdateController.clear();

    _formProvider.disposeValues();
    _formTouristProvider.disposeValues();

    super.dispose();
  }

  List<Widget> touristsElements = [];
  final Map<String, GlobalKey<FormState>> numbers = {
    "Второй": GlobalKey<FormState>(),
    "Третий": GlobalKey<FormState>(),
    "Четвертый": GlobalKey<FormState>(),
    "Пятый": GlobalKey<FormState>(),
    "Шестой": GlobalKey<FormState>(),
    "Седьмой": GlobalKey<FormState>(),
    "Восьмой": GlobalKey<FormState>(),
    "Девятый": GlobalKey<FormState>(),
    "Десятый": GlobalKey<FormState>(),
  };

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<FormProvider>(context);
    _formTouristProvider = Provider.of<FormTouristProvider>(context);

    _formProvider.getcontext(context);
    _formTouristProvider.getcontext(context);
    void addTouristsElement(int number) {
      touristsElements.add(
        Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: LightThemeColors.maincolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Form(
                            key: numbers.values.toList()[number],
                            child: Consumer<FormTouristProvider>(
                                builder: (context, model, child) {
                              return TouristExpansionTile(
                                  title: Text(
                                    "${numbers.keys.toList()[number]} турист",
                                    style: LightTextTheme.expansionButton
                                        .copyWith(color: LightThemeColors.text),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                      ),
                                      child: Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                model.name[number + 1].color),
                                        child: TextFormField(
                                          style: LightTextTheme.text.copyWith(
                                              color: LightThemeColors.text),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                            label: const Text("Имя"),
                                            labelStyle: LightTextTheme.text
                                                .copyWith(
                                                    color: LightThemeColors
                                                        .inputtitle),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    16, 10, 16, 10),
                                          ),
                                          onChanged: (val) {
                                            _formTouristProvider.validateName(
                                                val, number + 1);
                                          },
                                          keyboardType: TextInputType.text,
                                          controller:
                                              _nameController[number + 1],
                                        ),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: model
                                                .surname[number + 1].color),
                                        child: TextFormField(
                                          style: LightTextTheme.text.copyWith(
                                              color: LightThemeColors.text),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                            label: const Text("Фамилия"),
                                            labelStyle: LightTextTheme.text
                                                .copyWith(
                                                    color: LightThemeColors
                                                        .inputtitle),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    16, 10, 16, 10),
                                          ),
                                          onChanged: (val) {
                                            _formTouristProvider
                                                .validateSurname(
                                                    val, number + 1);
                                          },
                                          keyboardType: TextInputType.text,
                                          controller:
                                              _surnameController[number + 1],
                                        ),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                model.date[number + 1].color),
                                        child: TextFormField(
                                          style: LightTextTheme.text.copyWith(
                                              color: LightThemeColors.text),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                            label: const Text("Дата рождения"),
                                            labelStyle: LightTextTheme.text
                                                .copyWith(
                                                    color: LightThemeColors
                                                        .inputtitle),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    16, 10, 16, 10),
                                          ),
                                          onChanged: (val) {
                                            _formTouristProvider.validateDate(
                                                val, number + 1);
                                          },
                                          keyboardType: TextInputType.number,
                                          controller:
                                              _dateController[number + 1],
                                        ),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: model
                                                .citizenship[number + 1].color),
                                        child: TextFormField(
                                          style: LightTextTheme.text.copyWith(
                                              color: LightThemeColors.text),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                            label: const Text("Гражданство"),
                                            labelStyle: LightTextTheme.text
                                                .copyWith(
                                                    color: LightThemeColors
                                                        .inputtitle),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    16, 10, 16, 10),
                                          ),
                                          onChanged: (val) {
                                            _formTouristProvider
                                                .validateCitizenship(
                                                    val, number + 1);
                                          },
                                          keyboardType: TextInputType.text,
                                          controller: _citizenshipController[
                                              number + 1],
                                        ),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: model
                                                .paspnumber[number + 1].color),
                                        child: TextFormField(
                                            style: LightTextTheme.text.copyWith(
                                                color: LightThemeColors.text),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                              label: const Text(
                                                  "Номер загранпаспорта"),
                                              labelStyle: LightTextTheme.text
                                                  .copyWith(
                                                      color: LightThemeColors
                                                          .inputtitle),
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      16, 10, 16, 10),
                                            ),
                                            onChanged: (val) {
                                              _formTouristProvider
                                                  .validatePassnumber(
                                                      val, number + 1);
                                            },
                                            keyboardType: TextInputType.text,
                                            controller: _passnumberController[
                                                number + 1]),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 16),
                                      child: Center(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: model
                                                .passdate[number + 1].color),
                                        child: TextFormField(
                                          style: LightTextTheme.text.copyWith(
                                              color: LightThemeColors.text),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                            label: const Text(
                                                "Срок действия загранпаспорта"),
                                            labelStyle: LightTextTheme.text
                                                .copyWith(
                                                    color: LightThemeColors
                                                        .inputtitle),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    16, 10, 16, 10),
                                          ),
                                          onChanged: (val) {
                                            _formTouristProvider
                                                .validatePassdate(
                                                    val, number + 1);
                                          },
                                          keyboardType: TextInputType.number,
                                          controller:
                                              _passdateController[number + 1],
                                        ),
                                      )),
                                    ),
                                  ]);
                            })))))),
      );
    }

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
                    "Бронирование",
                    style: LightTextTheme.appBar.copyWith(
                      color: LightThemeColors.text,
                    ),
                  ),
                ),
                backgroundColor: LightThemeColors.backgroundMain,
                child: BlocBuilder<BookInfoBloc, BookInfoState>(
                    builder: (context, state) => state.when(
                          loadingSuccess: (info) {
                            return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                          decoration: const BoxDecoration(
                                              color: LightThemeColors.maincolor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12))),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16, bottom: 6),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 0),
                                                          child: Container(
                                                            height: 29,
                                                            width: 149,
                                                            decoration: BoxDecoration(
                                                                color: LightThemeColors
                                                                    .yellowlight,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child: Row(
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                              'assets/icon/star.svg'),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                2),
                                                                        child:
                                                                            Text(
                                                                          info.rating
                                                                              .toString(),
                                                                          style: LightTextTheme
                                                                              .pin
                                                                              .copyWith(color: LightThemeColors.yellow),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left:
                                                                                  2),
                                                                          child:
                                                                              Text(
                                                                            info.ratingName!,
                                                                            style:
                                                                                LightTextTheme.pin.copyWith(color: LightThemeColors.yellow),
                                                                          )),
                                                                    ])),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 8),
                                                            child: Text(
                                                              info.name!,
                                                              style: LightTextTheme
                                                                  .expansionButton
                                                                  .copyWith(
                                                                      color: LightThemeColors
                                                                          .text),
                                                            )),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 0),
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
                                                                  MaterialStateProperty
                                                                      .all(0),
                                                              padding:
                                                                  MaterialStateProperty.all(
                                                                      EdgeInsets
                                                                          .zero),
                                                              overlayColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .transparent),
                                                              foregroundColor:
                                                                  MaterialStateProperty.resolveWith<
                                                                      Color>((Set<
                                                                          MaterialState>
                                                                      states) {
                                                                if (states.contains(
                                                                    MaterialState
                                                                        .pressed)) {
                                                                  return LightThemeColors
                                                                      .blue
                                                                      .withRed((LightThemeColors.blue.red *
                                                                              0.85)
                                                                          .round())
                                                                      .withGreen((LightThemeColors.blue.green *
                                                                              0.85)
                                                                          .round())
                                                                      .withBlue((LightThemeColors.blue.blue *
                                                                              0.85)
                                                                          .round());
                                                                }
                                                                return LightThemeColors
                                                                    .blue;
                                                              }),
                                                            ),
                                                            onPressed: () {},
                                                            child: Text(
                                                                info.adress!,
                                                                style: LightTextTheme
                                                                    .smallabout),
                                                          ),
                                                        ),
                                                      ]))))),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                          decoration: const BoxDecoration(
                                              color: LightThemeColors.maincolor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12))),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16, bottom: 16),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Table(
                                                          columnWidths: const <int,
                                                              TableColumnWidth>{
                                                            0: FlexColumnWidth(
                                                                2),
                                                            1: FlexColumnWidth(
                                                                3),
                                                          },
                                                          children: [
                                                            TableRow(children: [
                                                              Text(
                                                                "Вылет из",
                                                                style: LightTextTheme
                                                                    .text
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .grey),
                                                              ),
                                                              Text(
                                                                info.departure!,
                                                                style: LightTextTheme
                                                                    .text
                                                                    .copyWith(
                                                                        color: LightThemeColors
                                                                            .text),
                                                              ),
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "Страна, город",
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.grey),
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            16),
                                                                child: Text(
                                                                  info.arrival!,
                                                                  style: LightTextTheme
                                                                      .text
                                                                      .copyWith(
                                                                          color:
                                                                              LightThemeColors.text),
                                                                ),
                                                              )
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "Даты",
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.grey),
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            16),
                                                                child: Text(
                                                                  "${info.dateStart} - ${info.dateStop}",
                                                                  style: LightTextTheme
                                                                      .text
                                                                      .copyWith(
                                                                          color:
                                                                              LightThemeColors.text),
                                                                ),
                                                              )
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "Кол-во ночей",
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.grey),
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            16),
                                                                child: Text(
                                                                  "${info.numberOfNights} ночей",
                                                                  style: LightTextTheme
                                                                      .text
                                                                      .copyWith(
                                                                          color:
                                                                              LightThemeColors.text),
                                                                ),
                                                              )
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "Отель",
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.grey),
                                                                  )),
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    info.name!,
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                  ))
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "Номер",
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.grey),
                                                                  )),
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    info.room!,
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                  ))
                                                            ]),
                                                            TableRow(children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "Питание",
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.grey),
                                                                  )),
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    info.nutrition!,
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                  ))
                                                            ]),
                                                          ],
                                                        )
                                                      ]))))),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                              color: LightThemeColors.maincolor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12))),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16, bottom: 16),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Информация о покупателе",
                                                          style: LightTextTheme
                                                              .expansionButton
                                                              .copyWith(
                                                                  color:
                                                                      LightThemeColors
                                                                          .text),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 20,
                                                          ),
                                                          child: Center(
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: _formProvider
                                                                          .phone
                                                                          .color),
                                                                  child: Stack(
                                                                    children: [
                                                                      IgnorePointer(
                                                                        child:
                                                                            TextFormField(
                                                                          decoration:
                                                                              InputDecoration(
                                                                            prefix:
                                                                                Text("+7 (9", style: LightTextTheme.text.copyWith(color: LightThemeColors.text)),
                                                                            border:
                                                                                InputBorder.none,
                                                                            label:
                                                                                Text(
                                                                              "Номер телефона",
                                                                              style: LightTextTheme.text.copyWith(color: LightThemeColors.inputtitle),
                                                                            ),
                                                                            contentPadding: const EdgeInsets.fromLTRB(
                                                                                16,
                                                                                10,
                                                                                16,
                                                                                10),
                                                                          ),
                                                                          controller:
                                                                              _phoneController,
                                                                          style: LightTextTheme
                                                                              .text
                                                                              .copyWith(color: LightThemeColors.text),
                                                                        ),
                                                                      ),
                                                                      TextFormField(
                                                                        style: LightTextTheme
                                                                            .text
                                                                            .copyWith(color: LightThemeColors.text),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          prefix: Text(
                                                                              "+7 (9",
                                                                              style: LightTextTheme.text.copyWith(color: LightThemeColors.text)),
                                                                          border:
                                                                              InputBorder.none,
                                                                          floatingLabelBehavior:
                                                                              FloatingLabelBehavior.always,
                                                                          label:
                                                                              const Text("Номер телефона"),
                                                                          labelStyle: LightTextTheme
                                                                              .text
                                                                              .copyWith(color: LightThemeColors.inputtitle),
                                                                          contentPadding: const EdgeInsets
                                                                              .fromLTRB(
                                                                              16,
                                                                              10,
                                                                              16,
                                                                              10),
                                                                        ),
                                                                        keyboardType:
                                                                            TextInputType.phone,
                                                                        inputFormatters: [
                                                                          PhoneTextFormatter(),
                                                                        ],
                                                                        onChanged:
                                                                            (val) {
                                                                          String
                                                                              newHint =
                                                                              "";

                                                                          for (int i = 0;
                                                                              i < hintVal.length;
                                                                              i++) {
                                                                            if (i <
                                                                                newHint.length) {
                                                                              continue;
                                                                            }
                                                                            if (i <
                                                                                val.length) {
                                                                              newHint += val[i];
                                                                            } else {
                                                                              newHint += hintVal[i];
                                                                            }
                                                                          }
                                                                          _formProvider
                                                                              .validatePhone(val);
                                                                          _phoneController.text =
                                                                              newHint;
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ))),
                                                        ),
                                                        Consumer<FormProvider>(
                                                            builder: (context,
                                                                model, child) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 8,
                                                            ),
                                                            child: Center(
                                                                child: Form(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    key:
                                                                        _formKey,
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          color: _formProvider
                                                                              .email
                                                                              .color),
                                                                      child:
                                                                          TextFormField(
                                                                        style: LightTextTheme
                                                                            .text
                                                                            .copyWith(color: LightThemeColors.text),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          border:
                                                                              InputBorder.none,
                                                                          // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                          label:
                                                                              const Text("Почта"),
                                                                          labelStyle: LightTextTheme
                                                                              .text
                                                                              .copyWith(color: LightThemeColors.inputtitle),
                                                                          contentPadding: const EdgeInsets
                                                                              .fromLTRB(
                                                                              16,
                                                                              10,
                                                                              16,
                                                                              10),
                                                                        ),
                                                                        onChanged:
                                                                            (val) {
                                                                          _formProvider
                                                                              .validateEmail(val);
                                                                        },
                                                                        keyboardType:
                                                                            TextInputType.emailAddress,
                                                                        controller:
                                                                            _emailController,
                                                                      ),
                                                                    ))),
                                                          );
                                                        }),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 8,
                                                                    bottom: 16),
                                                            child: Text(
                                                              "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту",
                                                              style: LightTextTheme
                                                                  .text
                                                                  .copyWith(
                                                                      color: LightThemeColors
                                                                          .grey),
                                                            ))
                                                      ]))))),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                              color: LightThemeColors.maincolor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12))),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0, bottom: 0),
                                                  child: Form(
                                                      key: _formKey2,
                                                      child: Consumer<
                                                              FormTouristProvider>(
                                                          builder: (context,
                                                              model, child) {
                                                        return TouristExpansionTile(
                                                            title: Text(
                                                              "Первый турист",
                                                              style: LightTextTheme
                                                                  .expansionButton
                                                                  .copyWith(
                                                                      color: LightThemeColors
                                                                          .text),
                                                            ),
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 4,
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                        Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: model
                                                                        .name[0]
                                                                        .color,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                      label: const Text(
                                                                          "Имя"),
                                                                      labelStyle: LightTextTheme
                                                                          .text
                                                                          .copyWith(
                                                                              color: LightThemeColors.inputtitle),
                                                                      contentPadding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          16,
                                                                          10,
                                                                          16,
                                                                          10),
                                                                    ),
                                                                    onChanged:
                                                                        (val) {
                                                                      _formTouristProvider
                                                                          .validateName(
                                                                              val,
                                                                              0);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    controller:
                                                                        _nameController[
                                                                            0],
                                                                  ),
                                                                )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 8,
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                        Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: _formTouristProvider
                                                                        .surname[
                                                                            0]
                                                                        .color,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                      label: const Text(
                                                                          "Фамилия"),
                                                                      labelStyle: LightTextTheme
                                                                          .text
                                                                          .copyWith(
                                                                              color: LightThemeColors.inputtitle),
                                                                      contentPadding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          16,
                                                                          10,
                                                                          16,
                                                                          10),
                                                                    ),
                                                                    onChanged:
                                                                        (val) {
                                                                      _formTouristProvider
                                                                          .validateSurname(
                                                                              val,
                                                                              0);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    controller:
                                                                        _surnameController[
                                                                            0],
                                                                  ),
                                                                )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 8,
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                        Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: _formTouristProvider
                                                                        .date[0]
                                                                        .color,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                      label: const Text(
                                                                          "Дата рождения"),
                                                                      labelStyle: LightTextTheme
                                                                          .text
                                                                          .copyWith(
                                                                              color: LightThemeColors.inputtitle),
                                                                      contentPadding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          16,
                                                                          10,
                                                                          16,
                                                                          10),
                                                                    ),
                                                                    onChanged:
                                                                        (val) {
                                                                      _formTouristProvider
                                                                          .validateDate(
                                                                              val,
                                                                              0);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    controller:
                                                                        _dateController[
                                                                            0],
                                                                  ),
                                                                )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 8,
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                        Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: _formTouristProvider
                                                                        .citizenship[
                                                                            0]
                                                                        .color,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                      label: const Text(
                                                                          "Гражданство"),
                                                                      labelStyle: LightTextTheme
                                                                          .text
                                                                          .copyWith(
                                                                              color: LightThemeColors.inputtitle),
                                                                      contentPadding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          16,
                                                                          10,
                                                                          16,
                                                                          10),
                                                                    ),
                                                                    onChanged:
                                                                        (val) {
                                                                      _formTouristProvider
                                                                          .validateCitizenship(
                                                                              val,
                                                                              0);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    controller:
                                                                        _citizenshipController[
                                                                            0],
                                                                  ),
                                                                )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 8,
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                        Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: _formTouristProvider
                                                                        .paspnumber[
                                                                            0]
                                                                        .color,
                                                                  ),
                                                                  child: TextFormField(
                                                                      style: LightTextTheme.text.copyWith(color: LightThemeColors.text),
                                                                      decoration: InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                        label: const Text(
                                                                            "Номер загранпаспорта"),
                                                                        labelStyle: LightTextTheme
                                                                            .text
                                                                            .copyWith(color: LightThemeColors.inputtitle),
                                                                        contentPadding: const EdgeInsets
                                                                            .fromLTRB(
                                                                            16,
                                                                            10,
                                                                            16,
                                                                            10),
                                                                      ),
                                                                      onChanged: (val) {
                                                                        _formTouristProvider.validatePassnumber(
                                                                            val,
                                                                            0);
                                                                      },
                                                                      keyboardType: TextInputType.text,
                                                                      controller: _passnumberController[0]),
                                                                )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 8,
                                                                        bottom:
                                                                            16),
                                                                child: Center(
                                                                    child:
                                                                        Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: model
                                                                        .passdate[
                                                                            0]
                                                                        .color,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    style: LightTextTheme
                                                                        .text
                                                                        .copyWith(
                                                                            color:
                                                                                LightThemeColors.text),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      // errorStyle: LightTextTheme.text.copyWith(color:const Color(0xFFEB5757 )),
                                                                      label: const Text(
                                                                          "Срок действия загранпаспорта"),
                                                                      labelStyle: LightTextTheme
                                                                          .text
                                                                          .copyWith(
                                                                              color: LightThemeColors.inputtitle),
                                                                      contentPadding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          16,
                                                                          10,
                                                                          16,
                                                                          10),
                                                                    ),
                                                                    onChanged:
                                                                        (val) {
                                                                      _formTouristProvider
                                                                          .validatePassdate(
                                                                              val,
                                                                              0);
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    controller:
                                                                        _passdateController[
                                                                            0],
                                                                  ),
                                                                )),
                                                              ),
                                                            ]);
                                                      })))))),
                                  touristsElements.isNotEmpty
                                      ? ListView(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: touristsElements.toList(),
                                        )
                                      : Container(),
                                  Consumer<FormTouristProvider>(
                                      builder: (context, model, child) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: TouristAddButton(
                                        onClick: () {
                                          if (model.validate) {
                                            setState(() {
                                              _nameController
                                                  .add(TextEditingController());
                                              _surnameController
                                                  .add(TextEditingController());

                                              _dateController
                                                  .add(TextEditingController());

                                              _citizenshipController
                                                  .add(TextEditingController());

                                              _passdateController
                                                  .add(TextEditingController());
                                              _passnumberController
                                                  .add(TextEditingController());

                                              addTouristsElement(number);
                                              model.addModel();
                                            });

                                            number++;
                                          } else {
                                            _formTouristProvider.changeColor();
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    );
                                  }),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                              color: LightThemeColors.maincolor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Тур",
                                                      style: LightTextTheme.text
                                                          .copyWith(
                                                              color:
                                                                  LightThemeColors
                                                                      .grey),
                                                    ),
                                                    Text(
                                                      "${info.price! - info.fuelCharge! - info.serviceCharge!} ₽",
                                                      style: LightTextTheme.text
                                                          .copyWith(
                                                              color:
                                                                  LightThemeColors
                                                                      .text),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Топливный сбор",
                                                        style: LightTextTheme
                                                            .text
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .grey),
                                                      ),
                                                      Text(
                                                        "${info.fuelCharge!} ₽",
                                                        style: LightTextTheme
                                                            .text
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .text),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Сервисный сбор",
                                                        style: LightTextTheme
                                                            .text
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .grey),
                                                      ),
                                                      Text(
                                                        "${info.serviceCharge!} ₽",
                                                        style: LightTextTheme
                                                            .text
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .text),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "К оплате",
                                                        style: LightTextTheme
                                                            .text
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .grey),
                                                      ),
                                                      Text(
                                                        "${info.price!} ₽",
                                                        style: LightTextTheme
                                                            .text
                                                            .copyWith(
                                                                color:
                                                                    LightThemeColors
                                                                        .blue),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))),
                                  Consumer<FormProvider>(
                                      builder: (context, model1, child) {
                                    return Consumer<FormTouristProvider>(
                                        builder: (context, model2, child) {
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: const BoxDecoration(
                                              color: LightThemeColors.maincolor,
                                              border: Border(
                                                top: BorderSide(
                                                  width: 1,
                                                  color: LightThemeColors
                                                      .buttonbottomborder,
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
                                                        text:
                                                            'Оплатить ${info.price} ₽',
                                                        onClick: () {
                                                          if (model1.validate &&
                                                              model2.validate) {
                                                            context.router.push(
                                                                const OrderRoute());
                                                          } else {
                                                            setState(() {
                                                              model1
                                                                  .changeColor();
                                                              model2
                                                                  .changeColor();
                                                            });
                                                          }
                                                        }))),
                                          ));
                                    });
                                  }),
                                ]));
                          },
                          loading: () => const _LoadingRoomStatePage(),
                          loadingError: (cause) => Container(),
                        )))));
  }
}

class _LoadingRoomStatePage extends StatelessWidget {
  const _LoadingRoomStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width,
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
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
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
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: const Color(0xffEBEBF4),
                                        highlightColor: const Color(0xFFFFFFFF),
                                        child: Container(
                                          height: 20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                        ),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: const Color(0xffEBEBF4),
                                        highlightColor: const Color(0xFFFFFFFF),
                                        child: Container(
                                          height: 20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                        ),
                                      ),
                                    ]));
                          })))),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) => Padding(
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
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Shimmer.fromColors(
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
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: const Color(0xffEBEBF4),
                                      highlightColor: const Color(0xFFFFFFFF),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    ),
                                  ])))))),
        ]));
  }
}
