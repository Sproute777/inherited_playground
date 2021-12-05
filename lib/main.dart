import 'package:flutter/material.dart';
import 'package:inherited_playground/inherited_widget.dart';
import 'package:inherited_playground/model.dart';
import 'package:inherited_playground/widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  MyModel model = MyModel();
  MyModel model444 = MyModel();
  MyModel model777= MyModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RailRoadProvider(
            model: model,
            model2: model444,
            model3: model777,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                MyText(),
                SizedBox(height: 24,),
                MyButton(),

              ],
            )
        ) //(val: _counter),
      ),
    );
  }
}
