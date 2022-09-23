import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class CardNews extends StatelessWidget {
  const CardNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final para = lipsum.createParagraph();
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: buildCardCat(context, para),
    );
  }

  Widget buildCardCat(BuildContext context, String para) {
    return Container(
      height: 370,
      width: 250,
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
                  // image: AssetImage('images/' + user['picuser']),
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
                  ),
                  // height: 150,
                  // width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'วิเชียรมาศ',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'วิเชียรมาศ บางตำราเรียก แมวแก้ว เป็นแมวไทยโบราณ ตำราว่า ตัวเป็นสีดำดังหมึกวาด และเป็นแมวมงคล',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('More'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
