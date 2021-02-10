import 'package:app_ewally/features/Design/colors.dart';
import 'package:app_ewally/features/SplashScreen/screens/splash_screen.dart';
import 'package:app_ewally/services/SharedPreferences/sp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int page = 0;

  Color lightBlue = DesignColors.lightBlue();
  Color greenPool = DesignColors.greenPool();
  Color white = DesignColors.white();

  Size size;

  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    Shared.getToken().then((value) => print(value));
    widgets = [
      Container(color: white),
      Container(color: greenPool),
    ];

  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      appBar: _appBar(),
      body: widgets[page],
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation(){

    return BottomNavigationBar(
        iconSize: size.width * 0.08,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: greenPool.withOpacity(0.4),
        selectedItemColor: greenPool,
        backgroundColor: lightBlue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: page,
        onTap: (p){
          setState(() {
            page = p;
          });
        },
        items: _itemsBottomNavigation()
    );
  }

  List<BottomNavigationBarItem> _itemsBottomNavigation (){
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Início'),
      BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          activeIcon: Icon(Icons.dashboard),
          label: 'Gráficos'
      ),
    ];
  }

  Widget _appBar(){
    return AppBar(
        backgroundColor: lightBlue,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: (){
              Shared.resetToken();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_)=> SplashScreen())
              );
            },
          )
        ],
        title: Text(
          'MyWallet',
          style: TextStyle(
              color: greenPool,
              fontSize: size.width * 0.05
          ),
        )
    );
  }

}
