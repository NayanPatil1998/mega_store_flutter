import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mega_store/services/AuthService.dart';
import 'package:mega_store/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
          StreamProvider(
            initialData: null,
            create: (context) => context.read<AuthService>().user,
          )
        ],
        child: MaterialApp(
          title: 'Mega Store',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: Wrapper(),
        ));
  }
}
