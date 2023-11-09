import 'package:employee_project/domain/model/employee_model.dart';

abstract class EmployeeUseCase {
  Future<List<EmployeeModel>> getAllEmployeeModel();

  Future<EmployeeModel> getEmployeeDetailModel(final int id);
}
