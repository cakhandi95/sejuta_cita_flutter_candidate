import 'dart:io';
import 'package:m_core/m_core.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

///
/// Created by Handy on 23/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

abstract class SearchRepoRemoteDataSource {
  Future<SearchRepoResponse> getSearchRepositories(String keyword, int? pages);
}

class SearchRepoRemoteDataSourceImpl extends SearchRepoRemoteDataSource {

  final http.Client client;

  SearchRepoRemoteDataSourceImpl({required this.client});

  @override
  Future<SearchRepoResponse> getSearchRepositories(String keyword, int? pages) async {
    var url = "${ConfigApp.urlApiServerProduction}repositories?q=$keyword";

    if (pages != null) {
      url = "${ConfigApp.urlApiServerProduction}repositories?q=$keyword&page=$pages}";
    }

    var authGithub = ConfigApp.authGithub;

    final response = await client.get(
      Uri.parse(url),
      headers: <String, String> {
        HttpHeaders.authorizationHeader: authGithub,
      },
    );

    if (response.statusCode == 200) {
      return SearchRepoResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException(response.statusCode.toString(), NetworkUtils.code(response.statusCode.toString()));
    }
  }

}