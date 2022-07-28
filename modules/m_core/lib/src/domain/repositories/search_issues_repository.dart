import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

abstract class SearchIssuesRepository {

  /// Remote API Resource
  Future<Either<Failure,SearchIssuesResponse>> getSearchIssues(String keyword, int? pages);
}
