import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

/// Contact us Page
class ContactUsPage extends StatefulWidget {
  /// Constructor for ContactUsPage
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: AppBar().preferredSize.height + 40),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        spacing: 30,
                        children: [
                          _buildBrandingSection(colours),
                          _buildLocationCard(colours),
                          _buildContactCard(colours),
                          _buildActionButtons(colours),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(ColorScheme colours) {
    return AppBar(
      backgroundColor: colours.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Container(
        margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: colours.surfaceContainerHighest.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: colours.onSurface,
            size: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        'Branch Information',
        style: TextStyle(
          color: colours.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBrandingSection(ColorScheme colours) {
    return Column(
      children: [
        Hero(
          tag: 'logo',
          child: Container(
            padding: const EdgeInsets.all(20),

            child: SvgPicture.asset(
              'assets/logo_without_subtitle.svg',
              height: 60,
              width: 60,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colours.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Stoke Branch',
            style: TextStyle(
              color: colours.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationCard(ColorScheme colours) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colours.surfaceContainerHighest.withValues(alpha: 0.5),
            colours.surfaceContainerHighest.withValues(alpha: 0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colours.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colours.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: colours.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Branch Location',
                style: TextStyle(
                  color: colours.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildAddressRow('Sandbatch Road', colours),
          _buildAddressRow('Burslem', colours),
          _buildAddressRow('Stoke-On-Trent', colours),
          _buildAddressRow('United Kingdom', colours),
          _buildAddressRow('ST6 2DR', colours, isPostcode: true),
        ],
      ),
    );
  }

  Widget _buildAddressRow(
    String text,
    ColorScheme colours, {
    bool isPostcode = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const SizedBox(width: 56), // Align with icon
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color:
                    isPostcode
                        ? colours.primary
                        : colours.onSurface.withValues(alpha: 0.8),
                fontSize: 16,
                fontWeight: isPostcode ? FontWeight.w600 : FontWeight.w400,
                letterSpacing: isPostcode ? 1 : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(ColorScheme colours) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colours.primary.withValues(alpha: 0.1),
            colours.primary.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colours.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colours.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.phone_outlined,
                  color: colours.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Contact Number',
                style: TextStyle(
                  color: colours.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 56), // Align with icon
              Expanded(
                child: GestureDetector(
                  onTap: () => _launchPhone('01782229032'),
                  child: Text(
                    '01782 229 032',
                    style: TextStyle(
                      color: colours.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _copyToClipboard('01782229032'),
                icon: Icon(
                  Icons.copy_outlined,
                  color: colours.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ColorScheme colours) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _launchPhone('01782229032'),
            icon: const Icon(Icons.phone),
            label: const Text('Call Now'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colours.primary,
              foregroundColor: colours.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _openMaps(),
                icon: const Icon(Icons.directions_outlined),
                label: const Text('Directions'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colours.primary,
                  side: BorderSide(color: colours.primary),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
      ],
    );
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      _showSnackBar('Could not launch phone dialer');
    }
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    _showSnackBar('Phone number copied to clipboard');
  }

  /// Open Google Maps with the branch location
  Future<void> _openMaps() async {
    await MapsLauncher.launchQuery('Sandbach Rd, Stoke-on-Trent ST6 2DR');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
