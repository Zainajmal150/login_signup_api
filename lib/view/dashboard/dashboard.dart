import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/view/pages/Auth/loginpage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Login Succesfully',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>LoginScreen(),));
          }, child: Text('Logout'))
        ],
      ),
    );
  }
}
