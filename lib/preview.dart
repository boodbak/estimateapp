import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

double wastage = 0;
double finalPrice = 0;
double totalAmount = 0;
double gst = 0;
double tax = 3;


class Preview extends StatefulWidget {
  final String itemName;
  final double grossWeight;
  final double stoneWeight;
  final double goldRate;
  final double nettWeight;
  final double stonePrice;
  final double va;
  final String purityInWords;


  const Preview(this.itemName, this.grossWeight, this.stoneWeight,
      this.goldRate,this.nettWeight, this.stonePrice, this.va, this.purityInWords,
      {super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {

    var date = DateTime.now();

    double wastage = widget.nettWeight  * (widget.va / 100);


    double price = widget.goldRate * widget.nettWeight +
        (((widget.goldRate * widget.nettWeight) * widget.va) / 100) +
        widget.stonePrice;
    finalPrice = price;

    double gst = price * tax / 100;
    totalAmount = price + gst;
    String title = 'JAIN JEWELLERS';
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
                  style: pw.TextStyle(fontSize: 20, color: PdfColors.red, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Estimate'),
              pw.SizedBox(height: 20),
              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Date:'),
                    pw.SizedBox(width: 80),
                    pw.Text('${(DateFormat('dd/MM/yyyy').format(DateTime.now()))}'),] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Gold rate:'),
                pw.SizedBox(width: 56),
                pw.Text('${widget.goldRate.toString()}'),] ),

              pw.SizedBox(height: 10),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Item:'),
                    pw.SizedBox(width: 81),
                    pw.Text('${widget.itemName.toString()}'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Purity:'),
                    pw.SizedBox(width: 73.5),
                    pw.Text('22k916'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Gross weight:'),
                    pw.SizedBox(width: 34),
                    pw.Text('${widget.grossWeight.toString()} gms'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Stone weight:'),
                    pw.SizedBox(width: 34.5),
                    pw.Text('${widget.stoneWeight.toString()} gms'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Net weight:'),
                    pw.SizedBox(width: 47),
                    pw.Text('${widget.nettWeight.toString()} gms'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Value add:'),
                    pw.SizedBox(width: 50),
                    pw.Text('${wastage.toString()} gms'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Stone price:'),
                    pw.SizedBox(width: 43),
                    pw.Text('Rs. ${widget.stonePrice.toString()}'),
                  ] ),

              pw.SizedBox(height: 10),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Amount:'),
                    pw.SizedBox(width: 62),
                    pw.Text('Rs. ${finalPrice.toString()}'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Gst:'),
                    pw.SizedBox(width: 84),
                    pw.Text('Rs. ${gst.toString()}'),
                  ] ),

              pw.SizedBox(height: 10),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Total Amount:'),
                    pw.SizedBox(width: 31.5),
                    pw.Text('Rs. ${totalAmount.toString()}'),
                  ] ),



            ],
          );
        },
      ),
    );
    return Scaffold(body: PdfPreview(build: (format) => doc.save()));
  }
}
