import 'package:employee_project/data/source/remote/api/response/employee_response.dart';
import 'package:employee_project/data/source/remote/remote_data_source.dart';
import 'package:employee_project/di/injector.dart';
import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/data/repository/employee_repository.dart';
import 'package:employee_project/utils/data-mapper/employee_mapper.dart';

class EmployeeRepositoryImpl implements IEmployeeRepository {
  // final RemoteDataSource remoteDataSource = RemoteDataSource();

  @override
  Future<List<EmployeeModel>> getAllEmployeeModelRepo() async {
    try {
      final List<EmployeeResponse> employeeResp =
          await inject<RemoteDataSource>().getAllEmployeeResponse();
      //ga pake data mapper
      // final List<EmployeeModel> employeeModel = employeeResp
      //     .map((e) => EmployeeModel(
      //         userId: e.userId, id: e.id, title: e.title, body: e.body))
      //     .toList();
      // pake mapper
      final List<EmployeeModel> employeeModel =
          employeeResp.map((e) => employeeMapper(e)).toList();
      return employeeModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<EmployeeModel> getEmployeeModelDetailRepo(int id) async {
    try {
      // final EmployeeResponse employeeResp =
      //     await remoteDataSource.getEmployeeDetailResponse(id);
      // final EmployeeModel employeeModel = EmployeeModel(
      //     userId: employeeResp.userId,
      //     id: employeeResp.id,
      //     title: employeeResp.title,
      //     body: employeeResp.body);
      final EmployeeModel employeeModel = employeeMapper(
          await inject<RemoteDataSource>().getEmployeeDetailResponse(id));
      return employeeModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
