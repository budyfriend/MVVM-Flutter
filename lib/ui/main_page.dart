import 'dart:math';

import 'package:demo_mvvm/bloc/user_bloc.dart';
import 'package:demo_mvvm/model/user.dart';
import 'package:demo_mvvm/ui/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo MVVM'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blueGrey,
            onPressed: () {
              bloc.dispatch(random.nextInt(10) + 1);
            },
            child: Text('Pick Random User'),
          ),
          BlocBuilder<UserBloc, User>(
              builder: (context, user) =>
                  (user is UninitializedUser) ? Container() : UserCard(user))
        ],
      ),
    );
  }
}
