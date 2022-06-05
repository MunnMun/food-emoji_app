import 'package:emoji/burgerPage.dart';
import 'package:flutter/material.dart';
import 'foodtabs.dart';
import 'burgerPage.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

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
                Icon(Icons.menu, color: Colors.black),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0)
                      ),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('SEARCH FOR', style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800,
              fontSize: 27.0,
              letterSpacing: 2.0,
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('RECIPES', style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800,
              fontSize: 27.0,
              letterSpacing: 2.0,
            ),),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Recommended', style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Hamburg', 'assets/burger.png', '21', Color(0xFFFFE9C6), Color(0xFFDA9551)),
                _buildListItem('Chips', 'assets/fries.png', '15', Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                _buildListItem('Donuts', 'assets/doughnut.png', '15', Color(0xFFD7FADA), Color(0xFF56CC7E)),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVOURITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(heroTag: foodName,foodName: foodName,pricePerItem: price,imgPath: imgPath)
          ));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: foodName,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Image.asset(imgPath,height: 50.0,width: 50.0),
                    ),
                  ),
              ),
              SizedBox(height: 25.0),
              Text(foodName,style: TextStyle(
                color: textColor,
                fontSize: 17.0,
                fontFamily: 'Roboto',
              ),),
              Text('\$'+price,style: TextStyle(
                color: textColor,
                fontSize: 17.0,
                fontFamily: 'Roboto',
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
