import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class BaseApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers['Content-Type'] = 'application/json';
      data.headers['Accept'] = 'application/json';
    } catch (exception) {
      if (kDebugMode) {
        String detail = exception.toString();
        print('Error request $detail');
      }
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
