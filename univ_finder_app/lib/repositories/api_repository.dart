import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:univ_finder_app/models/university.dart';

class ApiRepository {
  static const String _url = 'http://universities.hipolabs.com/search';

  Future<List<University>> searchUniversityByCountry(String country) async {
    final Response = await http.get(Uri.parse('$_url?country=$country'));

    if (Response.statusCode == 200) {
      List<dynamic> data = json.decode(Response.body);
      return data.map((json) => University.fromJson(json)).toList();
    } else {
      throw Exception('Failed To Load Universities');
    }
  }
}
