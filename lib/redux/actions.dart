import 'dart:convert';

import 'package:e_commerce/models/app_state.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

ThunkAction<AppState> getUserAction = (Store<AppState> store) async {
  final prefs = await SharedPreferences.getInstance();
  final String storedUser = prefs.getString("user");
  final user =
      storedUser != null ? User.fromJson(json.decode(storedUser)) : null;
  store.dispatch(GetUserAction(user));
};

class GetUserAction {
  final User _user;
  User get user => this._user;
  GetUserAction(this._user);
}

// get products list

ThunkAction<AppState> getProductsAction = (Store<AppState> store) async {
  List<Product> products = [];

  http.Response response =
      await http.get("https://pacific-reef-60955.herokuapp.com/products");
  final List<dynamic> responseData = json.decode(response.body);

  responseData.forEach((productData) {
    final Product product = Product.fromJson(productData);
    products.add(product);
  });
  store.dispatch(GetProductsAction(products));
};

class GetProductsAction {
  final List<Product> _products;
  List<Product> get products => _products;
  GetProductsAction(this._products);
}
