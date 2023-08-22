import 'package:flutter/widgets.dart';
import 'package:test1/someWidget.dart';

final Map<String, WidgetBuilder> routes = {
  SomeWidget.routeName: (context) => const SomeWidget(),
};