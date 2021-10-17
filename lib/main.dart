import 'dart:html' as html;
import 'package:dope_ticket/widgets/print_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dope_ticket/sections/booking_details.dart';
import 'package:dope_ticket/widgets/refundable.dart';
import 'package:flutter/services.dart';
import 'commons/labels.dart';
import 'models/e_ticket_model.dart';
import 'sections/airline_type.dart';
import 'sections/info_section.dart';
import 'widgets/airlines.dart';
import 'widgets/baggage.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: L.e_ticket,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: L.e_ticket),
      home: Sample(),
    );
  }
}

class Sample extends StatelessWidget {
  final pdf = pw.Document();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = pw.Document();

            final font = await rootBundle.load("fonts/OpenSans-Regular.ttf");
            final ttf = pw.Font.ttf(font);
            final fontBold = await rootBundle.load("fonts/OpenSans-Bold.ttf");
            final ttfBold = pw.Font.ttf(fontBold);
            final fontItalic = await rootBundle.load("fonts/OpenSans-Italic.ttf");
            final ttfItalic = pw.Font.ttf(fontItalic);
            final fontBoldItalic = await rootBundle.load("fonts/OpenSans-BoldItalic.ttf");
            final ttfBoldItalic = pw.Font.ttf(fontBoldItalic);

            pdf.addPage(
              pw.Page(
                theme: pw.ThemeData.withFont(
                  base: ttf,
                  bold: ttfBold,
                  italic: ttfItalic,
                  boldItalic: ttfBoldItalic,
                ),
                pageFormat: PdfPageFormat.a4,
                build: (pw.Context context) {
                  return printLayout(); // Center
                },
              ),
            );

            final bytes = await pdf.save();
            final blob = html.Blob([bytes], 'application/pdf');
            final url = html.Url.createObjectUrlFromBlob(blob);

            final anchor = html.document.createElement('a') as html.AnchorElement
              ..href = url
              ..style.display = 'none'
              ..download = 'report_.pdf';
            html.document.body?.children.add(anchor);

            // download
            anchor.click();

            // cleanup
            html.document.body?.children.remove(anchor);
            html.Url.revokeObjectUrl(url);
          },
          child: Text('Generate'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title});

  final _bookingDetailsKey = GlobalKey<BookkingDetailsState>();
  final _ticketHolderKey = GlobalKey<TicketHolderDetailsState>();
  final _airlineTypeKey = GlobalKey<AirLineTypeState>();
  final _airlineKey = GlobalKey<AirLinesState>();
  final _refunadbleSectionKey = GlobalKey<RefundableState>();
  final _baggageSectionKey = GlobalKey<BaggageState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AirLines(
                key: _airlineKey,
              ),
              AirLineType(
                key: _airlineTypeKey,
              ),
              TicketHolderDetails(
                key: _ticketHolderKey,
              ),
              Refundable(
                key: _refunadbleSectionKey,
              ),
              Baggage(
                key: _baggageSectionKey,
              ),
              BookingDetails(
                key: _bookingDetailsKey,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          final _airlineResult = _airlineKey.currentState!.validate;
                          final _airlineTypeResult = _airlineTypeKey.currentState!.validate;
                          final _ticketHandlerResult = _ticketHolderKey.currentState!.validate;
                          final _refunadbleResult = _refunadbleSectionKey.currentState!.validate;
                          final _baggageResult = _baggageSectionKey.currentState!.validate;
                          final _bookingDetailsResult = _bookingDetailsKey.currentState!.validate;

                          if (notNull(_airlineResult) &&
                              notNull(_airlineTypeResult) &&
                              notNull(_ticketHandlerResult) &&
                              notNull(_refunadbleResult) &&
                              notNull(_baggageResult) &&
                              notNull(_bookingDetailsResult)) {
                            print("Unbelievable!");

                            ETicketModel(
                              airline: _airlineResult!,
                              airLineType: _airlineTypeResult!,
                              ticketHolderDetails: _ticketHandlerResult!,
                              refundable: _refunadbleResult!,
                              baggage: _baggageResult!,
                              bookingDetails: _bookingDetailsResult!,
                            );
                          }
                        },
                        child: Text(L.submit),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool notNull(dynamic val) => val != null;
}
