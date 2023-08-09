import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class BaseApiLogInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (kDebugMode) {
      print('Headers ${data.headers}');
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (kDebugMode) {
      print('Code ${data.statusCode}');
      print('Headers ${data.headers}');
      print('Body ${data.body}');
    }
    return data;
  }
}
