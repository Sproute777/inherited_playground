import 'package:flutter/material.dart';
import 'package:inherited_playground/model.dart';

class RailRoadProvider extends InheritedWidget {
  final MyModel model;
  final MyModel model2;
  final MyModel model3;

  const RailRoadProvider({
    Key? key,
    required Widget child,
    required this.model,
    required this.model2,
    required this.model3,
  }) : super(key: key, child: child);

  static RailRoadProvider of(BuildContext context) {
    final RailRoadProvider? result =
        context.dependOnInheritedWidgetOfExactType<RailRoadProvider>();
    assert(result != null, 'No MyInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RailRoadProvider old) {
    return model.value != old.model.value || model2.value != old.model2.value || model3.value != old.model3.value;
  }
}

