



import 'dart:convert';

parseResponseBody(String responseBody){
  try {
    return jsonEncode(responseBody);
  }catch(_){
    return responseBody;
  }
}