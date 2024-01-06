import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _employeeNameController = TextEditingController();
  final _customerNameController = TextEditingController();
  String _generatorModel = '';

  MyApp({super.key});

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
                TextFormField(
                  controller: _employeeNameController,
                  decoration: const InputDecoration(labelText: 'Employee Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter employee name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _customerNameController,
                  decoration: const InputDecoration(labelText: 'Customer Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter customer name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Generator Model'),
                RadioListTile(
                  title: const Text('Model A'),
                  value: 'Model A',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    // setState(() {
                    //   _generatorModel = value!;
                    // });
                  },
                ),
                RadioListTile(
                  title: const Text('Model B'),
                  value: 'Model B',
                  groupValue: _generatorModel,
                  onChanged: (value) {
                    // setState(() {
                    //   _generatorModel = value!;
                    // });
                  },
                ),
                const SizedBox(height: 16),
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

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text('Employee Name: ${_employeeNameController.text}',
                  style: const pw.TextStyle(fontSize: 20)),
              pw.Text('Customer Name: ${_customerNameController.text}',
                  style: const pw.TextStyle(fontSize: 20)),
              pw.Text('Generator Model: $_generatorModel',
                  style: const pw.TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
