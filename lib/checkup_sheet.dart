import 'package:flutter/material.dart';

class CheckupSheet extends StatefulWidget {
  const CheckupSheet({super.key});

  @override
  State<CheckupSheet> createState() => _CheckupSheetState();
}

class _CheckupSheetState extends State<CheckupSheet> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  String? _selectedAge;
  String? _selectedGender;
  String? _selectedConcern;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitAssessment() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Assessment submitted successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pop(context);
  }

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
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.keyboard_arrow_down, size: 32, color: Color(0xFF2C2C2C)),
                  tooltip: 'Close',
                ),
              ],
            ),
          ),
          // Progress indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
                    decoration: BoxDecoration(
                      color: index <= _currentPage
                          ? const Color(0xFF6B6B5F)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildAgePage(),
                _buildGenderPage(),
                _buildConcernPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgePage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What is your age group?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: [
                _buildOptionCard('Child (0-12)', 'child', _selectedAge, (value) {
                  setState(() => _selectedAge = value);
                  _nextPage();
                }),
                const SizedBox(height: 12),
                _buildOptionCard('Teen (13-19)', 'teen', _selectedAge, (value) {
                  setState(() => _selectedAge = value);
                  _nextPage();
                }),
                const SizedBox(height: 12),
                _buildOptionCard('Adult (20-59)', 'adult', _selectedAge, (value) {
                  setState(() => _selectedAge = value);
                  _nextPage();
                }),
                const SizedBox(height: 12),
                _buildOptionCard('Senior (60+)', 'senior', _selectedAge, (value) {
                  setState(() => _selectedAge = value);
                  _nextPage();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: _previousPage,
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              ),
              const SizedBox(width: 8),
              const Text(
                'What is your gender?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: [
                _buildOptionCard('Male', 'male', _selectedGender, (value) {
                  setState(() => _selectedGender = value);
                  _nextPage();
                }),
                const SizedBox(height: 12),
                _buildOptionCard('Female', 'female', _selectedGender, (value) {
                  setState(() => _selectedGender = value);
                  _nextPage();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConcernPage() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: _previousPage,
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'What brings you here today?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView(
                  children: [
                    _buildOptionCard('General Checkup', 'general', _selectedConcern, (value) {
                      setState(() => _selectedConcern = value);
                    }),
                    const SizedBox(height: 12),
                    _buildOptionCard('Lungs', 'lungs', _selectedConcern, (value) {
                      setState(() => _selectedConcern = value);
                    }),
                    const SizedBox(height: 12),
                    _buildOptionCard('Heart', 'heart', _selectedConcern, (value) {
                      setState(() => _selectedConcern = value);
                    }),
                    const SizedBox(height: 12),
                    _buildOptionCard('Stomach', 'stomach', _selectedConcern, (value) {
                      setState(() => _selectedConcern = value);
                    }),
                    const SizedBox(height: 12),
                    _buildOptionCard('Head', 'head', _selectedConcern, (value) {
                      setState(() => _selectedConcern = value);
                    }),
                    const SizedBox(height: 12),
                    _buildOptionCard('Other', 'other', _selectedConcern, (value) {
                      setState(() => _selectedConcern = value);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Submit Button
        Positioned(
          left: 24,
          right: 24,
          bottom: 24,
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _selectedConcern != null ? _submitAssessment : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B6B5F),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Submit Assessment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(
    String label,
    String value,
    String? selectedValue,
    Function(String) onTap,
  ) {
    final isSelected = selectedValue == value;
    return InkWell(
      onTap: () => onTap(value),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6B6B5F).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF6B6B5F) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? const Color(0xFF6B6B5F) : const Color(0xFF2C2C2C),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF6B6B5F),
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
