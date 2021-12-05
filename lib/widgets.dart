import 'package:flutter/material.dart';
import 'package:inherited_playground/inherited_widget.dart';



class MyText extends StatefulWidget {
  const MyText({Key? key,
  }) : super(key: key);

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  int _value =  0;
  int  _value2 = 0;
  int _value3 = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = RailRoadProvider.of(context).model;
    final model2 = RailRoadProvider.of(context).model2;
    final model3 = RailRoadProvider.of(context).model3;
    model.addListener(() {
      _value = model.value;
      model2.inputValue(_value * 2);
      setState((){});    });

    model2.addListener(()  async {
     await Future.delayed(const Duration(seconds: 2));
      _value2 = model2.value;
      model3.inputValue(_value + _value2);
      setState((){});       });

    model3.addListener(() async { 
       await Future.delayed(const Duration(seconds: 2));
       _value3 = model3.value;
      setState((){});   
        });

  }

  @override
  Widget build(BuildContext context) {
    // final value = MyInheritedProvider.of(context).model.value;
    final value2 =  RailRoadProvider.of(context).model2.value;
    final value3 =  RailRoadProvider.of(context).model3.value;
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(12),
      child: Column(children:[ 

        Text('set state $_value', style: Theme.of(context).textTheme.headline1,),
        Text('build  $value2', style: Theme.of(context).textTheme.headline1,),
        Text('set state  $_value2', style: Theme.of(context).textTheme.headline1,),
        Text(' build $value3', style: Theme.of(context).textTheme.headline1,),
        Text(' setState $_value3', style: Theme.of(context).textTheme.headline1,)
        
        ]),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
  }) : super(key: key);

  void _incrementCounter(BuildContext context) {
    RailRoadProvider.of(context).model.increment();
    print(': TAP : ${RailRoadProvider.of(context).model.value}');
    // context.dependOnInheritedWidgetOfExactType<MyInheritedProvider>()?.model++;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _incrementCounter(context),
        child: Container(
          padding: const EdgeInsets.all(24),
          color: Colors.deepOrange,
          child: Text('Жми', style: Theme.of(context).textTheme.headline3,),
        ));
  }
}
