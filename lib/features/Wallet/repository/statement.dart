import 'package:app_ewally/features/Wallet/model/statement.dart';
import 'package:app_ewally/services/ApiService/api_service.dart';
import 'package:dio/dio.dart';

Future<List<StatementModel>> fetchStatement() async {

  final String endpoint = '/b2b/statement?initialDate=2019-01-01&finalDate=2019-01-31';
  Dio client = await ApiService.getClient();
  List<StatementModel> statement;

  Response response = await client.get(endpoint).catchError((e){
    return e.response;
  });

  if(response.data.containsKey('msg')){
    statement = [];
  }
  else {
    List<dynamic> body = response.data['statement'];
    statement = body.map(
            (i) => StatementModel.fromJSON(i)
    ).toList();
  }



  return statement;
}