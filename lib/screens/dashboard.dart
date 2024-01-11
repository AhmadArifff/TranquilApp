import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'menu.dart';
import 'sidebar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardContent(), // Custom widget for the Dashboard
    MenuContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Sidebar(),
      body: Column(
        children: [
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

// Custom content for the dashboard
class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Welcome to the Dashboard!'),
        _buildCarousel(),
        _buildCardList(),
      ],
    );
  }

  Widget _buildCardList() {
    return Card(
      child: ListTile(
        title: Text('Card 1'),
        subtitle: Text('Description for Card 1'),
        leading: Icon(Icons.star),
        onTap: () {
          // Handle card tap
        },
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      items: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text('Carousel Item 1', style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text('Carousel Item 2', style: TextStyle(color: Colors.white)),
          ),
        ),
        // Add more carousel items as needed
      ],
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
