import 'package:employee_project/data/repository/employee_repository_impl.dart';
import 'package:employee_project/data/source/remote/api/service/employee_service.dart';
import 'package:employee_project/data/source/remote/remote_data_source.dart';
import 'package:employee_project/domain/use_case/employee_interactor.dart';
import 'package:employee_project/presentation/employee-feat/detail-screen/detail_view_model.dart';
import 'package:employee_project/presentation/employee-feat/home-screen/home_view_model.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

void setup() {
  //lazy singleton hanya dipanggil di baris inject diletakkan di dalam sebuah method, baru dibuat instance-nya
  //singleton dipanggil ketika method nya dipanggil, baru dibuat instancenya
  //factory dipanggil setiap saat untuk dibuat instance-nya

  inject.registerLazySingleton<EmployeeService>(() => EmployeeService());

  inject.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  inject.registerLazySingleton<EmployeeRepositoryImpl>(
      () => EmployeeRepositoryImpl());

  inject.registerLazySingleton<EmployeeInteractor>(() => EmployeeInteractor());

  inject.registerLazySingleton<HomeViewModel>(() => HomeViewModel());

  inject.registerLazySingleton<DetailViewModel>(() => DetailViewModel());
}
