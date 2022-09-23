import 'package:flutter/material.dart';
import 'package:fluttermysql/main.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  final List list;
  final int index;

  const EditUser({Key key, this.list, this.index}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController user = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController fullname = new TextEditingController();

  bool editMode = false;

  Future editUser() async {
    if (editMode) {
      // var url = 'https://pattyteacher.000webhostapp.com/edit.php';
      var url = "http://localhost/addressbook/edit.php";
      http.post(url, body: {
        //'id' : widget.list[widget.index]['id'],
        'fullname': fullname.text,
        'username': user.text,
        'password': password.text,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      fullname.text = widget.list[widget.index]['fullname'];
      user.text = widget.list[widget.index]['username'];
      password.text = widget.list[widget.index]['password'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit User')),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: fullname,
                decoration: new InputDecoration(
                  hintText: "Fullname",
                  labelText: "Fullname",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              TextField(
                controller: user,
                enabled: false,
                decoration: new InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              TextField(
                controller: password,
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
                child: new Text("EDIT DATA"),
                onPressed: () {
                  setState(() {
                    editUser();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
