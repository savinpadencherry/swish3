import 'package:flutter/material.dart';
import 'package:swish/Modals/product.dart';

class Details extends StatelessWidget {
  final Product product;
  const Details({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        centerTitle: true,
        title: Text(
          product.title,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BodyPart(
        product: product,
      ), // its not product[index] because you are only sending data of the single product you are viewing
    );
  }
}

class BodyPart extends StatelessWidget {
  final Product product;
  const BodyPart({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: size.height * 0.3,
          ),
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 105,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Price \n",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    TextSpan(
                      text: "${product.price}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(product.description),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NumOfItems(),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        height: 32.0,
                        width: 32.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.thumb_up_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: product.color),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: product.color,
                          child: Text(
                            'BUY NOW',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -130,
          right: 0,
          left: 10,
          child: Container(
            height: 300,
            margin: EdgeInsets.only(top: size.height * 0.2),
            child: Hero(
              tag: "${product.id}",
              child: Image.asset(product.image),
            ),
          ),
        ),
      ],
    );
  }
}

class NumOfItems extends StatefulWidget {
  const NumOfItems({Key key}) : super(key: key);

  @override
  _NumOfItemsState createState() => _NumOfItemsState();
}

class _NumOfItemsState extends State<NumOfItems> {
  int numOfItems = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSizedBoxButton(
          icon: Icons.add,
          press: () {
            setState(() {
              numOfItems++;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: TextStyle(fontSize: 20),
          ),
        ),
        buildSizedBoxButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        )
      ],
    );
  }

  SizedBox buildSizedBoxButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
