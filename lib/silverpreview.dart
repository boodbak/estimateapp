import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

double mcCharges = 0;
double finalPrice = 0;
double totalAmount = 0;
double gst = 0;
double tax = 3;


class SilverPreview extends StatefulWidget {
  final String itemName;
  final double weight;
  final double rate;
  final double stonePrice;
  final double mc;
  final String purityInWords;


  const SilverPreview(this.itemName, this.weight,
      this.rate, this.stonePrice, this.mc,this.purityInWords,
      {super.key});

  @override
  State<SilverPreview> createState() => _SilverPreviewState();
}

class _SilverPreviewState extends State<SilverPreview> {
  @override
  Widget build(BuildContext context) {

    var date = DateTime.now();

    double mcCharges = (widget.weight  * widget.mc);


    double price = (widget.rate/10 * widget.weight) + mcCharges +widget.stonePrice;
    finalPrice = price.roundToDouble();

    double gst = (finalPrice * tax / 100).roundToDouble();
    totalAmount = finalPrice + gst;
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
                  style: pw.TextStyle(fontSize: 20, color: PdfColors.blue, fontWeight: pw.FontWeight.bold),
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
                    pw.Text('Silver rate:'),
                pw.SizedBox(width: 52),
                pw.Text('${widget.rate.toString()}'),] ),

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
                    pw.Text(widget.purityInWords),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Weight:'),
                    pw.SizedBox(width: 67),
                    pw.Text('${widget.weight.toStringAsFixed(3)} gms'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('MC:'),
                    pw.SizedBox(width: 85),
                    pw.Text('Rs. ${mcCharges.toStringAsFixed(1)}'),
                  ] ),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Stone price:'),
                    pw.SizedBox(width: 43),
                    pw.Text('Rs. ${widget.stonePrice.toStringAsFixed(1)}'),
                  ] ),

              pw.SizedBox(height: 10),

              pw.Row(
                  children:[
                    pw.SizedBox(width: 35),
                    pw.Text('Amount:'),
                    pw.SizedBox(width: 62),
                    pw.Text('Rs. ${finalPrice.roundToDouble()}'),
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

              pw.SizedBox(height: 80,),
            ],
          );
        },
      ),
    );
    return Scaffold(body: PdfPreview(build: (format) => doc.save()));
  }
}
