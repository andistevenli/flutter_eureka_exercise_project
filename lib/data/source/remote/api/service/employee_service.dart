import 'package:dio/dio.dart';
import 'package:employee_project/data/source/remote/api/api_interceptor.dart';
import 'package:employee_project/data/source/remote/api/end_point.dart';

class EmployeeService extends ApiInterceptor {
  Future<Response<dynamic>> getAllEmployeeService() async {
    try {
      const String url = EndPoint.baseUrl + EndPoint.posts;
      return await dio.get(url);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response<dynamic>> getEmployeeDetailService(final int id) async {
    try {
      String url = EndPoint.baseUrl + EndPoint.posts + id.toString();
      return await dio.get(url);
    } catch (e) {
      throw Exception(e);
    }
  }
}
