import 'package:flutter/material.dart';
import 'Product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key, this.product}): super(key: key);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('商品详情'),
        ),
        body: Container(
          child: Text('${this.product.description}'),
        ),
      );
    }
}