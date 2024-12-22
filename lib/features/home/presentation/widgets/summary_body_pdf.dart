// ignore_for_file: use_build_context_synchronously

import 'package:pdf/widgets.dart' as pw;

class SummaryBodyPdf extends pw.StatelessWidget {
  SummaryBodyPdf(
      {required this.addressTable,
      required this.date,
      required this.title,
      required this.doctorName,
      required this.orderCounts,
      required this.formattedPrice});
  final Map<String, int> orderCounts;
  final String formattedPrice;
  final String doctorName;
  final String title;
  final String date;
  final String addressTable;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            title,
            style: const pw.TextStyle(
              fontSize: 20,
            ),
          ),
          pw.Text(
            doctorName,
            style: const pw.TextStyle(
              fontSize: 14,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            '$addressTable $date',
            textDirection: pw.TextDirection.rtl,
            textAlign: pw.TextAlign.start,
            style: const pw.TextStyle(
              fontSize: 18,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths: {
              0: const pw.FlexColumnWidth(2),
              1: const pw.FlexColumnWidth(2),
            },
            children: [
              pw.TableRow(
                children: [
                  pw.Text('نوع الطلب',
                      textAlign: pw.TextAlign.center,
                      textDirection: pw.TextDirection.rtl,
                      style: const pw.TextStyle(
                        fontSize: 20,
                      )),
                  pw.Text('عدد الطلبات',
                      textAlign: pw.TextAlign.center,
                      textDirection: pw.TextDirection.rtl,
                      style: const pw.TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
              ...orderCounts.entries.map((entry) {
                return pw.TableRow(
                  children: [
                    pw.Text(
                      style: const pw.TextStyle(
                        fontSize: 18,
                      ),
                      entry.value.toString(),
                      textAlign: pw.TextAlign.center,
                      textDirection: pw.TextDirection.rtl,
                    ),
                    pw.Text(
                      style: const pw.TextStyle(
                        fontSize: 18,
                      ),
                      entry.key,
                      textAlign: pw.TextAlign.center,
                      textDirection: pw.TextDirection.rtl,
                    ),
                  ],
                );
              }),
              pw.TableRow(
                children: [
                  pw.Text(
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                    '$formattedPrice ل.س',
                    textAlign: pw.TextAlign.center,
                    textDirection: pw.TextDirection.rtl,
                  ),
                  pw.Text(
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                    'إجمالي الفواتير',
                    textAlign: pw.TextAlign.center,
                    textDirection: pw.TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
        ]);
  }
}


 /**
  * 
   Future<void> _sharePdf(
      Map<String, int> orderCounts, String formattedPrice) async {
    try {
      final pdf = pw.Document();

      final fontData = await rootBundle.load("assets/fonts/Cairo.ttf");
      final font = pw.Font.ttf(fontData);

      pdf.addPage(
        pw.Page(
          theme: pw.ThemeData.withFont(base: font),
          build: (context) => pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    title,
                    textDirection: pw.TextDirection.rtl,
                    textAlign: pw.TextAlign.start,
                    style: const pw.TextStyle(fontSize: 18),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          doctorName,
                          textAlign: pw.TextAlign.start,
                          textDirection: pw.TextDirection.rtl,
                          style: const pw.TextStyle(fontSize: 16),
                        ),
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    'جدول الجرد:',
                    textDirection: pw.TextDirection.rtl,
                    textAlign: pw.TextAlign.start,
                    style: const pw.TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Table(
                    border: pw.TableBorder.all(),
                    columnWidths: {
                      0: const pw.FlexColumnWidth(2),
                      1: const pw.FlexColumnWidth(2),
                    },
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Text(
                            'نوع الطلب',
                            textAlign: pw.TextAlign.center,
                            textDirection: pw.TextDirection.rtl,
                          ),
                          pw.Text(
                            'عدد الطلبات',
                            textAlign: pw.TextAlign.center,
                            textDirection: pw.TextDirection.rtl,
                          ),
                        ],
                      ),
                      ...orderCounts.entries.map((entry) {
                        return pw.TableRow(
                          children: [
                            pw.Text(
                              entry.key,
                              textAlign: pw.TextAlign.center,
                              textDirection: pw.TextDirection.rtl,
                            ),
                            pw.Text(
                              entry.value.toString(),
                              textAlign: pw.TextAlign.center,
                              textDirection: pw.TextDirection.rtl,
                            ),
                          ],
                        );
                      }),
                      pw.TableRow(
                        children: [
                          pw.Text(
                            'إجمالي الفواتير',
                            textAlign: pw.TextAlign.center,
                            textDirection: pw.TextDirection.rtl,
                          ),
                          pw.Text(
                            '$formattedPrice ل.س',
                            textAlign: pw.TextAlign.center,
                            textDirection: pw.TextDirection.rtl,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      );

      await Printing.sharePdf(bytes: await pdf.save(), filename: '$title.pdf');
    } catch (e) {}
  }
  */