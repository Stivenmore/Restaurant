import 'package:restaurant/data/apis/api_utils.dart';
import 'package:restaurant/data/response/result.dart';

class Api {
  final ApiUtils _apiUtils;

  Api({required ApiUtils apiUtils}) : _apiUtils = apiUtils;

  Future<Result<dynamic, BackendError>> getAllCharacter(
      {required int page}) async {
    final result = await _apiUtils.makeRequest(
        method: Method.get,
        path: "/api/character/",
        queryParameters: {"page": page.toString()});
    return result.when(
        fail: (fail) => Fail(fail), success: (success) => Success(success));
  }
}
