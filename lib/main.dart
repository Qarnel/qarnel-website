import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';

import '../utils/theme_data.dart';
import 'pages/home_page.dart';
import 'pages/loupstibook_page.dart';
import 'pages/markdown_page.dart';

void main() {
  LocalJsonLocalization.delegate.directories.clear();
  LocalJsonLocalization.delegate.directories.add("assets/i18n/");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyDynamicThemeWidget(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  /// The route configuration.
  final GoRouter routerConfig = GoRouter(
    initialLocation: HomePage.routeName,
    routes: <RouteBase>[
      GoRoute(
        path: HomePage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: "/:app_name",
        builder: (BuildContext context, GoRouterState state) {
          String? appName = state.params["app_name"];
          if (appName == LoupstiBookPage.routeName) {
            return LoupstiBookPage();
          } else {
            return const HomePage();
          }
        },
      ),
      GoRoute(
        path: "/:app_name/privacy",
        builder: (BuildContext context, GoRouterState state) {
          String? appName = state.params["app_name"];
          if (appName != null) {
            String lang = Localizations.localeOf(context).languageCode;
            return MarkdownPage(
              title: "${appName.i18n()} - ${"Privacy".i18n()}",
              assetName: "assets/$appName/$lang/privacy.md",
            );
          } else {
            return const HomePage();
          }
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      title: 'Qarnel',
      routerConfig: routerConfig,
      locale: _locale,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        // Locale by language
        if (locale?.languageCode == 'en') {
          return const Locale('en', 'US');
        } else if (locale?.languageCode == 'pt') {
          return const Locale('pt', 'BR');
        } else if (locale?.languageCode == 'fr') {
          return const Locale('fr', 'FR');
        }

        // Default locale
        return const Locale('en', 'US');
      },
    );
  }
}
