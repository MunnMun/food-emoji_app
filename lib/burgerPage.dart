import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {

  final imgPath, foodName, pricePerItem, heroTag;

  BurgerPage({required this.imgPath,required this.foodName,required this.pricePerItem,required this.heroTag});

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {

  var netPrice = 0.0;
  var quantity  = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu,color: Colors.black,),
                Stack(
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.7),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0,4.0),
                          ),
                        ]
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_cart,color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text('1',style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 7.0,
                            color: Colors.red,
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('SUPER',style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 27.0,
              fontFamily: 'Roboto',
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(widget.foodName.toString().toUpperCase(),style: TextStyle(
              fontSize: 27.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800,
            ),),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ),
              SizedBox(width: 15.0),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0,11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(Icons.favorite_border,
                          size: 25.0,
                            color: Color(0xFFFE7D6A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0,11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(Icons.restore,
                            size: 25.0,
                            color: Color(0xFFFE7D6A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text('\$'+ (int.parse(widget.pricePerItem)*quantity).toString(),
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5E6166),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 17.0,
                              onPressed: () {
                                adjustQuantity('MINUS');
                              },
                              icon: Icon(Icons.remove,
                              color: Color(0xFFFE7D6A)),
                          ),
                          Text(quantity.toString(),style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                              color: Color(0xFFFE7D6A),
                            fontWeight: FontWeight.w400,
                          ),),
                          IconButton(
                            iconSize: 17.0,
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                            icon: Icon(Icons.add,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('Add to cart',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('FEATURED',style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),),
          ),
          Container(
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('1'),
                _buildListItem('2'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(String columnNumber){
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
            if(columnNumber == '1')
              _buildColumnItem('assets/cheese.png', 'Sweet cheese', '11', Color(0xFFFBD6F5)),
            if(columnNumber == '1')
              SizedBox(height: 15.0),
            if(columnNumber == '1')
              _buildColumnItem('assets/popcorn.png', 'Sweet popcorn', '11', Color(0xFFFBD6F5)),
            if(columnNumber == '2')
              _buildColumnItem('assets/taco.png', 'Tacos', '6', Color(0xFFC2E3FE)),
            if(columnNumber == '2')
              SizedBox(height: 15.0),
            if(columnNumber == '2')
              _buildColumnItem('assets/sandwich.png', 'Sandwich', '6', Color(0xFFD7FADA)),
        ],
      ),
    );
  }

  _buildColumnItem(String imgPath,String foodName,String price,Color bgColor){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210.0,
          child: Row(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: bgColor,
                ),
                child: Center(
                  child: Image.asset(imgPath,height: 50.0,width: 50.0),
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodName,style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),),
                  Text('\$'+price,style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF68D7F),
                  ),),
                ],
              )
            ],
          ),
        )
      ],
    );
  }


  adjustQuantity(pressed){
    switch(pressed){
      case 'PLUS':
        setState(() {
          quantity+=1;
        });
        return;
      case 'MINUS':
        setState(() {
          if(quantity != 0){
            quantity-=1;
          }
        });
        return;
    }
  }
}
