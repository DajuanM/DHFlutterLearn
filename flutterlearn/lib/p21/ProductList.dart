import 'package:flutter/material.dart';
import 'Product.dart';

class ProductList extends StatelessWidget {
  
  final List<Product> products = List.generate(20, (i)=>Product('商品$i', '这是商品${i}的详情'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: (){},
          );
        },
      ),
    );
  }
}