import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PharmacyLocationsSheet extends StatefulWidget {
  final String medicineName;

  const PharmacyLocationsSheet({
    super.key,
    required this.medicineName,
  });

  @override
  State<PharmacyLocationsSheet> createState() => _PharmacyLocationsSheetState();
}

class _PharmacyLocationsSheetState extends State<PharmacyLocationsSheet> {
  final MapController _mapController = MapController();
  
  // Mock user location (Naga City, Philippines)
  static const LatLng _userLocation = LatLng(13.6218, 123.1948);
  
  // Mock pharmacy data
  final List<Map<String, dynamic>> _pharmacies = [
    {
      'name': 'Mercury Drug - Naga',
      'address': 'Magsaysay Avenue, Naga City',
      'distance': '0.5 km',
      'location': const LatLng(13.6228, 123.1958),
    },
    {
      'name': 'Watsons Pharmacy',
      'address': 'SM City Naga, Naga City',
      'distance': '1.2 km',
      'location': const LatLng(13.6198, 123.1918),
    },
    {
      'name': 'Rose Pharmacy',
      'address': 'Panganiban Drive, Naga City',
      'distance': '0.8 km',
      'location': const LatLng(13.6238, 123.1968),
    },
    {
      'name': 'South Star Drug',
      'address': 'Elias Angeles Street, Naga City',
      'distance': '1.5 km',
      'location': const LatLng(13.6208, 123.1928),
    },
  ];

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
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.medicineName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map - takes full width, fixed height
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.9,
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: _userLocation,
                        initialZoom: 14.0,
                        interactionOptions: const InteractionOptions(
                          flags: InteractiveFlag.all,
                        ),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.naga',
                        ),
                        MarkerLayer(
                          markers: [
                            // User location marker (blue)
                            Marker(
                              point: _userLocation,
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.my_location,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                            // Pharmacy markers (red)
                            ..._pharmacies.map((pharmacy) {
                              return Marker(
                                point: pharmacy['location'],
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.local_pharmacy,
                                  color: Color.fromRGBO(239, 62, 35, 1),
                                  size: 40,
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Pharmacy list section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Available in these Pharmacies',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Pharmacy cards
                        ...List.generate(_pharmacies.length, (index) {
                          final pharmacy = _pharmacies[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_pharmacy,
                                  color: const Color.fromRGBO(239, 62, 35, 1),
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pharmacy['name'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF2C2C2C),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        pharmacy['address'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  pharmacy['distance'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(239, 62, 35, 1),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

