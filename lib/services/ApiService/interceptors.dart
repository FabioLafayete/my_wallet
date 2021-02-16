import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper{
  @override
  onResquest(RequestOptions options){
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response){
    print("REQUEST[${response.statusCode}] => PATH: ${response.request.path}");
    return super.onResponse(response);
  }

  @override
  onError(DioError e){
    print("REQUEST[${e.message}] => PATH: ${e.request.path}");
    return super.onError(e);
  }

}