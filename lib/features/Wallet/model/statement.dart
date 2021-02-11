class StatementModel{

  String createdAt, operationType;
  int amount, balance;


  StatementModel({
    this.createdAt,
    this.balance,
    this.operationType,
    this.amount
  });

  factory StatementModel.fromJSON(Map<String, dynamic> json){
    return StatementModel(
        createdAt: json['createdAt'],
        balance: json['balance'],
        operationType: json['operationType'],
        amount: json['amount']
    );
  }

}