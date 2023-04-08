import 'package:flutter/material.dart';
import 'editProfile.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),backgroundColor: Color(0xffd6b738),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = true;
              });
            },
          ),
        ],
      ),
      body: isEditing ? editProfile() : _buildProfileView(),
    );
  }

  Widget _buildProfileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://example.com/profile.png'),
        ),

        SizedBox(height: 10),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 20),
        ),

        SizedBox(height: 5),
        Text(
          'Software Developer',
          style: TextStyle(fontSize: 16),
        ),

        SizedBox(height: 10),
        // Add other widgets as needed
      ],
    );
  }


}
