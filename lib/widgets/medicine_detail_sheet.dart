import 'package:flutter/material.dart';
import 'pharmacy_locations_sheet.dart';

class MedicineDetailSheet extends StatelessWidget {
  final String medicineName;
  final Color accentColor;
  final bool prescriptionRequired;

  const MedicineDetailSheet({
    super.key,
    required this.medicineName,
    required this.accentColor,
    this.prescriptionRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // Drag handle
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Medicine Image - Full width square
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                ),
                child: Stack(
                  children: [
                    // Medicine icon centered
                    Center(
                      child: Icon(
                        Icons.medication_liquid_sharp,
                        size: 120,
                        color: accentColor.withOpacity(0.6),
                      ),
                    ),
                    // Close button in top-left corner
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 32,
                          color: Color(0xFF2C2C2C),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 100), // Extra bottom padding for button
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Medicine Name - Left aligned
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            medicineName,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Prescription Status - Simple text, left aligned
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            prescriptionRequired
                                ? 'Prescription Required'
                                : 'No Prescription Required',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: prescriptionRequired
                                  ? Colors.orange.shade700
                                  : Colors.green.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Absolutely positioned button at bottom
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => PharmacyLocationsSheet(
                        medicineName: medicineName,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(239, 62, 35, 1),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Check Medicine Availability',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
