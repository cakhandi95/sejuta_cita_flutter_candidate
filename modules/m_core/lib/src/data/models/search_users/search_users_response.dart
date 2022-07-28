import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchUsersResponse extends Equatable {
  final int totalCount;
  final bool incompleteResults;
  final List<SearchUsersModel>? items;

  const SearchUsersResponse({
    required this.totalCount,
    required this.incompleteResults,
    this.items,
  });

  factory SearchUsersResponse.fromJson(Map<String, dynamic> json) => SearchUsersResponse(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? null : List<SearchUsersModel>.from(json["items"].map((x) => SearchUsersModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? null : List<SearchUsersModel>.from(items!.map((x) => x.toJson())),
  };

  SearchUsersResponse toEntity() => SearchUsersResponse(
      totalCount: totalCount,
      incompleteResults: incompleteResults,
      items: items
  );

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];
}
