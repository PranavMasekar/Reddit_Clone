import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/asset_helper.dart';
import 'package:reddit_clone/modules/auth/controller/auth_controller.dart';
import 'package:reddit_clone/theme/pallet.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: ElevatedButton.icon(
        onPressed: () {
          ref.read(authControllerProvider.notifier).signInWithGoogle(context);
        },
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
