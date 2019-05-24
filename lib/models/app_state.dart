import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final User user;
  final List<Product> products;

  AppState({@required this.user, @required this.products});

  factory AppState.initial() {
    return AppState(user: null, products: []);
  }
}
