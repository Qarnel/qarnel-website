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
}

class _MyAppState extends State<MyApp> {
  /// The route configuration.
  final GoRouter routerConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: HomePage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: LoupstiBookPage.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return LoupstiBookPage();
            },
          ),
          GoRoute(
            path: ":app_name/:lang/:page_name",
            builder: (BuildContext context, GoRouterState state) {
              return MarkdownPage(
                  title: "${state.params["app_name"]?.i18n()} - ${"Privacy".i18n()}",
                  assetName:
                      "${state.params["app_name"]}/${state.params["lang"]}/${state.params["page_name"]}.md");
            },
          ),
        ],
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
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
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
