import 'package:flutter/material.dart';
import 'package:fluttermysql/pages/login.dart';

class SideDrawerMenu extends StatelessWidget {
  const SideDrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 150,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patty Teacher',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, fontFamily: 'Anton'),
                ),
               
                Text('Prince of Songkla University',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
              ],
            ),
            // decoration: BoxDecoration(
            //   color: Colors.pink[700],
            //   image: DecorationImage(
            //       fit: BoxFit.cover, image: AssetImage('images/scit1.jpg')),
            // ),
          ),
        ),
        //Divider(height: 5, color: Colors.grey[500], thickness: 5,),
        ListTile(
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          leading: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm(),),);
            //Navigator.of(context).pop();
          },
        ),
        
        ListTile(
          title: Text('Contact', style: Theme.of(context).textTheme.bodyText2),
          leading: Icon(
            Icons.place,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/contact',
            );
          },
        ),
      ],
    ));
  }
}

class HeaderMenu {}
