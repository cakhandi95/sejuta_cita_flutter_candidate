import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchRepoCubit extends Cubit<SearchRepoState> {

  final GetSearchRepo getSearchRepo;

  SearchRepoCubit({required this.getSearchRepo}) : super(const SearchRepoInitState());

  Future<void> get(String keyword, int? pages) async {

    emit(const SearchRepoLoadingState());

    final results = await getSearchRepo.execute(keyword, pages);

    results.fold((failure) => emit(SearchRepoErrorState(httpStatus: failure.httpStatus, message: failure.message)), (data) => {
      if (data.items!.isNotEmpty) {
        emit (SearchRepoLoadedState(items: data.items)),
      } else {
        emit (const SearchRepoMessageState(message: 'Maaf. Data anda kosong>')),
      }
    });
  }

}
