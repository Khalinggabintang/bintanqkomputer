import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedbackFormPage extends StatefulWidget {
  @override
  _FeedbackFormPageState createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kritik dan Saran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _feedbackController,
                decoration: InputDecoration(labelText: 'Keluhan/Saran'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Keluhan/Saran harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    submitFeedback();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitFeedback() async {
    final response = await http.post(
      Uri.parse('http://mobilecomputing.my.id/api_khalingga/add_feedback.php'),
      body: {
        'name': _nameController.text,
        'feedback': _feedbackController.text,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Feedback berhasil dikirim')));
      _nameController.clear();
      _feedbackController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('sedang tidak menerima kritik')));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }
}
