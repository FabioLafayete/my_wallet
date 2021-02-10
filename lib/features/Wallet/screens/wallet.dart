import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return ListView(
      children: [
        _balance(),
        _br(0.08),
        Container(
          width: size.width,
          height: size.width * 0.1,
          color: Colors.grey.withOpacity(0.5),
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.07),
                child: Text('7 dias',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.07),
                child: Text('15 dias',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.07),
                child: Text('30 dias',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.07),
                child: Text('Outro',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500
                    )
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _balance(){
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.width * 0.1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saldo em conta'),
          Text('R\$ 2.020,88',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.07
              )
          )
        ],
      ),
    );
  }

  Widget _br(double number){
    return SizedBox(height: size.width * number);
  }

}
