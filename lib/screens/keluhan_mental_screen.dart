import 'package:flutter/material.dart';
import 'package:TranquilApp/screens/sidebar.dart';

class KeluhanMentalScreen extends StatefulWidget {
  @override
  _KeluhanMentalScreenState createState() => _KeluhanMentalScreenState();
}

class _KeluhanMentalScreenState extends State<KeluhanMentalScreen> {
  TextEditingController keluhanController = TextEditingController();
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Apakah kamu sering merasa cemas?',
      'type': 'options',
      'options': ['Yes', 'No'],
    },
    {
      'question': 'Apakah kamu pernah merasa sedih tanpa alasan yang jelas?',
      'type': 'options',
      'options': ['Yes', 'No'],
    },
    {
      'question': 'Apakah kamu memiliki keluhan lainnya?',
      'type': 'checkbox',
      'options': ['Mood swings', 'Insomnia', 'Kesulitan berkonsentrasi'],
    },
  ];
  Map<String, dynamic> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Form'),
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            if (questions[currentQuestionIndex]['type'] == 'options')
              Wrap(
                spacing: 16.0,
                children: (questions[currentQuestionIndex]['options'] as List<String>).map((option) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedOptions[questions[currentQuestionIndex]['question']] = option;
                        _nextQuestion();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedOptions[questions[currentQuestionIndex]['question']] == option
                          ? Colors.green
                          : Colors.grey,
                    ),
                    child: Text(option),
                  );
                }).toList(),
              ),
            if (questions[currentQuestionIndex]['type'] == 'checkbox')
              Column(
                children: (questions[currentQuestionIndex]['options'] as List<String>).map((option) {
                  return CheckboxListTile(
                    title: Text(option),
                    value: selectedOptions[option] == true,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedOptions[option] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            SizedBox(height: 16.0),
            if (currentQuestionIndex == questions.length - 1)
              ElevatedButton(
                onPressed: _submitForm,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Submit'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _submitForm() {
    // Perform any action needed when the form is submitted.
    // For example, print the selected options.
    print(selectedOptions);

    // Show the result page with the selected options.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(selectedOptions: selectedOptions),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> selectedOptions;

  ResultScreen({required this.selectedOptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            for (var entry in selectedOptions.entries)
              Text(
                '${entry.key}: ${entry.value}',
                style: TextStyle(fontSize: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}
