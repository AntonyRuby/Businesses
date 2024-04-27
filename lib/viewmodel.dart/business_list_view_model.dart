import 'dart:convert';

import 'package:business/model/business.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusinessListViewModel extends ChangeNotifier {
  List<Business> _businesses = [];
  bool _isLoading = true;

  List get businesses => _businesses;
  bool get isLoading => _isLoading;

  Future<void> fetchBusinesses() async {
    const String apiUrl =
        'https://api.yelp.com/v3/businesses/search?location=NYC';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization':
            'Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'
      },
    );

    print(response.body); // Add this line to print the response body

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _businesses = (jsonData['businesses'] as List)
          .map((businessJson) => Business.fromJson(businessJson))
          .toList();
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to load businesses');
    }
  }
}
