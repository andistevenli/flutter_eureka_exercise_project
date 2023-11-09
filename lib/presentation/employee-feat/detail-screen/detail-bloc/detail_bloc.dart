import 'package:bloc/bloc.dart';
import 'package:employee_project/di/injector.dart';
import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/presentation/employee-feat/detail-screen/detail-bloc/detail_event.dart';
import 'package:employee_project/presentation/employee-feat/detail-screen/detail-bloc/detail_state.dart';
import 'package:employee_project/presentation/employee-feat/detail-screen/detail_view_model.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    late EmployeeModel employeeBloc;

    on<ReadEmployeeDetail>((
      event,
      emit,
    ) async {
      try {
        emit(DetailLoading());
        employeeBloc = await inject<DetailViewModel>().getEmployeeDetail(event.id);
        emit(DetailLoaded(employeeModelState: employeeBloc));
      } catch (e) {
        emit(DetailFailed());
      }
    });
  }
}
