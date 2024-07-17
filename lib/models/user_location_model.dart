abstract class UserLocationModel {
  final String name;
  final String status;
  final String address;
  final String isOnline;

  UserLocationModel(
      {required this.name,
      required this.status,
      required this.address,
      required this.isOnline});
}
