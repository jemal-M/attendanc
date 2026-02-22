import 'package:flutter/material.dart';
import 'package:mobile/provider/studentProvider.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  var _students=[];
  Future<void> fetchStudents() async {
     _students=await StudentProvider.fetchStudents();
    // Implement your logic to fetch students here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('List of Students will be displayed here'),
            // You can replace the above Text widget with a ListView.builder
            // to display the list of students fetched from your backend.
            ListTile(
              title: Text('Student 1'),
              subtitle: Text('Student 1 Details'),

            ),
              ListTile(
                title: Text('Student 2'),
                subtitle: Text('Student 2 Details'),

              ),
              ListTile(
                title: Text('Student 3'),
                subtitle: Text('Student 3 Details'),

              ),
             
          ],
        ),
      ),
    );
  }
}