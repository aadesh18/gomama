class BookingData {
  String email;
  String hours;
  String name;
  String location;
  String phone;
  Map<String, dynamic> schedule;
  String username;
  String rating;

  BookingData(
      {required this.email,
      required this.hours,
      required this.name,
      required this.location,
      required this.phone,
      required this.schedule,
      required this.username,
      required this.rating});
}
