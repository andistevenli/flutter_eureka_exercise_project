import 'package:bloc/bloc.dart';
import 'package:employee_project/di/injector.dart';
import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/presentation/employee-feat/home-screen/home-bloc/home_event.dart';
import 'package:employee_project/presentation/employee-feat/home-screen/home-bloc/home_state.dart';
import 'package:employee_project/presentation/employee-feat/home-screen/home_view_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<EmployeeModel> employeeListBloc = [];

    on<ReadEmployee>(
      (event, emit) async {
        try {
          emit(HomeLoading());
          employeeListBloc = await inject<HomeViewModel>().getAllEmployee();
          emit(HomeLoaded(employeeListState: employeeListBloc));
        } catch (e) {
          emit(HomeFailed());
        }
      },
    );
  }
}
