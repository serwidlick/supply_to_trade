import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supply_to_trade/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:supply_to_trade/features/dashboard/data/dashboard_state.dart';
import 'package:supply_to_trade/features/dashboard/presentation/dashboard_grid.dart';
import 'package:supply_to_trade/features/dashboard/presentation/notifications_section.dart';
import 'package:supply_to_trade/features/dashboard/presentation/welcome_section.dart';

/// DashboardPage class used for the main dashboard screen
class DashboardPage extends StatefulWidget {
  /// Creates an instance of [DashboardPage].
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colours.surface,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(colours),
      body: BlocProvider(
        create: (context) {
          final cubit = DashboardCubit()..init();
          return cubit;
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: SpinKitDualRing(
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            }
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: AppBar().preferredSize.height + 60,
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 32,
                              children: [
                                if (!state.hasDismissedWelcome)
                                  WelcomeSection(
                                    onDismissed: () {
                                      context
                                          .read<DashboardCubit>()
                                          .setDismissedWelcome(true);
                                    },
                                  ),
                                const DashboardGrid(),
                                const NotificationsSection(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(ColorScheme colours) {
    return AppBar(
      backgroundColor: colours.surface,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colours.surface,
              colours.surface.withValues(alpha: 0.95),
              colours.surface.withValues(alpha: 0),
            ],
          ),
        ),
      ),
      title: FadeTransition(
        opacity: _fadeAnimation,
        child: Row(
          children: [
            Hero(
              tag: 'logo',
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/logo_without_subtitle.svg',
                  height: 28,
                  width: 28,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: colours.surfaceContainerHighest.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: colours.onSurface,
                size: 22,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
