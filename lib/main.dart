import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermysql/pages/adduser.dart';
import 'package:fluttermysql/pages/edituser.dart';
import 'package:fluttermysql/pages/login.dart';
import 'package:fluttermysql/pages/profile.dart';
import 'package:fluttermysql/pages/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'package:splashscreen/splashscreen.dart';

import 'cardnews.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AddressBook App",
      theme: ThemeData(
        // primaryColor: Color(0xFFd81b60),
        primarySwatch: Colors.pink,
        fontFamily: 'Kanit',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 20,
              fontWeight: FontWeight.w400),
          headline3: TextStyle(
              fontSize: 15,
              fontFamily: 'BaiJamjuree',
              fontWeight: FontWeight.bold),
          caption: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
          ),
          bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   secondary: Color(0xFFd81b60),
        // ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => LoginForm(),
        '/CardNews': (context) => CardNews(),
      },
    ));


class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  Future getdata() async {
    // var url = "https://pattyteacher.000webhostapp.com/select.php";
    var url = "http://localhost/addressbook/select.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Splashscreen())));
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
