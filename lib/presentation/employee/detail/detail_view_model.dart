import 'package:employee_project/di/injector.dart';
import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/domain/use_case/employee_interactor.dart';

class DetailViewModel {
  // final EmployeeInteractor employeeInteractor = EmployeeInteractor();
  // late EmployeeModel employeeModel = EmployeeModel(
  //   userId: 0,
  //   id: 0,
  //   title: "",
  //   body: "",
  // );

  // MyState _myState = MyState.initial;
  // MyState get myState => _myState;

  // void changeState(MyState myState) {
  //   _myState = myState;
  //   notifyListeners();
  // }

  Future<EmployeeModel> getEmployeeDetail(final int id) async {
    //provider
    // try {
    //   changeState(MyState.loading);
    //   employeeModel = await employeeInteractor.getEmployeeDetailModel(id);
    //   changeState(MyState.loaded);
    // } catch (e) {
    //   changeState(MyState.failed);
    //   print(e.toString());
    //   throw Exception(e);
    // }
    // riverpod
    return await inject<EmployeeInteractor>().getEmployeeDetailModel(id);
    //bloc
    // try {
    //   return await inject<EmployeeInteractor>().getEmployeeDetailModel(id);
    // } catch (e) {
    //   throw (Exception(e));
    // }
  }
}
