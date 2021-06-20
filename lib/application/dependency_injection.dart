import 'package:base/application/app_config.dart';
import 'package:base/commons/utils/connectivity_util.dart';
import 'package:base/core/networking/http_client.dart';
import 'package:base/data/local/app_local_store.dart';
import 'package:base/domain/models/manager/setting_manager.dart';
import 'package:base/domain/models/manager/user_manager.dart';
import 'package:base/data/repositories/user_repository_impl.dart';
import 'package:base/data/usecase_data/auth_usecase_data.dart';
import 'package:base/presentation/pages/home/home_bloc.dart';
import 'package:base/presentation/pages/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Register service
  getIt.registerLazySingleton(() => DioClient());

  //Register Repository
  getIt.registerFactory(() => UserRepositoryImpl(getIt<DioClient>()));

  //Register Usecase
  getIt.registerFactory(() => AuthUsecaseData(getIt<UserRepositoryImpl>()));

  // Register Bloc
  getIt.registerFactory(() => HomeBloc(HomeStateLoading()));
  getIt.registerFactory(
      () => LoginBloc(LoginStateInitial(), getIt<AuthUsecaseData>()));

  // Register singleton
  getIt.registerLazySingleton(() => AppLocalStore());
  getIt.registerLazySingleton(() => ConnectivityUtil());
  getIt.registerLazySingleton(() => ApplicationConfig());
  getIt.registerLazySingleton(() => SettingManager(getIt<AppLocalStore>()));
  getIt.registerLazySingleton(() => UserManager(getIt<AppLocalStore>()));
}
