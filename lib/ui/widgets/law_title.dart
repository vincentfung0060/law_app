import 'package:flutter/material.dart';
import 'package:law_app/model/law.dart';

class LawTitle extends StatelessWidget {
  final Law law;
  final double padding;

  LawTitle(this.law, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            law.name,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }
}