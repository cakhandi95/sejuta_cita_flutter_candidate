import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class GetSearchIssues {

  final SearchIssuesRepository repository;

  GetSearchIssues(this.repository);

  Future<Either<Failure,SearchIssuesResponse>> execute(String keyword, int? pages) {
    return repository.getSearchIssues(keyword, pages);
  }
}
