import 'package:flutter/material.dart';
import 'package:fluttermysql/pages/edituser.dart';
import 'package:fluttermysql/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lipsum/lipsum.dart' as lipsum;

class Showuser extends StatefulWidget {
  const Showuser({key}) : super(key: key);

  @override
  _ShowuserState createState() => _ShowuserState();
}

class _ShowuserState extends State<Showuser> {
  Future getUser() async {
    // var url = "https://pattyteacher.000webhostapp.com/select.php";
    var url = "http://localhost/addressbook/select.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1 / 1.58,
                      ),
                      itemCount: snapshot.data.length,
                      // itemCount: 1,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return buildUserCard(list[index], index, list);
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget buildUserCard(user, index, list) {

    return Container(
      // height: 450,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage('images/' + user['pic']),
                  // image: NetworkImage(
                  //   'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
                  // ),
                  // height: 150,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    user['fullname'],
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                user['username'],
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditUser(
                            list: list,
                            index: index,
                          ),
                        ));
                  },
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
