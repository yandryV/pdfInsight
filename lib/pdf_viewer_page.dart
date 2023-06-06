import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

class PDFViewerPage extends StatelessWidget {
  final File pdfFile;
  final String pdfName;

  const PDFViewerPage({Key? key, required this.pdfFile, required this.pdfName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pdfName),
      ),
      body: SfPdfViewer.file(
        pdfFile,
      ),
    );
  }
}
