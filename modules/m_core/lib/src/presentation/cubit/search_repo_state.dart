import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchRepoState extends Equatable {
  const SearchRepoState();

  @override
  List<Object?> get props => [];
}

class SearchRepoInitState extends SearchRepoState {
  const SearchRepoInitState();
}

class SearchRepoLoadingState extends SearchRepoState {
  const SearchRepoLoadingState();
}

class SearchRepoLoadedState extends SearchRepoState {

  final List<SearchRepoModel>? items;

  const SearchRepoLoadedState({required this.items});

  @override
  List<Object?> get props => [items];
}

class SearchRepoMessageState extends SearchRepoState {

  final String message;

  const SearchRepoMessageState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SearchRepoErrorState extends SearchRepoState {

  final String httpStatus;
  final String message;

  const SearchRepoErrorState({required this.httpStatus , required this.message});

  @override
  List<Object?> get props => [httpStatus, message];
}
