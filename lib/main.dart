import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_app/core/theme/app_theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/routes/app_routes.dart';
import 'feauters/home/view_model/home_view_model.dart';
import 'providers/app_language_provider.dart';
import 'providers/app_theme_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future <void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppLanguageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),)
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
    
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
