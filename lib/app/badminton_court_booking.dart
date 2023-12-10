import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../common/constant/constant.dart' as AppConstant;
import '../common/constant/constant.dart';
import '../common/locale/localization.dart';
import '../common/style/dark_theme.dart';
import '../common/style/light_theme.dart';
import '../cubit/lang/language_cubit.dart';
import '../cubit/loading/loading_cubit.dart';
import '../cubit/theme/theme_cubit.dart';
import '../di/get_it.dart';
import '../router/fade_page_route_builder.dart';
import '../router/page_router.dart';
import '../service/navigation_service.dart';
import '../ui/loading/loading_page.dart';

class BadmintonCourtBookingApp extends StatefulWidget {

  @override
  _BadmintonCourtBookingAppState createState() => _BadmintonCourtBookingAppState();
}

class _BadmintonCourtBookingAppState extends State<BadmintonCourtBookingApp> {

  final _logger = FimberLog("BadmintonCourtBookingAppState");

  // late PrefHelper _prefManager;
  late ThemeCubit _themeCubit;
  late LanguageCubit _languageCubit;
  late LoadingCubit _loadingCubit;

  // Locale _currentLocale = Constant.kDefaultLocale;
  // bool _isDarkMode = Constant.kIsDarkMode;

  @override
  void initState() {
    // _prefManager = getItInstance<PrefHelper>();
    _themeCubit = getItInstance<ThemeCubit>();
    _languageCubit = getItInstance<LanguageCubit>();
    _loadingCubit = getItInstance<LoadingCubit>();
    // initCubitState();
    super.initState();
  }

  @override
  void dispose() {
    _themeCubit.close();
    _languageCubit.close();
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>.value(value: _themeCubit),
          BlocProvider<LanguageCubit>.value(value: _languageCubit),
          BlocProvider<LoadingCubit>.value(value: _loadingCubit),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, langState) {
                return MaterialApp(
                  navigatorKey: NavigationService.navigatorKey,
                  scrollBehavior: CustomScrollBehavior(),
                  title: AppConstant.Constant.kAppName,
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme(),
                  darkTheme: darkTheme(),
                  // themeMode: loadTheme(themeState), // app settings
                  // locale: loadLocale(langState), // app settings
                  supportedLocales: Constant.kSupportLanguages,
                  localizationsDelegates: const [
                    Localization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    _logger.d("localeResolutionCallback $locale");
                    // change language
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                              locale?.languageCode &&
                          supportedLocale.countryCode == locale?.countryCode) {
                        return supportedLocale;
                      }
                    }
                    return Constant.kDefaultLocale;
                  },
                  builder: (context, child) {
                    return LoadingPage(
                      screen: child!,
                    );
                  },
                  onGenerateRoute: (RouteSettings settings) {
                    final routes = PageRouter.getRoutes(settings);
                    final WidgetBuilder? builder = routes[settings.name];
                    return FadePageRouteBuilder(
                      builder: builder!,
                      settings: settings,
                    );
                  },
                );
              },
            );
          },
        ));
  }

  // void initCubitState() {
  //   _prefManager.getTheme().then((value) => {
  //         setState(() {
  //           _isDarkMode = value;
  //         })
  //       });
  //
  //   _prefManager.getLocale().then((value) => {
  //         setState(() {
  //           _currentLocale = value;
  //         })
  //       });
  // }

  // Locale loadLocale(LanguageState state) {
  //   if (state is ChangeLanguageSuccess) {
  //     _currentLocale = state.locale;
  //   }
  //   _prefManager.setLocale(_currentLocale.languageCode);
  //
  //   _logger.d("loadLocale $_currentLocale");
  //
  //   return _currentLocale;
  // }

  // ThemeMode loadTheme(ThemeState state) {
  //   ThemeMode ret;
  //   if (state is ChangeThemeSuccess) {
  //     if (state.isDarkMode) {
  //       ret = ThemeMode.dark;
  //     } else {
  //       ret = ThemeMode.light;
  //     }
  //   } else {
  //     if (_isDarkMode) {
  //       ret = ThemeMode.dark;
  //     } else {
  //       ret = ThemeMode.light;
  //     }
  //   }
  //
  //   _isDarkMode = ret == ThemeMode.dark;
  //   _prefManager.setTheme(_isDarkMode);
  //
  //   _logger.d("loadTheme $_isDarkMode");
  //
  //   return ret;
  // }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
      };
}
