import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mega_store/screens/IntroScreen.dart';
import 'package:mega_store/widgets/HomeComponents/HomeScreen.dart';
import 'package:provider/provider.dart';

import 'models/user.model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    print(user);
    return (user == null) ? IntroScreen() : HomeScreen();
  }
}
