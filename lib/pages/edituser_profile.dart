import 'package:flutter/material.dart';
import 'package:fluttermysql/main.dart';
import 'package:fluttermysql/pages/edituser.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class EditProfile extends StatefulWidget {
  final String username;

  const EditProfile({Key key, this.username}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController user = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController fullname = new TextEditingController();

  bool editMode = false;

  Future getdata() async {
    // var url = "https://pattyteacher.000webhostapp.com/select.php";
    var url = "http://localhost/addressbook/select_user.php";
    var data = {'username': user.text};
    var response = await http.post(url, body: json.encode(data));
    // var response = await http.get(url);

    return json.decode(response.body);
  }

 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Edit User')),
        body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            List list = snapshot.data;
            print(snapshot);
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? EditUser(
                    list: list,
                    index: 0,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
