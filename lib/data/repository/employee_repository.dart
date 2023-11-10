import 'package:employee_project/domain/model/employee_model.dart';

abstract class IEmployeeRepository {
  Future<List<EmployeeModel>> getAllEmployeeModelRepo();

  Future<EmployeeModel> getEmployeeModelDetailRepo(final int id);
}
