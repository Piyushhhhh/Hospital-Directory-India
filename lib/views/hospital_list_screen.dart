import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hospital_finder/controller/helper.dart';
import 'package:hospital_finder/models/hospitals.dart';
import 'package:hospital_finder/views/hospital_detail_page.dart';

class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({super.key});

  @override
  HospitalListScreenState createState() => HospitalListScreenState();
}

class HospitalListScreenState extends State<HospitalListScreen> {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('results');
  List<Hospital> _hospitals = [];
  String _searchQuery = '';
  @override
  void initState() {
    super.initState();
    _fetchHospitals();
  }

  void _fetchHospitals() async {
    final snapshot = await _database.get();
    // final snapshot = await _database.;
    if (snapshot.exists) {
      final List<dynamic> hospitalsList = snapshot.value as List<dynamic>;
      setState(() {
        _hospitals = hospitalsList
            .map((hospitalData) =>
                Hospital.fromJson(Map<String, dynamic>.from(hospitalData)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Hospital> filteredHospitals = _hospitals.where((hospital) {
      return (hospital.hospitalName ?? '')
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          (hospital.pincode != null &&
              hospital.pincode.toString().contains(_searchQuery));
    }).toList();

    filteredHospitals.sort((a, b) {
      int compareName = (a.hospitalName ?? '').compareTo(b.hospitalName ?? '');
      if (compareName != 0) {
        return compareName;
      } else {
        return (a.pincode ?? '').compareTo(b.pincode ?? '');
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(
              hintText: 'Search Hospitals...',
              border: InputBorder.none,
            ),
            onChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),
        ),
        body: Column(
          children: [
            filteredHospitals.isEmpty
                ? const Center(child: Text('No hospitals found'))
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredHospitals.length,
                      itemBuilder: (context, index) {
                        var hospital = filteredHospitals[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16.0),
                              title: Text(
                                hospital.hospitalName ?? 'Unknown Hospital',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hospital.location ?? 'No location',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Pincode: ${hospital.pincode ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.phone,
                                        color: Colors.green),
                                    onPressed: () {
                                      final phone = hospital.telephone ?? '';
                                      if (phone.isNotEmpty) {
                                        launchURL('tel:$phone');
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'No phone number available'),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  ((hospital.locationCoordinates ?? '')
                                              .isNotEmpty &&
                                          (hospital.locationCoordinates ??
                                                  '') !=
                                              'NA')
                                      ? IconButton(
                                          icon: const Icon(Icons.map,
                                              color: Colors.blue),
                                          onPressed: () async {
                                            final coordinates =
                                                (hospital.locationCoordinates ??
                                                        '')
                                                    .replaceAll(' ', '');
                                            if (coordinates.isNotEmpty) {
                                              if (Platform.isIOS) {
                                                await launchURL(
                                                    'https://maps.apple.com/?q=$coordinates');
                                              } else {
                                                launchURL('geo:$coordinates');
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'No coordinates available'),
                                                ),
                                              );
                                            }
                                          },
                                        )
                                      : Container(),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HospitalDetailPage(hospital: hospital),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ));
  }
}
