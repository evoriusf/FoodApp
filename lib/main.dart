import 'package:flutter/material.dart';
import 'auth.dart';
import 'auth_provider.dart';
import 'root_page.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'auth_provider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'bloc/cartlistBloc.dart';
import 'package:pizza/bloc/listTileColorBloc.dart';
import 'package:pizza/const/themeColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs:[
        Bloc((i)=>CartListBloc()),
        Bloc((i)=> ColorBloc()),
      ],
        child: AuthProvider(
        auth: Auth(),
        child: MaterialApp(
          title: 'Login',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: RootPage(),
        ),
      ),
    );
  }
}
