part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initUser();

  // -------------------------------- FIREBASE ------------------------------
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerFactory(() => InternetConnection());

  // ---------------------------- CORE  ---------------------------

  sl.registerFactory<ConnectionChecker>(() => ConnectionCheckerImpl(sl()));
}

_initAuth() {
  // DATASOURCE
  sl
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(auth: sl()))

    // REPOSITORY
    ..registerFactory<AuthRepository>(() => AuthRepositoryImpl(
          connectionChecker: sl(),
          remoteDataSource: sl(),
        ))
    // USECASES

    ..registerFactory(() => SendCodeToPhoneNumber(sl()))
    ..registerFactory(() => VerifyCode(sl()))
    ..registerFactory(() => GetCurrentUser(repository: sl()))

    // BLOC
    ..registerFactory(
        () => AuthBloc(sendCode: sl(), verifyCode: sl(), getCurrentUser: sl()));
}

_initUser() {
  // DATASOURCE
  sl
    ..registerFactory<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
          firestore: sl(),
        ))

    // REPOSITORY
    ..registerFactory<UserRepository>(
        () => UserRepositoryImpl(connectionChecker: sl(), dataSource: sl()))
    // USECASES
    ..registerFactory(() => SaveUserInfo(repository: sl()))
    ..registerFactory(() => GetUserData(repository: sl()))
    ..registerFactory(() => UpdateUserData(repository: sl()))

    // BLOC
    ..registerFactory(() => UserBloc(sl(), sl(), sl()));
}
