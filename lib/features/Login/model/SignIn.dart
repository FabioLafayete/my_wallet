class SignIn{

  String token, error;

  bool errorData;

  SignIn({
    this.token,
    this.error,
    this.errorData = false
  });

  bool hasError () => this.errorData;

  factory SignIn.fromJSON(Map<String, dynamic> json){
    if(json.containsValue(106))
      return SignIn(
          error: json['msg']
      );
    else
      return SignIn(
        token: json['token'],
      );
  }

  Map<String, dynamic> toJson(){
    return {
      "token": token,
    };
  }

}