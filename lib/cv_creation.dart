import 'package:flutter/material.dart';
import 'package:pdf_insight/src/cv_creation/cv_controller.dart';
import 'package:pdf_insight/src/cv_creation/widgets.dart';

class CvCreationPage extends StatefulWidget {
  const CvCreationPage({Key? key}) : super(key: key);

  @override
  CvCreationPageState createState() => CvCreationPageState();
}

class CvCreationPageState extends State<CvCreationPage> {
  CvController controller = CvController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de CV'),
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CvWidgets(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
