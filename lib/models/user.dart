class User {
  int id;
  String lastName;
  String firstName;
  String email;
  String phone;
  String password;

  User({
    this.id = 0,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.phone,
    this.password = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        lastName: json['last_name'],
        firstName: json['first_name'],
        email: json['email'],
        phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_name': lastName,
      'first_name': firstName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  @override
  String toString() {
    return lastName;
  }

  

}
