import 'dart:convert';

import 'package:complete_example/app/data/helpers/http_method.dart';
import 'package:http/http.dart';

dynamic _parseBody(dynamic body) {
  try {
    return jsonEncode(body);
  } catch (_) {
    return body;
  }
}

Future<Response> sendRequest({
  required Uri url,
  required HttpMethod method,
  required Map<String, String> headers,
  required dynamic body,
  required Duration timeOut,
}) {
  var finalHeaders ={...headers};
  if (method != HttpMethod.get) {
    final contentType = headers['Content-Type'];
    if (contentType == null || contentType.contains("application/json")) {
      finalHeaders['Content-Type'] = "application/json; charset=UTF-8";
      body = _parseBody(body);
    }
  }
  final client = Client();

  switch (method) {
    case HttpMethod.get:
      return get(url, headers:finalHeaders).timeout(timeOut);
      break;
    case HttpMethod.post:
      return post(url, headers:finalHeaders, body: body).timeout(timeOut);

      break;
    case HttpMethod.put:
      return put(url, headers:finalHeaders, body: body).timeout(timeOut);
      break;
    case HttpMethod.patch:
      return patch(url, headers:finalHeaders, body: body).timeout(timeOut);
      break;
    case HttpMethod.delete:
      return delete(url, headers:finalHeaders, body: body).timeout(timeOut);
      break;
  }
}
