import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supply_to_trade/core/routing/app_router.dart';
import 'package:supply_to_trade/shared/storage/storage_service.dart';
import 'package:supply_to_trade/shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await StorageService().init();

  runApp(const SupplyToTradeApp());
}

/// The main application widget for the Supply to Trade app.
class SupplyToTradeApp extends StatelessWidget {
  /// Creates an instance of [SupplyToTradeApp].
  const SupplyToTradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Supply2Trade Enhanced',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
    );
  }
}
