import 'dart:convert';

import 'package:app_ewally/services/ApiService/api_service.dart';
import 'package:dio/dio.dart';

Future<dynamic> fetchBalance() async {

  final String endpoint = '/account/balance';
  dynamic result;

  Dio client = await ApiService.getClient();

  Response response = await client.get(endpoint).catchError((e){return e.response;});

  if(response.data.containsKey('msg')){
    result = response.data['msg'];
  } else if (response.data.containsKey('balance')){
    result = response.data['balance'];
  } else result = response.data;


  return result;
}