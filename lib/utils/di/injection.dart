import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:postfeedapp/features/post/data/datasources/post_remote_datasource.dart';
import 'package:postfeedapp/features/post/data/repositories/post_repository_impl.dart';
import 'package:postfeedapp/features/post/domain/repositories/post_repository.dart';
import 'package:postfeedapp/features/post/domain/usecases/post_usecase.dart';
import 'package:postfeedapp/features/post/presentation/bloc/post/post_bloc.dart';

import '../../features/post/data/datasources/user_remote_datasource.dart';
import '../../features/post/data/repositories/user_repository_impl.dart';
import '../../features/post/domain/repositories/user_repository.dart';
import '../../features/post/domain/usecases/user_usecase.dart';
import '../../features/post/presentation/bloc/user/user_bloc.dart';
import '../constant/constant.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: const {'Content-Type': 'application/json'},
      ),
    ),
  );

  // ===> POSTS
  // data
  getIt.registerLazySingleton(() => PostRemoteDatasource(getIt()));
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(getIt()),
  );
  // domain
  getIt.registerLazySingleton(() => PostUsecase(getIt()));
  // presentation
  getIt.registerFactory(() => PostBloc(getIt()));

  // ===> USER POSTS
  // data
  getIt.registerLazySingleton(() => PostUserRemoteDatasource(getIt()));
  getIt.registerLazySingleton<PostUserRepository>(
    () => PostUserRepositoryImpl(getIt()),
  );
  // domain
  getIt.registerLazySingleton(() => PostUserUsecase(getIt()));
  // presentation
  getIt.registerFactory(() => PostUserBloc(getIt()));

  // ==============================================
  // anda bisa melanjutkan di bawah ini
  // ===> COMMENT POST
}
