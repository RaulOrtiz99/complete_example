import 'package:complete_example/app/data/helpers/http_method.dart';
import 'package:complete_example/app/data/helpers/http_result.dart';
import 'package:complete_example/app/data/helpers/parse_response_body.dart';
import 'package:complete_example/app/data/helpers/send_request.dart';

typedef Parser<T> = T Function(dynamic data);

class Http {
  final String baseUrl;
  Http({this.baseUrl = ''});
  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParameters = const {},
    dynamic body,
    Parser<T>? parser,
    Duration timeOut = const Duration(seconds: 10),
  }) async {
    int? statusCode;
    dynamic? data;
    try {
      late Uri url;
      if (path.startsWith("http://") || path.startsWith("https://")) {
        url = Uri.parse(path);
      } else {
        url = Uri.parse('$baseUrl$path');
      }
      if (queryParameters.isNotEmpty) {
        url = url.replace(queryParameters: {
          ...url.queryParameters,
          ...queryParameters,
        });
      }
      final response = await sendRequest(
        url: url,
        method: method,
        headers: headers,
        body: body,
        timeOut: timeOut,
      );
      data = parseResponseBody(response.body);
      statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpError(
          data: data,
          stackTrace: StackTrace.current,
          exception: null,
        );
      }
      return HttpResult<T>(
        error: null,
        data: parser != null ? parser(data) : data,
        statusCode: statusCode,
      );
    } catch (e, s) {
      if (e is HttpError) {
        return HttpResult<T>(
          data: null,
          statusCode: statusCode,
          error: e,
        );
      }
      return HttpResult(
        data: null,
        statusCode: -1,
        error: HttpError(
          data: data,
          exception: e,
          stackTrace: s,
        ),
      );
    }
  }
}
