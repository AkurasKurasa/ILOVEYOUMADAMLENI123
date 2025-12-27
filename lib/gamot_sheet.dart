import 'package:flutter/material.dart';
import 'medicine_detail_page.dart';

class GamotSheet extends StatelessWidget {
  const GamotSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9, // 90% height
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F0), // Match HealthPage background
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Header / Back Button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.keyboard_arrow_down, size: 32, color: Color(0xFF2C2C2C)),
                  tooltip: 'Close',
                ),
                const SizedBox(width: 8),
                const Text(
                  'Gamot',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const Spacer(),
                // Optional: You could add a cart or settings icon here
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate item width for 3 items per row with 12px spacing
                  // Width = (TotalWidth - (2 * 12)) / 3
                  final double itemWidth = (constraints.maxWidth - 24) / 3;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8), // Small spacer before search
                      // Search Box
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFD1D5DB), width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Color(0xFF9CA3AF)),
                            SizedBox(width: 12),
                            Text(
                              'Search medicines...',
                              style: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Cabinet Section
                      const Text(
                        'Cabinet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C2C2C),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Cabinet Items Grid
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildMockupBox(
                            itemWidth,
                            'Ibuprofen',
                            Colors.orange.shade100,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => MedicineDetailPage(
                                  medicineName: 'Ibuprofen',
                                  accentColor: Colors.orange,
                                  prescriptionRequired: false,
                                ),
                              );
                            },
                          ),
                          _buildMockupBox(
                            itemWidth,
                            'Paracetamol',
                            Colors.blue.shade100,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => MedicineDetailPage(
                                  medicineName: 'Paracetamol',
                                  accentColor: Colors.blue,
                                  prescriptionRequired: false,
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Medicine Section
                      const Text(
                        'Medicine',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C2C2C),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Medicine Items Grid
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildMockupBox(
                            itemWidth,
                            'Aspirin',
                            Colors.red.shade100,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => MedicineDetailPage(
                                  medicineName: 'Aspirin',
                                  accentColor: Colors.red,
                                  prescriptionRequired: true,
                                ),
                              );
                            },
                          ),
                          _buildMockupBox(
                            itemWidth,
                            'Amoxicillin',
                            Colors.purple.shade100,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => MedicineDetailPage(
                                  medicineName: 'Amoxicillin',
                                  accentColor: Colors.purple,
                                  prescriptionRequired: true,
                                ),
                              );
                            },
                          ),
                          _buildMockupBox(
                            itemWidth,
                            'Antibiotics',
                            Colors.teal.shade100,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => MedicineDetailPage(
                                  medicineName: 'Antibiotics',
                                  accentColor: Colors.teal,
                                  prescriptionRequired: true,
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMockupBox(
    double width,
    String label,
    Color color, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
      width: width,
      height: width, // Square aspect ratio
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // White background now
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD1D5DB), width: 1.5), // Thicker border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), // Stronger shadow
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Use the passed color for an icon background or accent
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
             // Placeholder icon based on color/label logic could go here, generic for now
             child: Icon(Icons.medication_liquid_sharp, color: color.withOpacity(0.8), size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF2C2C2C),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
