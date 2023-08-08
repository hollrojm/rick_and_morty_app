import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/infrastructure/models/location_response.dart';

class LocationProvider with ChangeNotifier {
  List<Location> _locations = [];
  final baseUrl = 'https://rickandmortyapi.com/api';
  List<Location> get locations => _locations;

  Future<void> getLocations() async {
    final response = await http.get(Uri.parse('$baseUrl/location'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _locations = (data['results'] as List)
          .map((item) => Location.fromJson(item))
          .toList();
      notifyListeners();
    }
  }
}
