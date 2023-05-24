import 'dart:convert';

import 'package:final_project_tpm_pizza/ui/homepage.dart';
import 'package:final_project_tpm_pizza/ui/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool isChecked = false;
  late Box box1;
  // late SharedPreferences logindata;
  // late bool newuser;

  Future<void> _login(BuildContext) async {
    // final String email = _email.text;
    // final String pass = _pass.text;

    final url = Uri.parse(
        'http://localhost/semester_6_BE/login.php'); // Replace with the URL of your login script

    final response = await http.post(
      url,
      body: {
        'email': _email.text,
        'pass': _pass.text,
      },
    );

    var dataUser = jsonDecode(response.body);

    if (dataUser != "") {
      print('login success');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage())
      );
    } else {
      print('login failed');
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => HomePage())
      // );
    }
  }

  //   if (response.statusCode == 200) {
  //     //final message = response.body;
  //     // Login successful
  //     print('Login successful');
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //     );
  //     // if(message.toLowerCase().contains('login successfull')){
  //     //   Navigator.pushReplacement(
  //     //     context,
  //     //     MaterialPageRoute(builder: (context) => HomePage()),
  //     //   );
  //     //   _email.clear();
  //     //   _pass.clear();
  //     // } else {
  //     //   print('login failed');
  //     // }
  //   } else {
  //     // Login failed
  //     print('Login failed');
  //   }
  //   //return true;
  // }

  // void _login(BuildContext context) async {
  //   final String email = _email.text;
  //   final String pass = _pass.text;
  //
  //   final result = await login(email, pass);
  //
  //   if (result == true) {
  //     // Login successful, navigate to the dashboard screen
  //     print('Successfull');
  //     // logindata.setBool('login', false);
  //     // logindata.setString('email', _email as String);
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomePage()),
  //     );
  //   } else {
  //     // Login failed, display an error message
  //     showDialog(
  //       context: context,
  //       builder: (context) =>
  //           AlertDialog(
  //             title: Text('Login Failed'),
  //             content: Text('Invalid email or password. Please try again.'),
  //             actions: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text('OK'),
  //               ),
  //             ],
  //           ),
  //     );
  //   }
  // }

  // Future<bool> login(String email, String pass) async {
  //   final url = Uri.parse(
  //       'http://localhost/semester_6_BE/login.php'); // Replace with the URL of your login script
  //
  //   final response = await http.post(
  //     url,
  //     body: {
  //       'email': email,
  //       'pass': pass,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // Login successful
  //     print('Login successful');
  //   } else {
  //     // Login failed
  //     print('Login failed');
  //   }
  //   return true;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   check_if_already_login();
  // }

  // void check_if_already_login () async {
  //   logindata = await SharedPreferences.getInstance();
  //   newuser = (logindata.getBool('login') ?? true);
  //   print(newuser);
  //   if(newuser == false){
  //     Navigator.pushReplacement(context,
  //         new MaterialPageRoute(builder: (context) => HomePage())
  //     );
  //   }
  // }

  // @override
  // void dispose(){
  //   _email.dispose();
  //   _pass.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   createBox();
  // }
  //
  // void createBox() async {
  //   box1 = await Hive.openBox('logindata');
  //   getData();
  // }
  //
  // void getData() async {
  //   if (box1.get('.') != null) {
  //     _email.text = box1.get('email');
  //     isChecked = true;
  //     setState(() {
  //
  //     });
  //   }
  //   if (box1.get('pass') != null) {
  //     _pass.text = box1.get('pass');
  //     isChecked = true;
  //     setState(() {
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
            backgroundColor: Colors.orange[700],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 100,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.orange
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.orange
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Remember Me",
              //         style: TextStyle(color: Colors.black)
              //     ),
              //     Checkbox(
              //       value: isChecked,
              //       onChanged: (value) {
              //         isChecked = !isChecked;
              //         setState(() {
              //
              //         });
              //       },
              //     ),
              //   ],
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 55,
                child: ElevatedButton(
                    onPressed: () {
                      _login(context);
                    },
                    child: Text('Login')
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => RegistrationPage())
                        );
                      },
                      child : Text(" Register Now"),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}