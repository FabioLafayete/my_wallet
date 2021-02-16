import 'package:app_ewally/features/Login/model/SignIn.dart';
import 'package:app_ewally/services/ApiService/api_service.dart';
import 'package:dio/dio.dart';

Future<SignIn> signIn(String user, String password) async {

  final String endpoint = '/user/login';

  Dio client = await ApiService.getClient(noToken: true);

  Response response = await client.post(
      endpoint,
      data: {
        "username": user.trim(),
        "password": password
      }).catchError((e){
        return e.response;
      });

  SignIn signIn = SignIn.fromJSON(response.data);
  if(signIn.error != null)
    signIn.errorData = true;

  return signIn;

}