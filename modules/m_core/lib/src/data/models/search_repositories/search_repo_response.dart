import 'package:m_core/m_core.dart';

///
/// Created by Handy on 23/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchRepoResponse extends Equatable {

  final int totalCount;
  final bool incompleteResults;
  final List<SearchRepoModel>? items;

  const SearchRepoResponse({
    required this.totalCount,
    required this.incompleteResults,
    this.items,
  });

  factory SearchRepoResponse.fromJson(Map<String, dynamic> json) => SearchRepoResponse(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? null : List<SearchRepoModel>.from(json["items"].map((x) => SearchRepoResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? null : List<SearchRepoModel>.from(items!.map((x) => x.toJson())),
  };

  SearchRepoResponse toEntity() => SearchRepoResponse(
      totalCount: totalCount,
      incompleteResults: incompleteResults,
      items: items
  );

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];

}

