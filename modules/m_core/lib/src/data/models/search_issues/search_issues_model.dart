import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class SearchIssuesModel extends Equatable {

  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final bool locked;
  final int comments;
  final String createdAt;
  final String updatedAt;
  final String body;
  final String timelineUrl;
  final int score;
  final bool draft;

  const SearchIssuesModel({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.locked,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.body,
    required this.timelineUrl,
    required this.score,
    required this.draft
  });

  @override
  List<Object?> get props => [
    url,
    repositoryUrl,
    labelsUrl,
    commentsUrl,
    eventsUrl,
    htmlUrl,
    id,
    nodeId,
    number,
    title,
    locked,
    comments,
    createdAt,
    updatedAt,
    body,
    timelineUrl,
    score,
    draft
  ];

  factory SearchIssuesModel.fromJson(Map<String, dynamic> json) => SearchIssuesModel(
    url: json["url"],
    repositoryUrl: json["repository_url"],
    labelsUrl: json["labels_url"],
    commentsUrl: json["comments_url"],
    eventsUrl: json["events_url"],
    htmlUrl: json["html_url"],
    id: json["id"],
    nodeId: json["node_id"],
    number: json["number"],
    title: json["title"],
    locked: json["locked"],
    comments: json["comments"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    body: json["body"],
    timelineUrl: json["timeline_url"],
    score: json["score"],
    draft: json["draft"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "repository_url": repositoryUrl,
    "labels_url": labelsUrl,
    "comments_url": commentsUrl,
    "events_url": eventsUrl,
    "html_url": htmlUrl,
    "id": id,
    "node_id": nodeId,
    "number": number,
    "title": title,
    "locked": locked,
    "comments": comments,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "body": body,
    "timeline_url": timelineUrl,
    "score": score,
    "draft": draft,
  };

}
