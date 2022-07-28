import 'dart:io';
import 'package:m_core/m_core.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

///
/// Created by Handy on 23/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

abstract class SearchIssuesRemoteDataSource {
  Future<SearchIssuesResponse> getSearchIssues(String keyword, int? pages);
}

class SearchIssuesRemoteDataSourceImpl implements SearchIssuesRemoteDataSource {

  final http.Client client;

  SearchIssuesRemoteDataSourceImpl({required this.client});

  @override
  Future<SearchIssuesResponse> getSearchIssues(String keyword, int? pages) async {
    var url = "${ConfigApp.urlApiServerProduction}issues?q=$keyword";

    if (pages != null) {
      url = "${ConfigApp.urlApiServerProduction}issues?q=$keyword&page=$pages}";
    }

    var authGithub = ConfigApp.authGithub;

    final response = await client.get(
      Uri.parse(url),
      headers: <String, String> {
        HttpHeaders.authorizationHeader: authGithub,
      },
    );

    if (response.statusCode == 200) {
      return SearchIssuesResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException(response.statusCode.toString(), NetworkUtils.code(response.statusCode.toString()));
    }
  }

}
