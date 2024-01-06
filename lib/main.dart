import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
  XFile? _image;

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
                // ... other form fields ...
                ElevatedButton(
                  onPressed: () async {
                    _image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: const Text('Pick Image'),
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

    final imageProvider = pw.MemoryImage(
      await _image!.readAsBytes(),
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              // ... other text fields ...
              pw.Image(imageProvider),
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
