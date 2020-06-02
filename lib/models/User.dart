class User {
  String firstName;
  String lastName;
  String username;
  String token;

  User(Map map)
      : firstName = map['firstName'],
        lastName = map['lastName'],
        username = map['username'],
        token = map['token'];
}
