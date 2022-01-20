import 'package:flutter/material.dart';
import 'package:swish/Modals/product.dart';

class ItemCard extends StatelessWidget {
  final Function press;
  final Product product;
  ItemCard({Key key, this.press, this.product}) : super(key: key);
  List<String> images = [
    'assets/Fanta.jpg',
    'assets/Coke.jpg',
    'assets/pepsi.jpg',
    'assets/sprite.jpg',
  ];
  List<String> title = ['Fanta', 'Coke', 'Pepsi', 'Sprite'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: 160,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Hero(
                tag: '${product.id}',
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              product.title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Text(
            '200 rs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
