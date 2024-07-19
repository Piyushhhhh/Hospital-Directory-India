import 'package:flutter/material.dart';
import 'package:hospital_finder/controller/helper.dart';
import 'package:hospital_finder/models/hospitals.dart';
import 'dart:io';

class HospitalDetailPage extends StatelessWidget {
  final Hospital hospital;

  const HospitalDetailPage({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospital.hospitalName ?? 'Hospital Details'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('Name'),
                subtitle: Text(hospital.hospitalName ?? 'Unknown Hospital'),
              ),
              ListTile(
                title: const Text('Location'),
                subtitle: Text(hospital.location ?? 'No location'),
              ),
              ListTile(
                title: const Text('Pincode'),
                subtitle: Text(hospital.pincode?.toString() ?? 'N/A'),
              ),
              ListTile(
                title: const Text('Phone'),
                subtitle: Text(hospital.telephone ?? 'N/A'),
                dense: true,
                trailing: SizedBox(
                  width: 40,
                  child: IconButton(
                    icon: const Icon(Icons.phone, color: Colors.green),
                    onPressed: () {
                      final phone = hospital.telephone ?? '';
                      if (phone.isNotEmpty) {
                        launchURL('tel:$phone');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('No phone number available')),
                        );
                      }
                    },
                  ),
                ),
              ),
              ListTile(
                dense: true,
                title: const Text('Coordinates'),
                subtitle: Text(hospital.locationCoordinates ?? 'N/A'),
                trailing: ((hospital.locationCoordinates ?? '').isNotEmpty &&
                        (hospital.locationCoordinates ?? '') != 'NA')
                    ? SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: const Icon(Icons.map, color: Colors.blue),
                          onPressed: () async {
                            final coordinates =
                                (hospital.locationCoordinates ?? '')
                                    .replaceAll(' ', '');
                            if (coordinates.isNotEmpty) {
                              if (Platform.isIOS) {
                                await launchURL(
                                    'https://maps.apple.com/?q=$coordinates');
                              } else {
                                launchURL('geo:$coordinates');
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('No coordinates available')),
                              );
                            }
                          },
                        ),
                      )
                    : Container(
                        width: 40,
                      ),
              ),
              ListTile(
                title: const Text('Category'),
                subtitle: Text(hospital.hospitalCategory?.toString() ?? 'N/A'),
              ),
              ListTile(
                title: const Text('Care Type'),
                subtitle: Text(hospital.hospitalCareType ?? 'N/A'),
              ),
              // Add more ListTiles to show other details
            ],
          ),
        ),
      ),
    );
  }
}
