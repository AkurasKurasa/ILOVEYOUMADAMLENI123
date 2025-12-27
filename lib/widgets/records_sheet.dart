import 'package:flutter/material.dart';

class RecordsSheet extends StatelessWidget {
  const RecordsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F0),
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
                  'Records',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(height: 8),

                   // Personal Information Card
                   Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                           // Profile Row
                           Row(
                             children: [
                               Container(
                                 width: 64,
                                 height: 64,
                                 decoration: const BoxDecoration(
                                    color: Color(0xFFE0E0E0),
                                    shape: BoxShape.circle,
                                 ),
                                 child: const Icon(Icons.person, size: 36, color: Colors.grey),
                               ),
                               const SizedBox(width: 16),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: const [
                                    Text(
                                      'Juan A. Dela Cruz', // Mock User
                                      style: TextStyle(
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold,
                                         color: Color(0xFF2C2C2C),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'ID: 123-456-789',
                                      style: TextStyle(
                                         fontSize: 14,
                                         color: Color(0xFF6B6B5F),
                                      ),
                                    ),
                                 ],
                               ),
                             ],
                           ),
                           const SizedBox(height: 24),
                           // Stats Row
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                                _buildInfoItem('Blood Type', 'O+'),
                                _buildVerticalDivider(),
                                _buildInfoItem('Height', '175 cm'),
                                _buildVerticalDivider(),
                                _buildInfoItem('Weight', '70 kg'),
                             ],
                           ),
                        ],
                      ),
                   ),

                  const SizedBox(height: 32),

                  const Text(
                    'Recent Records',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildRecordItem(
                    context,
                    title: 'Annual Physical Exam',
                    date: 'Dec 15, 2024',
                    doctor: 'Dr. Santos',
                  ),
                  _buildRecordItem(
                    context,
                    title: 'Blood Test Results (CBC)',
                    date: 'Nov 20, 2024',
                    doctor: 'Diagnostic Lab',
                  ),
                  _buildRecordItem(
                    context,
                    title: 'Vaccination (Flu Shot)',
                    date: 'Oct 05, 2024',
                    doctor: 'Dr. Reyes',
                  ),
                   _buildRecordItem(
                    context,
                    title: 'Dental Cleaning',
                    date: 'Aug 12, 2024',
                    doctor: 'Dr. Dimalanta',
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordItem(
    BuildContext context, {
    required String title,
    required String date,
    required String doctor,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(239, 62, 35, 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.description_outlined, color: Color.fromRGBO(239, 62, 35, 1)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF2C2C2C),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$doctor • $date',
                  style: const TextStyle(
                    color: Color(0xFF6B6B5F),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFD1D5DB)),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 32,
      width: 1.5,
      color: Colors.grey.withOpacity(0.2),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(239, 62, 35, 1), // Red-orange accent
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6B6B5F),
          ),
        ),
      ],
    );
  }
}
