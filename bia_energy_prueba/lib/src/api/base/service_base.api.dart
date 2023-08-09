import 'dart:convert';

import 'package:bia_energy_prueba/src/api/base/service_base_interceptor.api.dart';
import 'package:bia_energy_prueba/src/api/base/service_base_log.api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class BaseService {
  late Client client;
  BaseService() {
    client = InterceptedClient.build(interceptors: [
      BaseApiInterceptor(),
      BaseApiLogInterceptor(),
    ]);
  }
  static const int timeOut = 80;

  dynamic get(String endpoint, String? params, [int tOut = timeOut]) {
    if (params != null) {
      if (kDebugMode) print('REQUEST GET: ${endpoint + params}');
      return client
          .get(Uri.parse(endpoint + params))
          .timeout(Duration(seconds: tOut));
    }
    if (kDebugMode) print('REQUEST GET: $endpoint');
    return client.get(Uri.parse(endpoint));
  }

  dynamic delete(String endpoint) {
    return client
        .delete(Uri.parse(endpoint))
        .timeout(const Duration(seconds: timeOut));
  }

  dynamic post(String endpoint, dynamic data) {
    if (kDebugMode) {
      print(endpoint.toString());
    }
    return client
        .post(Uri.parse(endpoint), body: data)
        .timeout(const Duration(seconds: timeOut));
  }

  dynamic patch(String endpoint, dynamic data, String? params) {
    if (params != null) {
      return client
          .patch(Uri.parse(endpoint + params), body: data)
          .timeout(const Duration(seconds: timeOut));
    }
    return client.patch(Uri.parse(endpoint));
  }

  dynamic decode(dynamic response) {
    return json.decode(response);
  }
}
