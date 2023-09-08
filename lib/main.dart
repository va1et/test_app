import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl_standalone.dart';
import 'package:provider/provider.dart';
import 'package:test_app_effective/presentation/bloc/book_info_bloc/book_info_bloc.dart';
import 'package:test_app_effective/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:test_app_effective/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:test_app_effective/presentation/provider/forms/form_book.dart';
import 'package:test_app_effective/presentation/routes/app_routes.dart';
import 'package:test_app_effective/service_locator.dart'
    as dependency_injection;
import 'package:test_app_effective/service_locator.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(
  //     widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await dependency_injection.setup();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp()
  //     : await Firebase.initializeApp(
  //         //  options: DefaultFirebaseOptions.currentPlatform,
  //         );

  // await FirebaseAnalytics.instance.logAppOpen();

  setPathUrlStrategy();

  findSystemLocale().then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    final appRouter = AppRouter();
    return MultiBlocProvider(
        providers: [
          BlocProvider<HotelBloc>(
              create: (context) =>
                  getIt<HotelBloc>()..add(const HotelEvent.getHotel())),
          BlocProvider<RoomsBloc>(create: (context) => getIt<RoomsBloc>()),
          BlocProvider<BookInfoBloc>(
              create: (context) => getIt<BookInfoBloc>()),
        ],
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<FormProvider>(
                  create: (_) => FormProvider()),
              ChangeNotifierProvider<FormTouristProvider>(
                  create: (_) => FormTouristProvider()),
            ],
            child: MaterialApp.router(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ru'),
              ],
              theme: ThemeData.light(),
              locale: const Locale('ru'),
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(),
            )));
  }
}
