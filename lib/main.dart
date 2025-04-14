import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'config/map_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализация API-ключа Яндекс.Карт
  // await init.initMapkit(apiKey: MapConfig.yandexMapApiKey);
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Наша Свадьба',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru', 'RU'),
      home: const HomeScreen(),
    );
  }
}
