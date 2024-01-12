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

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  int _currentCarouselIndex = 0;
  late List<String> _answers;
  late List<TextEditingController> _textControllers;
  final int _totalQuestions = 2;

  @override
  void initState() {
    super.initState();
    _answers = List.generate(_totalQuestions, (index) => '');
    _textControllers = List.generate(_totalQuestions, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to the Dashboard!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildCarousel(),
        SizedBox(height: 20),
        _buildCardList(),
      ],
    );
  }

  Widget _buildCardList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Jawaban: ${_answers[_currentCarouselIndex]}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _previousCarouselItem();
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Previous'),
            ),
            Text('Pertanyaan ${_currentCarouselIndex + 1} dari $_totalQuestions'),
            ElevatedButton.icon(
              onPressed: () {
                _nextCarouselItem();
              },
              icon: Icon(Icons.arrow_forward),
              label: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }

  void _toggleAnswerField(int index) {
    // Implement the logic to toggle the answer field and save/edit
    // You can use a TextEditingController for each answer field
    // to enable/disable and edit the text.
    // Example:
    // _answers[index] = 'Updated Answer';
    // _textControllers[index].text = 'Updated Answer';
  }

  bool _isAnswerSaved(int index) {
    return _answers[index].isNotEmpty;
  }

  void _nextCarouselItem() {
    int nextIndex = (_currentCarouselIndex + 1) % _totalQuestions;
    setState(() {
      _currentCarouselIndex = nextIndex;
    });
    _textControllers[_currentCarouselIndex].text = _answers[_currentCarouselIndex];
  }

  void _previousCarouselItem() {
    int previousIndex = (_currentCarouselIndex - 1 + _totalQuestions) % _totalQuestions;
    setState(() {
      _currentCarouselIndex = previousIndex;
    });
    _textControllers[_currentCarouselIndex].text = _answers[_currentCarouselIndex];
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
