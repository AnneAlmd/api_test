import 'dart:math';
import '../model/user.dart';
import 'api.dart';

class UsersApi {
  List<User> _users = [];

  Future<void> fetchUsers() async {
    Api api = Api();
    _users = await api.fetchApi();
  }

  List<User> get user {
    return [..._users];
  }

  User randomUser() {
    Random random = new Random();
    return _users[random.nextInt(10)];
  }
}
