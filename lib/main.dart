import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:simple_football/pages/bank_page.dart';
import 'package:simple_football/pages/chat_page.dart';
import 'package:simple_football/pages/design_page.dart';
import 'package:simple_football/pages/login_page.dart';
import 'package:simple_football/pages/stream_page.dart';
import 'package:simple_football/pages/teams_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromPath("config/keys.json");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController(initialPage: 0, keepPage: true);
  int bottomTapIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void bottomTapped(int index) {
    setState(() {
      bottomTapIndex = index;
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomTapIndex = index;
    });
  }

  void loginPressed() {
    bottomTapped(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          body: _getPageView(),
          bottomNavigationBar: _getBottomNavigationBar(),
        ),
      ),
    );
  }

  PageView _getPageView() {
    return PageView(
      children: <Widget>[
        ChatPage(),
        StreamPage(),
        DesignPage(),
        LoginPage(),
        TeamsPage(),
        BankPage(),
      ],
      onPageChanged: (index) {
        pageChanged(index);
      },
      scrollDirection: Axis.horizontal,
      controller: controller,
    );
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1B3F22),
        selectedLabelStyle: TextStyle(color: Colors.black, fontSize: 22),
        selectedIconTheme: IconThemeData(color: Colors.yellow, size: 35),
        showSelectedLabels: true,
        onTap: (index) {
          bottomTapped(index);
        },
        currentIndex: bottomTapIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.white38, size: 25),
            title: Text(
              'Chat',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white38, size: 25),
            title: Text(
              'Stream',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white38, size: 25),
            title: Text(
              'Design',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white38, size: 25),
            title: Text(
              'Login',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart, color: Colors.white38, size: 25),
            title: Text(
              'Football',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance, color: Colors.white38, size: 25),
            title: Text(
              'Bank',
              style: TextStyle(color: Colors.white38, fontSize: 15),
            ),
          ),
        ]);
  }
}
