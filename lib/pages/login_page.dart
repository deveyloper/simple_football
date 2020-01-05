import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Function onPressedCallBack;

  LoginPage({this.onPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/stadium.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.white70,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'E-Mail',
                    hintStyle: TextStyle(color: Colors.white),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    )),
                autofocus: false,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    )),
                autofocus: false,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {onPressedCallBack();},
                    child: Text(
                      "LOG IN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
