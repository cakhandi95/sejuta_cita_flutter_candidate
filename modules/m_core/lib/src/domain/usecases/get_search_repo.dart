import 'package:m_core/m_core.dart';
import 'package:dartz/dartz.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class GetSearchRepo {

  final SearchRepoRepository repository;

  GetSearchRepo(this.repository);

  Future<Either<Failure,SearchRepoResponse>> execute(String keyword, int? pages) {
    return repository.getSearchRepo(keyword, pages);
  }
}
