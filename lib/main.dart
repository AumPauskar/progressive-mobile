import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _employeeNameController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _generatorInformationController = TextEditingController();
  final _priceController = TextEditingController();
  final _remarksController = TextEditingController();
  String _generatorModelController = '';
  String _generatorPhaseController = '';
  String _generatorBreakerController = '';
  String _state = '';
  XFile? _image1;
  XFile? _image2;

  // checkbox values
  bool _is5kVAChecked = false;
  bool _is7_5kVAChecked = false;
  bool _is10kVAChecked = false;
  bool _is12_5kVAChecked = false;
  bool _is15kVAChecked = false;
  bool _is20kVAChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generate PDF'),
        ),
        body: Center(
          child: SingleChildScrollView(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Employee Name TextField
                TextFormField(
                  controller: _employeeNameController,
                  decoration: const InputDecoration(
                    labelText: 'Employee Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the employee name';
                    }
                    return null;
                  },
                ),
                // Customer Name TextField
                TextFormField(
                  controller: _customerNameController,
                  decoration: const InputDecoration(
                    labelText: 'Customer Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the customer name';
                    }
                    return null;
                  },
                ),
                // Address TextField
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Enter address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the address';
                    }
                    return null;
                  },
                ),

                // City TextField
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Enter city',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the city name';
                    }
                    return null;
                  },
                ),

                // state TextField
                const Text('Select State'),
                RadioListTile<String>(
                  title: const Text('Karnataka'),
                  value: 'Karnataka',
                  groupValue: _state,
                  onChanged: (value) {
                    setState(() {
                      _state = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Maharashtra'),
                  value: 'Maharashtra',
                  groupValue: _state,
                  onChanged: (value) {
                    setState(() {
                      _state = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Goa'),
                  value: 'Goa',
                  groupValue: _state,
                  onChanged: (value) {
                    setState(() {
                      _state = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Other'),
                  value: 'Other',
                  groupValue: _state,
                  onChanged: (value) {
                    setState(() {
                      _state = value!;
                    });
                  },
                ),

                // Contact person TextField
                TextFormField(
                  controller: _contactPersonController,
                  decoration: const InputDecoration(
                    labelText: 'Enter contact',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the contact';
                    }
                    return null;
                  },
                ),

                // phone number TextField
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Enter phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number';
                    }
                    return null;
                  },
                ),

                // email TextField
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email';
                    }
                    return null;
                  },
                ),

                // form part 1 over
                // form part 2 starts here
                // generator info
                TextFormField(
                  controller: _generatorInformationController,
                  decoration: const InputDecoration(
                    labelText: 'Enter generator information',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the generator information';
                    }
                    return null;
                  },
                ),

                // generator type Radio Buttons
                const Text('Generator type'),
                RadioListTile<String>(
                  title: const Text('Portable (Upto 5 kVA)'),
                  value: 'Portable (Upto 5 kVA)',
                  groupValue: _generatorModelController,
                  onChanged: (value) {
                    setState(() {
                      _generatorModelController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('LHP 7.5 kVA to 320 kVA'),
                  value: 'LHP 7.5 kVA to 320 kVA',
                  groupValue: _generatorModelController,
                  onChanged: (value) {
                    setState(() {
                      _generatorModelController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('HHP 380 kVA to 2000 kVA'),
                  value: 'HHP 380 kVA to 2000 kVA',
                  groupValue: _generatorModelController,
                  onChanged: (value) {
                    setState(() {
                      _generatorModelController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('HHP - 380 kVA & Above'),
                  value: 'HHP - 380 kVA & Above',
                  groupValue: _generatorModelController,
                  onChanged: (value) {
                    setState(() {
                      _generatorModelController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Open OG ( 5 kVA to 15 kVA)'),
                  value: 'Open OG ( 5 kVA to 15 kVA)',
                  groupValue: _generatorModelController,
                  onChanged: (value) {
                    setState(() {
                      _generatorModelController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Other'),
                  value: 'Other',
                  groupValue: _generatorModelController,
                  onChanged: (value) {
                    setState(() {
                      _generatorModelController = value!;
                    });
                  },
                ),

                // KVA checkboxes
                const Text('KVA rating'),
                CheckboxListTile(
                  title: const Text('5 kVA'),
                  value: _is5kVAChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _is5kVAChecked = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('7.5 kVA'),
                  value: _is7_5kVAChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _is7_5kVAChecked = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('10 kVA'),
                  value: _is10kVAChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _is10kVAChecked = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('12.5 kVA'),
                  value: _is12_5kVAChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _is12_5kVAChecked = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('15 kVA'),
                  value: _is15kVAChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _is15kVAChecked = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('20 kVA'),
                  value: _is20kVAChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _is20kVAChecked = value ?? false;
                    });
                  },
                ),

                // Generator Name Radio Buttons
                const Text('Phase'),
                RadioListTile<String>(
                  title: const Text('1 phase'),
                  value: '1 phase',
                  groupValue: _generatorPhaseController,
                  onChanged: (value) {
                    setState(() {
                      _generatorPhaseController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('3 phase'),
                  value: '3 phase',
                  groupValue: _generatorPhaseController,
                  onChanged: (value) {
                    setState(() {
                      _generatorPhaseController = value!;
                    });
                  },
                ),

                // Generator Name Radio Buttons
                const Text('Breaker?'),
                RadioListTile<String>(
                  title: const Text('Yes'),
                  value: 'Yes',
                  groupValue: _generatorBreakerController,
                  onChanged: (value) {
                    setState(() {
                      _generatorBreakerController = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('No'),
                  value: 'No',
                  groupValue: _generatorBreakerController,
                  onChanged: (value) {
                    setState(() {
                      _generatorBreakerController = value!;
                    });
                  },
                ),

                // price TextField
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Enter price',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                ),

                // remarks TextField
                TextFormField(
                  controller: _remarksController,
                  decoration: const InputDecoration(
                    labelText: 'Enter remarks',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter remarks';
                    }
                    return null;
                  },
                ),

                // ... other form fields ...
                // Image and PDF generation buttons
                // ... other form fields ...
                ElevatedButton(
                  onPressed: () async {
                    _image1 = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: const Text('Pick Image 1'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _image2 = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: const Text('Pick Image 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    try {
                      generatePdf(context);
                    } catch (e) {
                      print('Error generating PDF: $e');
                    }
                  },
                  child: const Text('Generate PDF'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> generatePdf(BuildContext context) async {
    final pdf = pw.Document();

    final imageProvider1 = pw.MemoryImage(
      await _image1!.readAsBytes(),
    );

    final imageProvider2 = pw.MemoryImage(
      await _image2!.readAsBytes(),
    );

    // Fetch the data from the form
    // text controller
    String employeeName = _employeeNameController.text;
    String customerName = _customerNameController.text;
    String address = _addressController.text;
    String city = _cityController.text;
    String contactPerson = _contactPersonController.text;
    String phoneNumber = _phoneNumberController.text;
    String email = _emailController.text;
    String generatorInformation = _generatorInformationController.text;
    String price = _priceController.text;
    String remarks = _remarksController.text;

    // checkbox values
    String generatorModel = _generatorModelController;
    String generatorPhase = _generatorPhaseController;
    String generatorBreaker = _generatorBreakerController;
    String state = _state;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Left Section
            pw.Container(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Employee Name: $employeeName',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Customer Name: $customerName',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Address: $address',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('City: $city',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Contact Person: $contactPerson',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Phone Number: $phoneNumber',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Email: $email',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Generator Information: $generatorInformation',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Price: $price',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Remarks: $remarks',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Generator Model: $generatorModel',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Generator Phase: $generatorPhase',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('Generator Breaker: $generatorBreaker',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  pw.Text('State: $state',
                      style: const pw.TextStyle(
                          fontSize: 20)), // Increase the fontSize here
                  // Resized Image
                  pw.SizedBox(height: 20),
                  pw.Image(imageProvider1, width: 200, height: 200),
                ],
              ),
            ),
            // Right Section
            pw.Container(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Image(imageProvider2, width: 200, height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
