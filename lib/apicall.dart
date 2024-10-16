import 'package:flutter/material.dart';



class DynamicTextFields extends StatefulWidget {
  @override
  _DynamicTextFieldsState createState() => _DynamicTextFieldsState();
}

class _DynamicTextFieldsState extends State<DynamicTextFields> {
  // List of TextEditingControllers to manage each TextField
  List<TextEditingController> _controllers = List.generate(10, (index) => TextEditingController());

  @override
  void dispose() {
    // Dispose all TextEditingControllers when the widget is destroyed
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Function to add a new TextField
  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController()); // Add a new controller
    });
  }

  // Function to remove a TextField
  void _removeTextField(int index) {
    setState(() {
      _controllers[index].dispose(); // Dispose the specific controller
      _controllers.removeAt(index);  // Remove the controller at the given index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic TextFields with Delete Option'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _controllers.length, // Number of TextFields
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Expanded TextField
                      Expanded(
                        child: TextField(
                          controller: _controllers[index], // Assign the controller
                          decoration: InputDecoration(
                            labelText: 'TextField ${index + 1}',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Only delete if more than one TextField remains
                          if (_controllers.length > 1) {
                            _removeTextField(index); // Remove the specific TextField at the clicked index
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Button to add a new TextField
          ElevatedButton(
            onPressed: _addTextField,
            child: Text('Add TextField'),
          ),
        ],
      ),
    );
  }
}
