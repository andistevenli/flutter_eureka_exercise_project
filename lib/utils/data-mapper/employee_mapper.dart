import 'package:employee_project/data/source/remote/api/response/employee_response.dart';
import 'package:employee_project/domain/model/employee_model.dart';

EmployeeModel employeeMapper(EmployeeResponse er) {
  return EmployeeModel(
    userId: er.userId,
    id: er.id,
    title: er.title,
    body: er.body,
  );
}
