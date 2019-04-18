import 'package:flutter/material.dart';
import 'package:law_app/state_widget.dart';
import 'package:law_app/ui/widgets/google_sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // New private method which includes the background image:
    BoxDecoration _buildBackground() {
      return BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/CARE.jpeg"),
          fit: BoxFit.fitWidth,
        ),
      );
    }

    //Text _buildText() {
    //  return Text(
    //    'HEAR 4 YOU',
    //    style: Theme.of(context).textTheme.headline,
    //    textAlign: TextAlign.center,
    //  );
    //}

    return Scaffold(
      // We do not use backgroundColor property anymore.
      // New Container widget wraps our Center widget:
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             // _buildText(),
              SizedBox(height: 500.0),
              GoogleSignInButton(
                onPressed: () =>
                   // We replace the current page.
                   // After navigating to the replacement, it's not possible
                   // to go back to the previous screen:
                   StateWidget.of(context).signInWithGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}