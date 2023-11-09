import 'package:employee_project/data/repository/employee_repository_impl.dart';
import 'package:employee_project/di/injector.dart';
import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/domain/use_case/employee_usecase.dart';

class EmployeeInteractor implements EmployeeUseCase {
  // EmployeeRepositoryImpl employeeRepositoryImpl = EmployeeRepositoryImpl();

  @override
  Future<List<EmployeeModel>> getAllEmployeeModel() async {
    try {
      return await inject<EmployeeRepositoryImpl>().getAllEmployeeModelRepo();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<EmployeeModel> getEmployeeDetailModel(int id) async {
    try {
      return await inject<EmployeeRepositoryImpl>()
          .getEmployeeModelDetailRepo(id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
