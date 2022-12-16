
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../../../utils/links.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  Future<void> _signup(String email,String password)async{
    final response = await http.post(Uri.parse(ApiUrls.baseUrl+'/api/register'),body: {
      "email":email,
      "password":password,
    });
    var data = jsonDecode(response.body);
    if(response.statusCode== 200){
      print('signup successfully');
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          LoginScreen()));
    }else{
      print('signup failed');
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'SingUp Page',
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '____(_-_)____',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: .5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: .5)),
                  fillColor: Colors.grey[300],
                  filled: true,
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: .5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: .5)),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: .5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: .5)),
                  fillColor: Colors.grey[300],
                  filled: true,
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: .5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: .5)),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signup(emailController.text, passwordController.text);
                    }else{
                      print('sign up failed');
                    }
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
