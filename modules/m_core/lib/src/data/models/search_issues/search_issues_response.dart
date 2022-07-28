import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchIssuesResponse extends Equatable {
  final int totalCount;
  final bool incompleteResults;
  final List<SearchIssuesModel>? items;

  const SearchIssuesResponse({
    required this.totalCount,
    required this.incompleteResults,
    this.items,
  });

  factory SearchIssuesResponse.fromJson(Map<String, dynamic> json) => SearchIssuesResponse(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? null : List<SearchIssuesModel>.from(json["items"].map((x) => SearchRepoModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? null : List<SearchIssuesModel>.from(items!.map((x) => x.toJson())),
  };

  SearchIssuesResponse toEntity() => SearchIssuesResponse(
      totalCount: totalCount,
      incompleteResults: incompleteResults,
      items: items
  );

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];
}
