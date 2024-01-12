import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize your text controllers with existing data
    _emailController.text = 'john.doe@example.com';
    _phoneController.text = '+123 456 789';
    _locationController.text = 'City, Country';
    _dobController.text = 'January 1, 1990';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _isEditing ? _buildEditingDetails() : _buildProfileDetails(),
          ],
        ),
      ),
      floatingActionButton: _isEditing ? _buildFloatingActionButton(context) : null,
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with your image
          ),
          SizedBox(height: 16.0),
          Text(
            'John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Software Developer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem(Icons.email, _emailController.text),
          _buildDetailItem(Icons.phone, _phoneController.text),
          _buildDetailItem(Icons.location_on, _locationController.text),
          _buildDetailItem(Icons.calendar_today, 'DOB: ${_dobController.text}'),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24.0,
            color: Colors.blue,
          ),
          SizedBox(width: 16.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditingDetails() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditableDetailItem(Icons.email, 'Email', _emailController),
          _buildEditableDetailItem(Icons.phone, 'Phone', _phoneController),
          _buildEditableDetailItem(Icons.location_on, 'Location', _locationController),
          _buildEditableDetailItem(Icons.calendar_today, 'Date of Birth', _dobController),
        ],
      ),
    );
  }

  Widget _buildEditableDetailItem(IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24.0,
            color: Colors.blue,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // TODO: Add logic to save edited details
        setState(() {
          _isEditing = false;
        });
      },
      child: Icon(Icons.save),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ProfileScreen(),
    ),
  );
}
