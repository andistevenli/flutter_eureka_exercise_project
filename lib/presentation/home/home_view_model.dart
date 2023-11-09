import 'package:employee_project/di/injector.dart';
import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/domain/use_case/employee_interactor.dart';

class HomeViewModel {
  // final EmployeeInteractor employeeInteractor = EmployeeInteractor();
  // late List<EmployeeModel> employeeList = [];

  // MyState _myState = MyState.initial;
  // MyState get myState => _myState;

  // void changeState(MyState myState) {
  //   _myState = myState;
  //   notifyListeners();
  // }

  Future<List<EmployeeModel>> getAllEmployee() async {
    // provider
    // try {
    //   changeState(MyState.loading);
    //   employeeList = await employeeInteractor.getAllEmployeeModel();
    //   changeState(MyState.loaded);
    // } catch (e) {
    //   changeState(MyState.failed);
    //   throw (Exception(e));
    // }
    // riverpod
    // return await inject<EmployeeInteractor>().getAllEmployeeModel();
    //bloc
    try {
      return await inject<EmployeeInteractor>().getAllEmployeeModel();
    } catch (e) {
      throw (Exception(e));
    }
  }
}
