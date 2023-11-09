import 'package:employee_project/domain/model/employee_model.dart';

abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final EmployeeModel employeeModelState;

  DetailLoaded({required this.employeeModelState});
}

class DetailFailed extends DetailState {}
