import 'package:get_it/get_it.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 22/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

final locator = GetIt.instance;

void init() {

  /// TODO HANDY : CUBIT
  locator.registerFactory(() => SearchIssuesCubit(getSearchIssues: locator()));
  locator.registerFactory(() => SearchUsersCubit(getSearchUsers: locator()));
  locator.registerFactory(() => SearchRepoCubit(getSearchRepo: locator()));

  /// TODO HANDY : USECASES - SEARCH GITHUB
  locator.registerLazySingleton(() => GetSearchIssues(locator()));
  locator.registerLazySingleton(() => GetSearchRepo(locator()));
  locator.registerLazySingleton(() => GetSearchUsers(locator()));

  /// TODO HANDY : m_core/lib/src/data/repositories/
  locator.registerLazySingleton<SearchIssuesRepository>(
        () => SearchIssuesRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<SearchIssuesRepository>(
        () => SearchIssuesRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<SearchRepoRepository>(
        () => SearchRepoRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<SearchUsersRepository>(
        () => SearchUsersRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  /// TODO HANDY : data/datasources/xxxx_remote_data_source.dart
  locator.registerLazySingleton<SearchIssuesRemoteDataSource>(
        () => SearchIssuesRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<SearchRepoRemoteDataSource>(
        () => SearchRepoRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  locator.registerLazySingleton<SearchUsersRemoteDataSource>(
        () => SearchUsersRemoteDataSourceImpl(
      client: locator(),
    ),
  );
}
