import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AsyncDemo extends StatefulWidget {
  const AsyncDemo({Key key}) : super(key: key);

  @override
  State<AsyncDemo> createState() => _AsyncDemoState();
}

class _AsyncDemoState extends State<AsyncDemo> {
  void getData() {
     Future.delayed(Duration(seconds: 3), () {
      print('get data');
    });
    print('statement');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // print('Hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Demo'),
      ),
    );
  }
}
