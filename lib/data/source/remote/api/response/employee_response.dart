class EmployeeResponse {
  final int userId;
  final int id;
  final String title;
  final String body;

  EmployeeResponse(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
