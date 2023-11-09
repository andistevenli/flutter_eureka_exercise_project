import 'package:employee_project/domain/model/employee_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<EmployeeModel> employeeListState;

  HomeLoaded({required this.employeeListState});
}

class HomeFailed extends HomeState {}
