import 'package:m_core/m_core.dart';
import 'package:m_core/src/domain/usecases/get_search_users.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchUsersCubit extends Cubit<SearchUsersState> {
  
  final GetSearchUsers getSearchUsers;
  
  SearchUsersCubit({required this.getSearchUsers}) : super(const SearchUsersInitState());
  
  Future<void> get(String keyword, int? pages) async {
    emit(const SearchUsersLoadingState());

    final results = await getSearchUsers.execute(keyword, pages);

    results.fold((failure) => emit(SearchUsersErrorState(httpStatus: failure.httpStatus, message: failure.message)), (data) => {
      if (data.items!.isNotEmpty) {
        emit (SearchUsersLoadedState(items: data.items)),
      } else {
        emit (const SearchUsersMessageState(message: 'Maaf. Data anda kosong>')),
      }
    });
  }
  
}
