import 'dart:convert';
import 'package:final_project_tpm_pizza/ui/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isChecked = false;
  //bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Registration Page'),
              backgroundColor: Colors.orange[700],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                FlutterLogo(
                  size: 100,
                ),
                _firstNameField(),
                _lastNameField(),
                _emailField(),
                _passwordField(),
                _loginButton(),
              ],
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage())
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text('Already Have Account? Login Now'),
              ),
            )
        )
    );
  }

  Widget _firstNameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: firstName,
        decoration: InputDecoration(
          labelText: 'First Name',
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
    );
  }

  Widget _lastNameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: lastName,
        decoration: InputDecoration(
          labelText: 'Last Name',
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
    );
  }

  Widget _emailField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: email,
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
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: pass,
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
    );
  }

  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
          onPressed: (){
            String text = "";
            print('Registration Clicked Event');
            registration();

            // if(email == email && password == password){
            //   setState(() {
            //     //isLoginSuccess = true;
            //     text = 'Login Success';
            //
            //   });
            // } else {
            //   setState(() {
            //     //isLoginSuccess = false;
            //     text = 'Login Failed, Username or Password Wrong';
            //   });
            // }
            //
            // SnackBar snackBar = SnackBar(
            //     content: Text(text)
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Register')
      ),
    );
  }

  Future registration() async {
    var uri = "http://localhost/semester_6_BE/registration.php";

    Map maped = {
      'firstName': firstName.text,
      'lastName': lastName.text,
      'email': email.text,
      'pass': pass.text
    };

    http.Response response = await http.post(Uri.parse(uri),
        body: maped
    );

    var data = jsonDecode(response.body);

    print('Data: ${data}');
    if(data['success']=='1'){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => LoginPage()
          )
      );
    }
  }
}