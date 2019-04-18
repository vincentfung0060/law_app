import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:law_app/model/comment.dart';
import 'package:law_app/ui/screens/home.dart' as home; 

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard(
      {@required this.comment,
      });

  @override
  Widget build(BuildContext context) {

    Padding _buildTitleSection() {
      String _text;
            if (home.isAnonymous == true) {
        _text = "****";
      } 
      else { _text = comment.user;}

      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          // Default value for crossAxisAlignment is CrossAxisAlignment.center.
          // We want to align title and description of recipes left:
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "From:   " + _text,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      );
    }

Padding _buildDateSection() {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          // Default value for crossAxisAlignment is CrossAxisAlignment.center.
          // We want to align title and description of recipes left:
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Date:   " + comment.date,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      );
    }
Padding _buildContentSection() {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          // Default value for crossAxisAlignment is CrossAxisAlignment.center.
          // We want to align title and description of recipes left:
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              comment.content,
            ),
          ],
        ),
      );
    }

    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              _buildTitleSection(),
              _buildDateSection(),
              _buildContentSection(),
            ],
          ),
        ));
  }
}