import 'package:frizter/app/di/di.dart';
import 'package:frizter/features/settings/data/datasources/remote/profile_remote_data_source.dart';
import 'package:frizter/features/settings/data/repositories/profile_repository_impl.dart';
import 'package:frizter/features/settings/domain/repositories/profile_repository.dart';

final sl = GetIt.I;

Future<void> setupConfiguration() async {
  await _registerServices();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
  _registerBlocs();
}

Future<void> _registerServices() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  sl.registerLazySingleton<IUserService>(
    () => UserService(firebaseAuth: sl(), firebaseFirestore: sl()),
  );
  sl.registerLazySingleton<RoutesRefreshStream>(
    () => RoutesRefreshStream(userService: sl()),
  );
}

void _registerDataSources() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      userService: sl(),
      firebaseAuth: sl(),
      firebaseFirestore: sl(),
    ),
  );
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(
      userService: sl(),
      firebaseAuth: sl(),
      firebaseFirestore: sl(),
      firebaseStorage: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      userService: sl(),
      firebaseAuth: sl(),
      firebaseFirestore: sl(),
      firebaseStorage: sl(),
    ),
  );
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(
      firebaseFirestore: sl(),
      firebaseStorage: sl(),
      userService: sl(),
    ),
  );
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(firebaseFirestore: sl()),
  );
}

void _registerRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      settingsRemoteDataSource: sl(),
      settingsLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<PostsRepository>(
    () => PostRepositoryImpl(postRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(searchRemoteDataSource: sl()),
  );
}

void _registerUseCases() {
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(authRepository: sl()),
  );
  sl.registerLazySingleton<GetSavedSettingsUseCase>(
    () => GetSavedSettingsUseCase(settingsRepository: sl()),
  );
  sl.registerLazySingleton<GetUserInfoUseCase>(
    () => GetUserInfoUseCase(profileRepository: sl()),
  );
  sl.registerLazySingleton<ChangeSettingsUseCase>(
    () => ChangeSettingsUseCase(settingsRepository: sl()),
  );
  sl.registerLazySingleton<UpdateEmailUseCase>(
    () => UpdateEmailUseCase(profileRepository: sl()),
  );
  sl.registerLazySingleton<UpdatePasswordUseCase>(
    () => UpdatePasswordUseCase(profileRepository: sl()),
  );
  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(profileRepository: sl()),
  );
  sl.registerLazySingleton<GetAllPostsUseCase>(
    () => GetAllPostsUseCase(postsRepository: sl()),
  );
  sl.registerLazySingleton<MakePostUseCase>(
    () => MakePostUseCase(postsRepository: sl()),
  );
  sl.registerLazySingleton<LikeOrUnlikeUseCase>(
    () => LikeOrUnlikeUseCase(postsRepository: sl()),
  );
  sl.registerLazySingleton<SearchPostsUseCase>(
    () => SearchPostsUseCase(searchRepository: sl()),
  );
}

void _registerBlocs() {
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      resetPasswordUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );
  sl.registerLazySingleton<SettingsBloc>(
    () => SettingsBloc(
      getSavedSettingsUseCase: sl(),
      changeSettingsUseCase: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(
      getUserInfoUseCase: sl(),
      logoutUseCase: sl(),
      updateEmailUseCase: sl(),
      updatePasswordUseCase: sl(),
      updateProfileUseCase: sl(),
    ),
  );
  sl.registerLazySingleton<PostsBloc>(
    () => PostsBloc(
      getAllPostsUseCase: sl(),
      makePostUseCase: sl(),
      likeOrUnlikeUseCase: sl(),
    ),
  );
  sl.registerLazySingleton<SearchBloc>(
    () => SearchBloc(searchPostsUseCase: sl(), userService: sl()),
  );
}
