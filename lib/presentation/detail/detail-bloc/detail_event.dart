abstract class DetailEvent {}

class ReadEmployeeDetail extends DetailEvent {
  final int id;

  ReadEmployeeDetail({required this.id});
}
