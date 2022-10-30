import 'package:flutter/material.dart';
import 'package:reddit_clone/asset_helper.dart';
import 'package:reddit_clone/theme/pallet.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          AssetHelper.googlePng,
          width: 35,
        ),
        label: Text(
          "Continue with Google",
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          primary: Pallete.greyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
