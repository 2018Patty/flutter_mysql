import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermysql/pages/adduser.dart';
import 'package:fluttermysql/pages/edituser.dart';
import 'package:fluttermysql/pages/login.dart';
import 'package:fluttermysql/pages/profile.dart';
import 'package:http/http.dart' as http;

class Getuser extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Getuser> {
  Future getdata() async {
    // var url = "https://pattyteacher.000webhostapp.com/select.php";
    var url = "http://localhost/addressbook/select.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginForm(),
                  ),
                );
                debugPrint('register Clicked');
              }),
        ],
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: //Icon(Icons.edit),
                            CircleAvatar(
                          child: Text(list[index]['fullname'][0]),
                          // backgroundColor: Colors.pink[700],
                          // foregroundColor: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditUser(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                          debugPrint('Edit Clicked');
                        },
                      ),
                      title: TextButton(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                list[index]['fullname'],
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(
                                    user: list,
                                    index: index,
                                  ),
                                ));
                          }),
                      // Text(list[index]['fullname']),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(list[index]['username']),
                        ),
                      ),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            // var url =
                            //     'https://pattyteacher.000webhostapp.com/delete.php';
                            var url = "http://localhost/addressbook/delete.php";
                            http.post(url, body: {
                              'username': list[index]['username'],
                            });
                          });
                          debugPrint('delete Clicked');
                        },
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUser(),
            ),
          );
        },
      ),
    );
  }
}
