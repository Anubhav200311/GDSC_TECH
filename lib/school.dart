import 'package:flutter/material.dart';

class MySchool extends StatefulWidget {
  const MySchool({Key? key}) : super(key: key);

  @override
  State<MySchool> createState() => _MySchoolState();
}

class _MySchoolState extends State<MySchool> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController standard = TextEditingController();
  String selectedGender = '';
  String age_ = "";
  String name_ = "";
  String standard_ = "";
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 40,
                ),
              ),
              const Center(
                child: Text(
                  'Hello, welcome to school!!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 30, top: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: age,
                  maxLength: 2,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Age",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: standard,
                  maxLength: 2,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Standard",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Other'),
                      value: 'Other',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Selected Gender: $selectedGender',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (name.text.isEmpty ||
                      age.text.isEmpty ||
                      standard.text.isEmpty ||
                      selectedGender.isEmpty) {
                    setState(() {
                      errorMessage = 'Please enter all parameters!';
                      name_ = '';
                      age_ = '';
                      standard_ = '';
                    });
                  } else {
                    setState(() {
                      errorMessage = '';
                      name_ = 'Name: ${name.text}';
                      age_ = 'Age: ${age.text}';
                      standard_ = 'Standard: ${standard.text}';
                    });
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const Text(
                'BioData',
                style: TextStyle(fontSize: 30),
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(
                height: 10,
              ),
              Text(name_),
              Text(age_),
              Text(standard_),
            ],
          ),
        ),
      ),
    );
  }
}
