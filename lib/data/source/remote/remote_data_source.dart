import 'package:dio/dio.dart';
import 'package:employee_project/data/source/remote/api/response/employee_response.dart';
import 'package:employee_project/data/source/remote/api/service/employee_service.dart';
import 'package:employee_project/di/injector.dart';

class RemoteDataSource {
  // final EmployeeService employeeService = EmployeeService();

  Future<List<EmployeeResponse>> getAllEmployeeResponse() async {
    try {
      final Response<dynamic> resp =
          await inject<EmployeeService>().getAllEmployeeService();
      final List<EmployeeResponse> employeeResp =
          (resp.data as List).map((e) => EmployeeResponse.fromJson(e)).toList();
      return employeeResp;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<EmployeeResponse> getEmployeeDetailResponse(final int id) async {
    try {
      final Response<dynamic> resp =
          await inject<EmployeeService>().getEmployeeDetailService(id);
      final EmployeeResponse employeeResp =
          EmployeeResponse.fromJson(resp.data);
      return employeeResp;
    } catch (e) {
      throw Exception(e);
    }
  }
}
