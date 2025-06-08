import 'package:go_router/go_router.dart';
import 'package:supply_to_trade/features/auth/presentation/login_page.dart'
    show LoginPage;
import 'package:supply_to_trade/features/dashboard/presentation/dashboard_page.dart';

/// The main application router for the Supply to Trade app.
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
