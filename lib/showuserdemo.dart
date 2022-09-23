import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Showuserdemo extends StatefulWidget {
  const Showuserdemo({key}) : super(key: key);

  @override
  _ShowuserState createState() => _ShowuserState();
}

class _ShowuserState extends State<Showuserdemo> {
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
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return buildUserCard(list[index]);
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

  Widget buildUserCard(user) {
    return Card(
      // clipBehavior: Clip.antiAlias,
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Image(
              //   image: AssetImage('images/' + user['picuser']),

              //   height: 150,
              //   // width: MediaQuery.of(context).size.width * 0.5,
              //   fit: BoxFit.cover,
              // ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  user['fullname'],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              user['username'],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('More'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
