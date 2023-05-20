import 'package:final_project_tpm_pizza/base/api_data_source.dart';
import 'package:final_project_tpm_pizza/model/regist_model.dart';
import 'package:final_project_tpm_pizza/ui/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../base/api_connection.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var formKey = GlobalKey<FormState>();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  bool isChecked = false;
  //bool isLoginSuccess = true;

  validateUserEmail() async {
    try {
      // sending response
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email': email.text.trim(),
        },
      );

      String text = "";

      if(res.statusCode == 200){ // from flutter app the connection with api to server - success
        var resBody = jsonDecode(res.body);

        if(resBody['emailFound'] == true){
          text = 'Email is already in someone else use. Try another email.';
        }else{
          //'Register Success';
          registerAndSaveUserRecord();
        }
        SnackBar snackBar = SnackBar(
            content: Text(text)
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    catch (e){

    }
  }

  registerAndSaveUserRecord() async {
    RegistModel registModel = RegistModel(
      firstName.text.trim(),
      lastName.text.trim(),
      email.text.trim(),
      pass.text.trim(),
    );

    try{
      var res = await http.post(
        Uri.parse(API.signUp),
        body: registModel.toJson(),
      );

      String text = "";

      if(res.statusCode == 200){ // from flutter app the connection with api to server - success
        var resBody = jsonDecode(res.body);

        if(resBody['success'] == true){
          text = 'Congratulation, you are sign up successfully';

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage())
          );

          setState(() {
            firstName.clear();
            lastName.clear();
            email.clear();
            pass.clear();
          });


        }else{
          text = 'Error Occurred, Try Again';
        }
        SnackBar snackBar = SnackBar(
            content: Text(text)
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      //print(e.toString());
    }
  }

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
            bottomNavigationBar: InkWell(
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
            if(formKey.currentState!.validate()){
              // validate the email
              validateUserEmail();
            }
          },
          child: Text('Register')
      ),
    );
  }
}