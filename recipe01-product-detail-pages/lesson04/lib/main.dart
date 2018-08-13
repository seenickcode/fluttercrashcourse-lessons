import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'services/location_service.dart';

void main() {
  final mockLocation = LocationService.fetchMockLocation();

  return runApp(MaterialApp(home: LocationDetail(mockLocation)));
}
