
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:badminton_court_booking/remote/diary_service.dart';
import 'package:badminton_court_booking/remote/friend_service.dart';
import 'package:badminton_court_booking/repository/diary_repository.dart';
import 'package:badminton_court_booking/repository/diary_repository_impl.dart';
import 'package:badminton_court_booking/repository/friend_repository.dart';
import 'package:badminton_court_booking/repository/friend_repository_impl.dart';

import '../common/constant/constant.dart';
import '../common/helper/pref_helper.dart';
import '../common/interceptor/interceptor_factory.dart';
import '../config/env/env.dart';
import '../cubit/auth/sign_in/sign_in_cubit.dart';
import '../cubit/lang/language_cubit.dart';
import '../cubit/loading/loading_cubit.dart';
import '../cubit/theme/theme_cubit.dart';
import '../remote/auth_service.dart';
import '../repository/auth_repository.dart';
import '../repository/auth_repository_impl.dart';

final getItInstance = GetIt.I;
const kTimeout = 60000;

Future init() async {
  // common
  getItInstance.registerLazySingleton<PrefHelper>(() => PrefHelper());

  // network

  // base host
  getItInstance.registerLazySingleton<Dio>(() => _initDio(Env.instance.config.apiHost), instanceName: DioInstanceName.kApiHost);

  // auth
  getItInstance.registerLazySingleton<AuthService>(() => AuthService(getItInstance.get<Dio>(instanceName: DioInstanceName.kApiHost)));
  getItInstance.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getItInstance()));

  // diary
  getItInstance.registerLazySingleton<DiaryService>(() => DiaryService(getItInstance.get<Dio>(instanceName: DioInstanceName.kApiHost)));
  getItInstance.registerLazySingleton<DiaryRepository>(() => DiaryRepositoryImpl(getItInstance()));

  // friend
  getItInstance.registerLazySingleton<FriendService>(() => FriendService(getItInstance.get<Dio>(instanceName: DioInstanceName.kApiHost)));
  getItInstance.registerLazySingleton<FriendRepository>(() => FriendRepositoryImpl(getItInstance()));

  // app
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit());
  getItInstance.registerSingleton<LanguageCubit>(LanguageCubit());
  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());

  // screen
  getItInstance.registerFactory(() => SignInCubit(authRepo: getItInstance(), loadingCubit: getItInstance()));
}

Dio _initDio(String baseUrl) {
  var dio = Dio(BaseOptions(
    connectTimeout: kTimeout,
    receiveTimeout: kTimeout,
    sendTimeout: kTimeout,
    baseUrl: baseUrl,
  ));
  return _addInterceptors(dio);
}

/**
 * InterceptorsWrapper: All of the requests enter the interceptor at once, rather than executing sequentially.
 * QueuedInterceptorsWrapper: All of the requests enter the interceptor sequentially by QueuedInterceptors
 */
Dio _addInterceptors(Dio dio) {
  return dio
    ..clear()
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true)) // note: debug
    ..interceptors.add(InterceptorFactory.makeInterceptor());
}
