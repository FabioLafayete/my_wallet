import 'package:app_ewally/services/ApiService/api_service.dart';
import 'package:dio/dio.dart';

Future<dynamic> fetchStatement() async {

  final String endpoint = '/b2b/statement?initialDate=2019-01-01&finalDate=2019-01-31';
  dynamic result;

  Dio client = await ApiService.getClient();

  Response response = await client.get(endpoint).catchError((e){
    return e.response;
  });

  if(response.data.containsValue(110)){
    result = response.data['msg'];
  } else if (response.data.containsKey('balance')){
    result = response.data['balance'];
  } else result = response.data;


  return result;
}