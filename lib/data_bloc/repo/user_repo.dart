import 'dart:convert';

import 'package:http/http.dart';
import 'package:finals/data_bloc/model/user_data_model.dart';

class UserRepository {
  String userUrl = 'https://date.nager.at/api/v2/publicholidays/2020/US';

  Future<List<user_data_model>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
    print("object");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print(result);
      return result.map((e) => user_data_model.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
