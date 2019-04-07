import 'package:flutter/material.dart';
import 'package:law_app/model/state.dart';
import 'package:law_app/state_widget.dart';
import 'package:law_app/utils/store.dart';
import 'package:intl/intl.dart';

class CommentSendBox extends StatefulWidget  {
   @override
  _CommentSendBoxState createState() => _CommentSendBoxState();
}

class _CommentSendBoxState extends State<CommentSendBox>{

  final myController = TextEditingController();
  StateModel appState;
@override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

RawMaterialButton _buildsendButton() {
 DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => insertComment(myController.text,appState.user.displayName, formattedDate),
        child: Icon(
          Icons.send
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        shape: CircleBorder(),
      );
    }
Container _buildCommentBox () {
  return Container(
    width:MediaQuery.of(context).size.width * 0.85,
    child:new TextField(
                      controller: myController,
                      decoration: new InputDecoration(
                        labelText: "Enter Comment",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color:Colors.black
                          ),
                        ),
                        // fillColor: Colors.black
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    )
  );
}
@override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return Row(
              children: <Widget>[
                _buildCommentBox(),
                _buildsendButton()
              ]
              );
  }
}