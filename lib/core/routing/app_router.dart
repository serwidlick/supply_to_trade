import 'package:go_router/go_router.dart';
import 'package:supply_to_trade/features/auth/presentation/login_page.dart'
    show LoginPage;
import 'package:supply_to_trade/features/contact_us/presentation/contact_us_page.dart';
import 'package:supply_to_trade/features/dashboard/presentation/dashboard_page.dart';
import 'package:supply_to_trade/features/my_information/presentation/my_information_page.dart';
import 'package:supply_to_trade/features/orders/presentation/orders_page.dart';
import 'package:supply_to_trade/features/quotes/presentation/quotes_page.dart';

/// The main application router for the Supply to Trade app.
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(path: '/quotes', builder: (context, state) => const QuotesPage()),
    GoRoute(path: '/orders', builder: (context, state) => const OrdersPage()),
    GoRoute(
      path: '/my-information',
      builder: (context, state) => const MyInformationPage(),
    ),
    GoRoute(
      path: '/contact-us',
      builder: (context, state) => const ContactUsPage(),
    ),
  ],
);
