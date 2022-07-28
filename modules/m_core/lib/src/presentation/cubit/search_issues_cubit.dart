import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchIssuesCubit extends Cubit<SearchIssuesState> {

  final GetSearchIssues getSearchIssues;

  SearchIssuesCubit({required this.getSearchIssues}) : super(const SearchIssuesInitState());

  Future<void> get(String keyword, int? pages) async {

    emit(const SearchIssuesLoadingState());

    final result = await getSearchIssues.execute(keyword, pages);

    result.fold((failed) => emit(SearchIssuesErrorState(message: failed.message, httpStatus: failed.httpStatus.toString())), (data) => {
      if (data.items!.isNotEmpty) {
        emit(SearchIssuesLoadedState(items: data.items)),
      } else {
        emit(const SearchIssuesMessageState(message: 'Maaf. Data anda kosong>')),
      }
    });

  }

}
