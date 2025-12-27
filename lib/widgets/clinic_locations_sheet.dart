import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ClinicLocationsSheet extends StatefulWidget {
  const ClinicLocationsSheet({super.key});

  @override
  State<ClinicLocationsSheet> createState() => _ClinicLocationsSheetState();
}

class _ClinicLocationsSheetState extends State<ClinicLocationsSheet> {
  final MapController _mapController = MapController();
  
  // Mock user location (Naga City, Philippines)
  static const LatLng _userLocation = LatLng(13.6218, 123.1948);
  
  // Mock clinic data
  final List<Map<String, dynamic>> _clinics = [
    {
      'name': 'Naga City Health Center',
      'address': 'Panganiban Drive, Naga City',
      'distance': '0.3 km',
      'location': const LatLng(13.6225, 123.1955),
    },
    {
      'name': 'Bicol Medical Center',
      'address': 'Magsaysay Avenue, Naga City',
      'distance': '0.7 km',
      'location': const LatLng(13.6205, 123.1935),
    },
    {
      'name': 'Naga Doctors Clinic',
      'address': 'Elias Angeles Street, Naga City',
      'distance': '1.0 km',
      'location': const LatLng(13.6240, 123.1970),
    },
    {
      'name': 'City Health Office',
      'address': 'Concepcion Pequeña, Naga City',
      'distance': '1.3 km',
      'location': const LatLng(13.6195, 123.1915),
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
                const Expanded(
                  child: Text(
                    'Health Assessment',
                    style: TextStyle(
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
                            // Clinic markers (red-orange)
                            ..._clinics.map((clinic) {
                              return Marker(
                                point: clinic['location'],
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.local_hospital,
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
                  // Clinic list section
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Available Clinics',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Clinic cards
                        ...List.generate(_clinics.length, (index) {
                          final clinic = _clinics[index];
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
                                  Icons.local_hospital,
                                  color: const Color.fromRGBO(239, 62, 35, 1),
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        clinic['name'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF2C2C2C),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        clinic['address'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  clinic['distance'],
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
