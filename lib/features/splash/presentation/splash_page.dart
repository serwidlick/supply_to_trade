import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:supply_to_trade/shared/storage/storage_service.dart';

/// Page for the Splash feature.
class SplashPage extends StatefulWidget {
  /// Const constructor for Splash page
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final storage = StorageService();
    storage
        .init()
        .then((_) {
          final userId = storage.getLastUserId();

          if (userId != null) {
            context.go('/dashboard');
          } else {
            context.go('/login');
          }
        })
        .catchError((error) {
          // Handle any errors during initialization
          print('Error initializing storage: $error');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash')),
      body: const Center(
        child: SpinKitDualRing(
          color: Colors.blue,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
