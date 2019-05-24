import 'package:e_commerce/models/app_state.dart';
import 'package:e_commerce/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

final gradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    stops: [0.1, 0.3, 0.5, 0.6, 0.7],
    colors: [
      Colors.deepOrange[300],
      Colors.deepOrange[400],
      Colors.deepOrange[500],
      Colors.deepOrange[600],
      Colors.deepOrange[700],
    ],
  ),
);

// I9GxdInnv9srjx3m
class ProductPage extends StatefulWidget {
  final void Function() onInit;

  ProductPage({Key key, this.onInit}) : super(key: key);

  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  final _appBar = PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return AppBar(
          centerTitle: true,
          title: SizedBox(
              child: state.user != null ? Text(state.user.username) : Text("")),
          leading: Icon(Icons.store),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: state.user != null
                  ? IconButton(
                      icon: Icon(Icons.exit_to_app),
                      onPressed: () {},
                    )
                  : Text(""),
            )
          ],
        );
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: _appBar,
      body: Container(
        decoration: gradientBackground,
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, state) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    child: GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                orientation == Orientation.portrait ? 2 : 3,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            childAspectRatio:
                                orientation == Orientation.portrait
                                    ? 1.0
                                    : 1.3),
                        itemBuilder: (context, i) =>
                            ProductItem(item: state.products[i])),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
