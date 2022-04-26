class User {
  late String uid;
  late String email;
  late String code;
  late String Name;

  late String userType;
  late bool loggedin;
  late String phone;
  late String department;

  User(
      {required this.uid,
      required this.code,
      required this.department,
      required this.email,
      required this.Name,
      required this.userType,
      required this.loggedin,
      required this.phone});
  User.copy() {
    loggedin = false;
  }
  User.lastNot({required this.email}) {}
}
