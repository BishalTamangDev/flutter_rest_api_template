import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClient {
  var client = http.Client();

  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  // get
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    // may require api key :: use header for that case

    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }

  // post
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);

    // actual data to be added
    var payload = jsonEncode(object);

    // header :: api, authorization, content type
    var headers = {
      'Content-type': "application/json",
    };

    var response = await client.post(url, body: payload, headers: headers);

    if (response.statusCode == 201) {
      return "Data added successfully!";
    } else {
      return "Data couldn't be added!";
    }
  }

  // put || update || alter
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);

    // data to be added
    var payload = json.encode(object);

    // header
    var header = {
      'Content-type': 'application/json',
    };

    // response
    var response = await client.put(url, body: payload, headers: header);

    if (response.statusCode == 200) {
      return "Data updated successfully!";
    } else {
      return "Data couldn't be updated!";
    }
  }

  // delete
  Future<dynamic> delete(String api) async {
    // url
    var url = Uri.parse(baseUrl + api);

    // response
    var response = await client.delete(url);

    if (response.statusCode == 200) {
      return "Date deleted successfully!";
    } else {
      return "Data couldn't be deleted!";
    }
  }
}
