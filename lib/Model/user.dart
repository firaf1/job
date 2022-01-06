class User {
  late String fullName;
  late String email;
  late String address;
  late String phoneNumber;
  late String password;
  late String jobCategory;
  late String passwordconfirmation;
  User({
    required this.passwordconfirmation,
    required this.address,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.jobCategory,
  });
}
