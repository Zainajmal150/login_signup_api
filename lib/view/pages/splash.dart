import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/view/dashboard/dashboard.dart';
import 'package:login_signup/view/pages/Auth/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkLogin();
    });
  }
  checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool isLogin =  preferences.getBool('islogin') ?? false;
    if(isLogin){
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (_)=>DashBoard()));
    }else{
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://e7.pngegg.com/pngimages/654/859/png-clipart-apple-logo-cupertino-cartoon-crowd-company-computer.png',
          height: MediaQuery.of(context).size.height*0.1,
          width:MediaQuery.of(context).size.width*0.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
