import 'package:e_commerce/models/app_state.dart';
import 'package:e_commerce/redux/actions.dart';
import 'package:e_commerce/redux/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './pages/register_page.dart';
import './pages/product_page.dart';
import './pages/login_page.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.cyan[400],
          accentColor: Colors.deepOrange[200],
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 18.0),
          ),
        ),
        home: RegisterPage(),
        routes: {
          "/login": (BuildContext context) => LoginPage(),
          "/register": (BuildContext context) => RegisterPage(),
          "/products": (BuildContext context) => ProductPage(onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getUserAction);
                StoreProvider.of<AppState>(context).dispatch(getProductsAction);
              }),
        },
      ),
    );
  }
}
