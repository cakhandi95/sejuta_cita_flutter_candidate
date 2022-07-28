import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchIssuesState extends Equatable {
  const SearchIssuesState();

  @override
  List<Object?> get props => [];
}

class SearchIssuesInitState extends SearchIssuesState {
  const SearchIssuesInitState();
}

class SearchIssuesLoadingState extends SearchIssuesState {
  const SearchIssuesLoadingState();
}

class SearchIssuesLoadedState extends SearchIssuesState {

  final List<SearchIssuesModel>? items;

  const SearchIssuesLoadedState({required this.items});

  @override
  List<Object?> get props => [items];
}

class SearchIssuesMessageState extends SearchIssuesState {

  final String message;

  const SearchIssuesMessageState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SearchIssuesErrorState extends SearchIssuesState {

  final String httpStatus;
  final String message;

  const SearchIssuesErrorState({required this.httpStatus , required this.message});

  @override
  List<Object?> get props => [httpStatus, message];
}
