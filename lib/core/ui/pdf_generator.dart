import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';

class PDFGenerator {
  Future<void> generateOrderDetailsPDF(OrderEntity order) async {
    final pdf = pw.Document();

    // Load the font for Arabic if necessary
    final arabicFont = await PdfGoogleFonts.cairoRegular();

    // Get the current date and time
    String currentDateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    // Add a page to the document
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4, // A4 paper size
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                // Title section
                pw.Text(
                  'Order Details',
                  style: pw.TextStyle(font: arabicFont, fontSize: 24),
                ),
                pw.SizedBox(height: 10),

                // Table of products (Order Name, Quantity, Price)
                pw.TableHelper.fromTextArray(
                  headers: ['Order Name', 'Quantity', 'Price'],
                  data: order.orderProductList.map((orderProduct) {
                    return [
                      orderProduct.productName,
                      orderProduct.amount.toString(),
                      orderProduct.price.toString(),
                    ];
                  }).toList(),
                  headerStyle: pw.TextStyle(font: arabicFont, fontSize: 12),
                  cellStyle: pw.TextStyle(font: arabicFont, fontSize: 10),
                ),

                pw.SizedBox(height: 20),

                // Client and order information
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Current Date & Time: ',
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                    pw.Text(
                      currentDateTime,
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Client Name: ',
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                    pw.Text(
                      order.userId.toString(),
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                    // Replace with actual client name if you have it
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Governorate: ',
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                    pw.Text(
                      order.orderGovernorate,
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Client Phone Number: ',
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                    pw.Text(
                      order.orderPhone,
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    // Save the generated PDF file to a temporary location
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/order_details.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  // Method to print the PDF
  Future<void> printOrderDetailsPDF(OrderEntity order) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async {
        final pdf = pw.Document();

        // Add the same content to the PDF as in generateOrderDetailsPDF
        final arabicFont =
            pw.Font.ttf(await rootBundle.load('assets/fonts/HacenTunisia.ttf'));
        String currentDateTime =
            DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Order Details',
                      style: pw.TextStyle(font: arabicFont, fontSize: 24),
                    ),
                    pw.SizedBox(height: 10),
                    pw.TableHelper.fromTextArray(
                      headers: ['Order Name', 'Quantity', 'Price'],
                      data: order.orderProductList.map((orderProduct) {
                        return [
                          orderProduct.productName,
                          orderProduct.amount.toString(),
                          orderProduct.price.toString(),
                        ];
                      }).toList(),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Row(
                      children: [
                        pw.Text(
                          'Current Date & Time: ',
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                        pw.Text(
                          currentDateTime,
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text(
                          'client_code'.tr,
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                        pw.Text(
                          order.userId.toString(),
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text(
                          'Client Name',
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                        buildText(
                          order.useName.toString(),
                          arabicFont,
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text(
                        order.orderGovernorate,
                        style: pw.TextStyle(
                          font: arabicFont,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text(
                        order.orderLocation,
                        style: pw.TextStyle(
                          font: arabicFont,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text(
                          'Client Number',
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                        pw.Text(
                          order.orderPhone,
                          style: pw.TextStyle(
                            font: arabicFont,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    pw.Text(
                      "${order.orderPrice}",
                      style: pw.TextStyle(
                        font: arabicFont,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );

        return await pdf.save();
      },
    );
  }

  pw.Widget buildText(String text, pw.Font arabicFont) {
    final textWidget = pw.Text(
      text,
      style: pw.TextStyle(
        font: arabicFont,
        fontSize: 12,
      ),
    );

    return text.isArabic()
        ? pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: textWidget,
          )
        : textWidget;
  }
}
