import 'package:get_it/get_it.dart';

import '../data/login/repositories/login_repository_impl.dart';
import '../data/users/repositories/user_repository_impl.dart';
import '../domain/login/repositories/login_repository.dart';
import '../domain/login/usecases/login_use_case.dart';
import '../domain/users/repositories/user_repository.dart';
import '../domain/users/usecases/get_users_use_case.dart';
import '../presentation/login/bloc/login_bloc.dart';
import '../presentation/users/bloc/user_list_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Repositories
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(),
  );

  // Use cases
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<LoginRepository>()),
  );

  getIt.registerLazySingleton<GetUsersUseCase>(
    () => GetUsersUseCase(getIt<UserRepository>()),
  );

  // Blocs
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(getIt<LoginUseCase>()),
  );

  getIt.registerFactory<UserListBloc>(
    () => UserListBloc(getIt<GetUsersUseCase>()),
  );
}
