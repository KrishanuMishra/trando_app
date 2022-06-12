import 'dart:convert';

import 'package:http/http.dart' as http;

class Data {
  String url =
      'http://65.0.74.155:8000/users/appoinments/?user_id=d986bfc1-a9ac-46c8-b3da-017f486e0498';
  Future<List> getData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List;
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List> postData(String id) async {
    final response = await http.post(
      Uri.parse('http://65.0.74.155:8000/users/appoinments/'),
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
