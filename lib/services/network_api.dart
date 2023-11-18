import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/cat.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  /// A method to fetch cat breeds
  Future<List<Cat>> fetchCatBreedList() async {
    List<Cat> catBreedList = [];
    final response = await http.get(Uri.parse('https://catfact.ninja/breeds'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var json = jsonDecode(response.body);
      if (kDebugMode) {
        print("Response: ${json["data"]}");
      }
      for (var breed in json["data"]) {
        catBreedList.add(Cat.fromJson(breed));
      }
      return catBreedList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
