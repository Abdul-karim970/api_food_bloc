import 'dart:convert';

import 'package:http/http.dart' as http;

extension RESTCodes on http.Response {
  bool isSuccessful() {
    return statusCode == 200;
  }

  bool isCreated() {
    return statusCode == 201;
  }
}

abstract class ApiProvider {
  String get baseUrl => 'https://api.spoonacular.com/';
  String get apiUrl => '';

  fetch({String endPoint = ''}) async {
    var response = await http.get(Uri.parse(baseUrl + apiUrl + endPoint));
    if (response.isSuccessful()) {
      return jsonDecode(response.body);
    }
  }

  insert(Map<String, dynamic> map) async {
    var response =
        await http.post(Uri.parse(baseUrl + apiUrl), body: jsonEncode(map));
    response.isCreated() ? true : false;
  }
}
