import 'package:flutter/material.dart';
import '../widgets/gamot_sheet.dart';
import '../widgets/checkup_sheet.dart';
import '../widgets/records_sheet.dart';
import '../widgets/clinic_locations_sheet.dart';

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
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2C2C2C)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Search...',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Health Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Health services in the Naga City app.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildServiceTile(
                    context,
                    label: 'Gamot',
                    description: 'Access free medicines and vitamins.',
                    iconBgColor: const Color(0xFFFFE5E5), // Light coral
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const GamotSheet(),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildServiceTile(
                    context,
                    label: 'Check Up',
                    description: 'Book an appointment with a doctor.',
                    iconBgColor: const Color(0xFFE0F2F1), // Light teal
                    onTap: () async {
                      final result = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const CheckupSheet(),
                      );
                      
                      // If assessment was completed, show clinic locations
                      if (result == true && context.mounted) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const ClinicLocationsPage(),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildServiceTile(
                    context,
                    label: 'Records',
                    description: 'Access your personal health records.',
                    iconBgColor: const Color(0xFFE1F5FE), // Light blue
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const RecordsSheet(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 7,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tools',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tools in the Naga Health App.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildToolCard(
                          label: 'Tool 1',
                          icon: Icons.monitor_heart_outlined,
                          color: Colors.deepPurple.shade50, // Uniform light purple
                          iconColor: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildToolCard(
                          label: 'Tool 2',
                          icon: Icons.calculate_outlined,
                          color: Colors.deepPurple.shade50, // Uniform light purple
                          iconColor: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32), // Bottom padding
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTile(
    BuildContext context, {
    required String label,
    required String description,
    required Color iconBgColor, // Colored background placeholder
    required VoidCallback onTap,
    Color? containerBgColor, // Optional container background color
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: containerBgColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            // Colored placeholder square (no icon image)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2C2C2C),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildToolCard({
    required String label,
    required IconData icon,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF2C2C2C),
            ),
          ),
        ],
      ),
    );
  }
}


