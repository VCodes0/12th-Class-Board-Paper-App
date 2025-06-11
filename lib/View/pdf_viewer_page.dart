import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerPage({super.key, required this.pdfUrl});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  bool _isLoading = true;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SfPdfViewer.network(
            widget.pdfUrl,
            onDocumentLoaded: (_) {
              setState(() {
                _isLoading = false;
              });
            },
            onDocumentLoadFailed: (_) {
              setState(() {
                _isLoading = false;
                _hasError = true;
              });
            },
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
          if (_hasError)
            const Center(
              child: Text(
                "Failed to load PDF",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }
}
