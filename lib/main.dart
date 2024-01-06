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
  XFile? _image1;
  XFile? _image2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generate PDF'),
        ),
        body: Center(
          child: Form(
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
                // Generator Name Radio Buttons
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
