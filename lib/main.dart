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
  String _generatorModel = '';
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
                  controller: _customerNameController,
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
                  controller: _customerNameController,
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
                  controller: _customerNameController,
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
                  controller: _customerNameController,
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
                  controller: _customerNameController,
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

                // Generator Name Radio Buttons
                const Text('Select Generator Model'),
                RadioListTile<String>(
                  title: const Text('Gen1'),
                  value: 'Gen1',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Gen2'),
                  value: 'Gen2',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Gen3'),
                  value: 'Gen3',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),

                // form part 1 over
                // form part 2 starts here
                // Contact person TextField
                TextFormField(
                  controller: _customerNameController,
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
                  value: '1',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('LHP 7.5 kVA to 320 kVA'),
                  value: '2',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('HHP 380 kVA to 2000 kVA'),
                  value: '3',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('HHP - 380 kVA & Above'),
                  value: '4',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Open OG ( 5 kVA to 15 kVA)'),
                  value: '5',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Other'),
                  value: '6',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
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
                  value: '1',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('3 phase'),
                  value: '3',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),

                // Generator Name Radio Buttons
                const Text('Breaker?'),
                RadioListTile<String>(
                  title: const Text('Yes'),
                  value: 'Yes',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('No'),
                  value: 'No',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    setState(() {
                      _generatorModel = value!;
                    });
                  },
                ),

                // price TextField
                TextFormField(
                  controller: _customerNameController,
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
                  controller: _customerNameController,
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
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      generatePdf(context);
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
    String employeeName = _employeeNameController.text;
    String customerName = _customerNameController.text;
    String generatorModel = _generatorModel;
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
                  pw.Text('Generator Model: $generatorModel',
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
