import 'package:e_commerce/models/app_state.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  const ProductItem({Key key, this.item}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final pictureUrl = '${item.picture['url']}';
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Color(0xBB000000),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            item.name,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        subtitle: Text(
          "\$ ${item.price}",
          style: TextStyle(fontSize: 16.0),
        ),
        trailing: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, state) {
            return state.user != null
                ? IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                : Text("");
          },
        ),
      ),
      child: Image.network(pictureUrl, fit: BoxFit.cover),
    );
  }
}
