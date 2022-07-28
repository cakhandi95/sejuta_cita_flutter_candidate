import 'dart:io';

import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchIssuesRepositoryImpl extends SearchIssuesRepository {

  final SearchIssuesRemoteDataSource remoteDataSource;

  SearchIssuesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SearchIssuesResponse>> getSearchIssues(String keyword, int? pages) async {
    try {
      final result = await remoteDataSource.getSearchIssues(keyword, pages);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.httpStatus.toString(), e.message));
    } on SocketException {
      return const Left(ConnectionFailure('0','Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('0','Certificated not valid ${e.message}'));
    } catch (e) {
      return Left(CommonFailure('0',"search_issues : ${e.toString()}"));
    }
  }

}
