import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

//import 'package:flutter_database/theme.dart';

class Welcome extends StatefulWidget {
  final Map data;

  const Welcome({Key key, this.data}) : super(key: key);
   @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  final para = lipsum.createParagraph();



  Map data = {};
    
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
            appBar: AppBar(
              title: Text('Welcome ' + widget.data['username']),
            
              // centerTitle: true,
              elevation: 0,

            ),
            body: Column(
              children: [
                SizedBox(height: 10,),
                Text(widget.data['username'],style: Theme.of(context).textTheme.headline1,),
              
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    para,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            
      ),

      );
  }
}
