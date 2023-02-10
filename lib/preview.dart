import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

double finalPrice = 0;

class Preview extends StatefulWidget {
  final String itemName;
  final double grossWeight;
  final double stoneWeight;
  final double goldRate;
  final double nettWeight;
  final double stonePrice;
  final double va;
  const Preview(this.itemName, this.grossWeight, this.stoneWeight,
      this.goldRate, this.nettWeight, this.stonePrice, this.va,
      {super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    double price = widget.goldRate * widget.nettWeight +
        (((widget.goldRate * widget.nettWeight) * widget.va) / 100) +
        widget.stonePrice;
    finalPrice = price;
    String title = 'Jain Jewellers';
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat
            .a6, //can change output size here, but idk how to customize sizes
        build: (pw.Context context) {
          return pw.Column(
            children: [
              // pw.Flexible(child: pw.FlutterLogo()), //add your shop logo here, some kind of error with Flexible here idk, check google to solve
              pw.Center(
                child: pw.Text(
                  title,
                  style: pw.TextStyle(fontSize: 30, color: PdfColors.red),
                ),
              ),
              pw.Text('Amount: ${finalPrice.toString()}'),
              pw.Text('Amount: ${widget.goldRate.toString()}'),
              pw.Text('Amount: ${widget.va.toString()}'),
              pw.Text('Amount: ${widget.grossWeight.toString()}'),
              pw.Text('Amount: ${widget.nettWeight.toString()}'),
              pw.Text('Amount: ${widget.stoneWeight.toString()}'),
              pw.Text('Amount: ${widget.stonePrice.toString()}'),
              pw.Text('Amount: ${widget.itemName.toString()}'),
            ],
          );
        },
      ),
    );
    return Scaffold(body: PdfPreview(build: (format) => doc.save()));
  }
}
