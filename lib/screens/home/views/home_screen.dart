import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(children: [
          Image.asset(
            'assets/8.png',
            scale: 14,
          ),
          const SizedBox(width: 10),
          Text(
            'Pizza',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          )
          ,
        ],),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(CupertinoIcons.cart)
          ),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
              
            },
            icon: Icon(CupertinoIcons.arrow_right_to_line),
          )
        ],
      ),
    );
  }
}