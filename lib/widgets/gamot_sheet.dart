import 'package:flutter/material.dart';
import 'medicine_detail_sheet.dart';

class GamotSheet extends StatefulWidget {
  const GamotSheet({super.key});

  @override
  State<GamotSheet> createState() => _GamotSheetState();
}

class _GamotSheetState extends State<GamotSheet> {
  bool _isCardView = true; // true = Card View (grid), false = List View

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
                // View toggle buttons
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isCardView = true;
                          });
                        },
                        icon: Icon(
                          Icons.grid_view,
                          color: _isCardView 
                              ? const Color.fromRGBO(239, 62, 35, 1)
                              : Colors.grey.shade600,
                        ),
                        tooltip: 'Card View',
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isCardView = false;
                          });
                        },
                        icon: Icon(
                          Icons.view_list,
                          color: !_isCardView 
                              ? const Color.fromRGBO(239, 62, 35, 1)
                              : Colors.grey.shade600,
                        ),
                        tooltip: 'List View',
                      ),
                    ],
                  ),
                ),
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

                      // Cabinet Items - Card View or List View
                      _isCardView
                          ? Wrap(
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
                                      builder: (context) => MedicineDetailSheet(
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
                                      builder: (context) => MedicineDetailSheet(
                                        medicineName: 'Paracetamol',
                                        accentColor: Colors.blue,
                                        prescriptionRequired: false,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _buildListItem(
                                  'Ibuprofen',
                                  Colors.orange.shade100,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => MedicineDetailSheet(
                                        medicineName: 'Ibuprofen',
                                        accentColor: Colors.orange,
                                        prescriptionRequired: false,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                _buildListItem(
                                  'Paracetamol',
                                  Colors.blue.shade100,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => MedicineDetailSheet(
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

                      // Medicine Items - Card View or List View
                      _isCardView
                          ? Wrap(
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
                                      builder: (context) => MedicineDetailSheet(
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
                                      builder: (context) => MedicineDetailSheet(
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
                                      builder: (context) => MedicineDetailSheet(
                                        medicineName: 'Antibiotics',
                                        accentColor: Colors.teal,
                                        prescriptionRequired: true,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _buildListItem(
                                  'Aspirin',
                                  Colors.red.shade100,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => MedicineDetailSheet(
                                        medicineName: 'Aspirin',
                                        accentColor: Colors.red,
                                        prescriptionRequired: true,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                _buildListItem(
                                  'Amoxicillin',
                                  Colors.purple.shade100,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => MedicineDetailSheet(
                                        medicineName: 'Amoxicillin',
                                        accentColor: Colors.purple,
                                        prescriptionRequired: true,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                                _buildListItem(
                                  'Antibiotics',
                                  Colors.teal.shade100,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => MedicineDetailSheet(
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

  Widget _buildListItem(
    String label,
    Color color, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.medication_liquid_sharp,
                color: color.withOpacity(0.8),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF2C2C2C),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
