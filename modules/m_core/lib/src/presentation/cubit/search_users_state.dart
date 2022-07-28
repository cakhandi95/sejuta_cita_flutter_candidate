import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchUsersState extends Equatable {
  const SearchUsersState();

  @override
  List<Object?> get props => [];
}

class SearchUsersInitState extends SearchUsersState {
  const SearchUsersInitState();
}

class SearchUsersLoadingState extends SearchUsersState {
  const SearchUsersLoadingState();
}

class SearchUsersLoadedState extends SearchUsersState {

  final List<SearchUsersModel>? items;

  const SearchUsersLoadedState({required this.items});

  @override
  List<Object?> get props => [items];
}

class SearchUsersMessageState extends SearchUsersState {

  final String message;

  const SearchUsersMessageState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SearchUsersErrorState extends SearchUsersState {

  final String httpStatus;
  final String message;

  const SearchUsersErrorState({required this.httpStatus , required this.message});

  @override
  List<Object?> get props => [httpStatus, message];
}
