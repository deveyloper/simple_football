import 'dart:convert';

import 'package:http/http.dart' as httpOperations;
import 'package:simple_football/models/ApiResult.dart';

class Standings {
  var url = 'http://api.football-data.org/v2/competitions/2021/standings';

  Future<ApiResult> test() async {
    var headers = Map<String, String>();
    headers.putIfAbsent(
        "X-Auth-Token", () => "ebcd56f1c1f5407fa3ce9e56496d403a");

    var responseData = await httpOperations.get(url, headers: headers);
    var dynamicData = json.decode(responseData.body);
    ApiResult apiResult = ApiResult.fromJson(dynamicData);
    return apiResult;
  }
}
