import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as httpOperations;
import 'package:simple_football/Common/Result.dart';

class ApiUtility {
  Future<Result<httpOperations.Response>> get(String url) async {
    var headers = Map<String, String>();
    var authToken = GlobalConfiguration().getString("auth-key");
    headers.putIfAbsent("X-Auth-Token", () => authToken);

    try {
      var response = await httpOperations.get(url, headers: headers);
      print(response.body);
      return Result<httpOperations.Response>.asSuccess(response);
    } catch (error) {
      return Result<httpOperations.Response>.asError(error);
    }
  }
}
