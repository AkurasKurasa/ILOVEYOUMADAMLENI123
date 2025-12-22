import 'package:flutter/material.dart';
import 'gamot_sheet.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0), // Soft off-white
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAF8), // Slightly warmer white
        elevation: 0,
        title: const Text(
          'Health',
          style: TextStyle(
            color: Color(0xFF2C2C2C), // Softer black
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2C2C2C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Layer 1: Hero Section (Background)
          Container(
            height: 240, // Reduced height
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(28, 60, 28, 20),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E4DC), // Soft beige
              image: const DecorationImage(
                image: AssetImage('assets/images/health_background.png'),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'May nararamdaman ka ba?',
                        style: TextStyle(
                          color: Color(0xFF3C3C3C), // Softer dark gray
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Magpatingin online agad.',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16), // 12-16px radius
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(251, 182, 171, 1), // Warm coral
                              Color.fromRGBO(240, 160, 149, 1), // Slightly darker bottom for depth
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15), // Gentle elevation
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              // TODO: Navigate to consultation
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Patingin na feature - Coming soon!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              child: const Text(
                                'Magpa-check ngayon',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600, // Medium-bold
                                  color: Colors.white, // White text
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Layer 2: Scrollable Content with "Sheet" effect
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 220), // Reduced spacer to match new hero height
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F0), // Match Scaffold background
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow for depth
                        blurRadius: 20,
                        offset: const Offset(0, -5), // Shadow travels UP onto the hero
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10), // Small spacer inside sheet
                        const Text(
                          'Health Services',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Conveniently access medical assistance and health resources through Naga City\'s online health portal',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF6B6B5F),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            // 3 items per row with 12px gap
                            final itemWidth = (constraints.maxWidth - 24) / 3;
                            return Wrap(
                              spacing: 12,
                              runSpacing: 24,
                              children: [
                                SizedBox(
                                  width: itemWidth,
                                  child: _buildServiceCardWithCustomIcon(
                                    context,
                                    icon: Image.asset(
                                      'assets/images/gamot_icon.png',
                                      width: 64,
                                      height: 64,
                                    ),
                                    label: 'Gamot',
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => const GamotSheet(),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: itemWidth,
                                  child: _buildServiceCard(
                                    context,
                                    icon: Icons.check_circle_outline_rounded,
                                    label: 'Aksyon',
                                  ),
                                ),
                                SizedBox(
                                  width: itemWidth,
                                  child: _buildServiceCardWithCustomIcon(
                                    context,
                                    icon: Image.asset(
                                      'assets/images/checkup_icon.png',
                                      width: 64,
                                      height: 64,
                                    ),
                                    label: 'Check-up',
                                  ),
                                ),
                                SizedBox(
                                  width: itemWidth,
                                  child: _buildServiceCardWithCustomIcon(
                                    context,
                                    icon: Image.asset(
                                      'assets/images/records_icon.png',
                                      width: 64,
                                      height: 64,
                                    ),
                                    label: 'Records',
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 100), // Extra space at bottom for scrolling
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String label,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        // TODO: Navigate to specific service
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label feature - Coming soon!'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 56, // Larger icon
              color: const Color(0xFFFF5733),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCardWithCustomIcon(
    BuildContext context, {
    required Widget icon,
    required String label,
    VoidCallback? onTap, // Optional onTap override
  }) {
    return InkWell(
      onTap: onTap ?? () {
        // Default TODO: Navigate to specific service
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label feature - Coming soon!'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 56,
              height: 56,
              child: icon,
            ),
            const SizedBox(height: 16),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


