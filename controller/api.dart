import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user.dart';

class Api {
  Future<List<User>> fetchApi() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var list = json.decode(response.body) as List;

      return list.map((item) => User.fromJson(item)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
