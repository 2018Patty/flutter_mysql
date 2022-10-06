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
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return buildCardCat(context, para);
          }),
    );
  }

// double width = MediaQuery.of(context).size.width;
// double height = MediaQuery.of(context).size.height;

  Widget buildCardCat(BuildContext context, String para) {
    return Container(
      height: 400,
      // width: 300,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image(
                  // image: AssetImage('images/' + user['picuser']),
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
                  ),
                  //height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                  // fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      'วิเชียรมาศ',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(para,
                  // 'วิเชียรมาศ บางตำราเรียก แมวแก้ว เป็นแมวไทยโบราณ ตำราว่า ตัวเป็นสีดำดังหมึกวาด และเป็นแมวมงคล',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
