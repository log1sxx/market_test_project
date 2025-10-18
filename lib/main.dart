import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/constants/constants.dart';
import 'package:market_test_project/core/di/service_locator.dart';
import 'package:market_test_project/core/routes/app_router.dart';
import 'package:market_test_project/core/theme/theme.dart';
import 'package:market_test_project/gen/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MaterialApp.router(
        locale: const Locale(languageCode),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        routerConfig: GetIt.I<AppRouter>().config(),
        supportedLocales: const AppLocalizationDelegate().supportedLocales,
        theme: defaultTheme,
      ),
    );
  }
}
