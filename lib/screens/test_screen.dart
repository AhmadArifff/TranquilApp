import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  int _currentCarouselIndex = 0;
  late int _totalQuestions; // Ubah tipe data menjadi late

  List<String> _answers = [];

  @override
  void initState() {
    super.initState();
    _totalQuestions = 2; // Inisialisasi _totalQuestions di initState
    _answers = List.generate(_totalQuestions, (index) => '');
  }

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
    return Column(
      children: [
        CarouselSlider(
          items: [
            for (int i = 0; i < _totalQuestions; i++)
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pertanyaan ${i + 1}', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Text('Jawaban: ${_answers[i]}', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _toggleAnswerField(i);
                      },
                      child: Text('Toggle Answer Field'),
                    ),
                  ],
                ),
              ),
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
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            _nextCarouselItem();
          },
          icon: Icon(Icons.arrow_forward),
          label: Text('Next'),
        ),
      ],
    );
  }

  void _nextCarouselItem() {
    final int itemCount = _totalQuestions; // Update this to match the total number of carousel items
    int nextIndex = (_currentCarouselIndex + 1) % itemCount;
    setState(() {
      _currentCarouselIndex = nextIndex;
    });
  }

  void _toggleAnswerField(int index) {
    // Implement the logic to toggle the answer field and save/edit
    // You can use a TextEditingController for each answer field
    // to enable/disable and edit the text.
    // Example:
    // _answers[index] = 'Updated Answer';
    // _textControllers[index].text = 'Updated Answer';
  }
}

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Content'),
    );
  }
}
