import 'package:flutter/material.dart';
import 'package:law_app/app.dart';
import 'package:law_app/state_widget.dart';

// - StateWidget incl. state data
//    - RecipesApp
//        - All other widgets which are able to access the data
void main() => runApp(new StateWidget(
      child: new LawApp(),
    ));