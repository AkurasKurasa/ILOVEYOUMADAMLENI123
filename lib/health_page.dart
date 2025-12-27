import 'package:flutter/material.dart';
import 'gamot_sheet.dart';
import 'checkup_sheet.dart';
import 'records_sheet.dart';

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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Color(0xFF6B6B5F),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Search...',
                          style: TextStyle(
                            color: const Color(0xFF6B6B5F).withOpacity(0.8),
                            fontSize: 16,
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
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Health services in the Naga City app',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildServiceTile(
                    context,
                    label: 'Gamot',
                    description: 'Access free medicines and vitamins.',
                    icon: Image.asset('assets/images/gamot_icon.png', width: 32, height: 32),
                    iconBgColor: const Color(0xFFFFE5E5), // Light coral background
                    containerBgColor: Colors.grey.shade300, // Subtle grey container
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
                    icon: Image.asset('assets/images/checkup_icon.png', width: 32, height: 32),
                    iconBgColor: const Color(0xFFE0F2F1), // Light teal background
                    containerBgColor: Colors.grey.shade300, // Subtle grey container
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const CheckupSheet(),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildServiceTile(
                    context,
                    label: 'Medical Records',
                    description: 'Access your personal health records.',
                    icon: Image.asset('assets/images/records_icon.png', width: 32, height: 32),
                    iconBgColor: const Color(0xFFE1F5FE), // Light blue background
                    containerBgColor: Colors.grey.shade300, // Subtle grey container
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
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
    required Widget icon,
    required Color iconBgColor, // Pastel background for the icon
    required VoidCallback onTap,
    Color? containerBgColor, // Optional container background color
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: containerBgColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03), // Very subtle shadow
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: iconBgColor, // Colored background for icon
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: icon,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B6B5F),
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


