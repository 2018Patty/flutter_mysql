import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermysql/main.dart';
import 'package:fluttermysql/pages/edituser_profile.dart';
import 'package:fluttermysql/pages/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController user = new TextEditingController();
  TextEditingController password = new TextEditingController();
  // TextEditingController fullname = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future login() async {
    // var url = "https://pattyteacher.000webhostapp.com/checklogin.php";
    var url = "http://localhost/addressbook/checklogin.php";
    var userdata = {};
    userdata['username'] = user.text;
    userdata['password'] = password.text;

    var response = await http.post(
      url,
      body: userdata,
    );

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body);

      if (dataJson == "Completed") {
        print('Login Sucess');
        debugPrint('Login Sucess');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Welcome(
              data: userdata,
            ),
            //  builder: (context) => EditProfile(),
          ),
        );
        // Navigator.pushNamed(context, '/welcome', arguments: {
        //   'username': user.text,
        //   'password': password.text,
        // });
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Welcome()));

        // Fluttertoast.showToast(
        //     msg: "Login Completed",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Check Username and Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: user,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: new Text("Login"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      login();
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome(),),);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
