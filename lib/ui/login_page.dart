import 'package:final_project_tpm_pizza/ui/homepage.dart';
import 'package:final_project_tpm_pizza/ui/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController _email = TextEditingController();
final TextEditingController _pass = TextEditingController();
bool _showError = false;
bool _rememberMe = false;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _checkLoginStatus();

    setState(() {
      _rememberMe = _prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _email.text = _prefs.getString('email') ?? '';
        _pass.text = _prefs.getString('password') ?? '';
      }
    });
  }

  void _checkLoginStatus() {
    bool isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      _email.text = _prefs.getString('email') ?? '';
      _pass.text = _prefs.getString('password') ?? '';
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Dashboard()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text("Remember Me",
                      style: TextStyle(color: Colors.black)
                  ),
                ],
              ),
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
              ),
          ]
       )
    );
  }

  Future<void> _login(BuildContext context) async {
    final String email = _email.text;
    final String password = _pass.text;

    final response = await http.post(
      Uri.parse('http://localhost/semester_6_BE/login.php'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final message = response.body;

      if (message.toLowerCase().contains('login successful')) {
        await _prefs.setBool('isLoggedIn', true);

        if (_rememberMe) {
          await _prefs.setString('email', email);
          await _prefs.setString('password', password);
          await _prefs.setBool('rememberMe', true);
        } else {
          await _prefs.remove('email');
          await _prefs.remove('password');
          await _prefs.setBool('rememberMe', false);
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        _email.clear();
        _pass.clear();
      } else {
        // Login failed
        setState(() {
          _showError = true;
        });
      }
    } else {
      // Failed to connect to server
      setState(() {
        _showError = true;
      });
    }
  }
}

// import 'package:final_project_tpm_pizza/ui/homepage.dart';
// import 'package:final_project_tpm_pizza/ui/registration_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart' as http;
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _pass = TextEditingController();
//   bool isChecked = false;
//   late Box box1;
//
//   Future<void> _login(BuildContext context) async {
//     final String email = _email.text;
//     final String pass = _pass.text;
//
//     final url = Uri.parse(
//         'http://localhost/semester_6_BE/login.php'
//     ); // Replace with the URL of your login script
//
//     final response = await http.post(
//       url,
//       body: {
//         'email': email,
//         'pass': pass,
//       }
//     );
//
//     if (response.statusCode == 200) {
//       final message = response.body;
//       // Login successful
//       print('Login successful');
//
//       if(message.toLowerCase().contains('login successful')){
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//         _email.clear();
//         _pass.clear();
//       } else {
//         print('login failed');
//       }
//     } else {
//       // Login failed
//       print('Login failed');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Login Page'),
//             backgroundColor: Colors.orange[700],
//           ),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               FlutterLogo(
//                 size: 100,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: TextFormField(
//                   controller: _email,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     labelStyle: TextStyle(
//                         color: Colors.orange
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                             color: Colors.orange
//                         )
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                             color: Colors.orange
//                         )
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: TextFormField(
//                   controller: _pass,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(
//                         color: Colors.orange
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                             color: Colors.orange
//                         )
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(
//                             color: Colors.orange
//                         )
//                     ),
//                   ),
//                 ),
//               ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Text("Remember Me",
//               //         style: TextStyle(color: Colors.black)
//               //     ),
//               //     Checkbox(
//               //       value: isChecked,
//               //       onChanged: (value) {
//               //         isChecked = !isChecked;
//               //         setState(() {
//               //
//               //         });
//               //       },
//               //     ),
//               //   ],
//               // ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width,
//                 height: 55,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       _login(context);
//                     },
//                     child: Text('Login')
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                      Text("New User?"),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) => RegistrationPage())
//                         );
//                       },
//                       child : Text(" Register Now"),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
// }