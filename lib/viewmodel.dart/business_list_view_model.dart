import 'dart:convert';
import 'package:business/model/business.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusinessListViewModel extends ChangeNotifier {
  List<Business> _businesses = [];
  bool _isLoading = true;

  List<Business> get businesses => _businesses;
  bool get isLoading => _isLoading;

  String _error = '';

  String get error => _error;

  Future<void> fetchBusinesses() async {
    const String apiUrl =
        'https://api.yelp.com/v3/businesses/search?location=NYC';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization':
              'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _businesses = (jsonData['businesses'] as List)
            .map((businessJson) => Business.fromJson(businessJson))
            .toList();
        _isLoading = false;
      } else {
        _isLoading = false;
        final errorJson = json.decode(response.body);
        final errorDescription = errorJson['error']['description'];
        _error = errorDescription;
      }
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load businesses';
    }

    notifyListeners();
  }
}
