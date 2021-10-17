import 'dart:io';

import 'package:dope_ticket/widgets/print_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dope_ticket/sections/booking_details.dart';
import 'package:dope_ticket/widgets/refundable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
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
          onPressed: () async {},
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
                        onPressed: () async {
                          final _airlineResult = _airlineKey.currentState!.validate;
                          final _airlineTypeResult = _airlineTypeKey.currentState!.validate;
                          final _ticketHandlerResult = _ticketHolderKey.currentState!.validate;
                          final _refunadbleResult = _refunadbleSectionKey.currentState!.validate;
                          final _baggageResult = _baggageSectionKey.currentState!.validate;
                          final _bookingDetailsResult = _bookingDetailsKey.currentState!.validate;

                          if (_notNull(_airlineResult) &&
                              _notNull(_airlineTypeResult) &&
                              _notNull(_ticketHandlerResult) &&
                              _notNull(_refunadbleResult) &&
                              _notNull(_baggageResult) &&
                              _notNull(_bookingDetailsResult)) {
                            await _createAndSharePDF(ETicketModel(
                              airline: _airlineResult!,
                              airLineType: _airlineTypeResult!,
                              ticketHolderDetails: _ticketHandlerResult!,
                              refundable: _refunadbleResult!,
                              baggage: _baggageResult!,
                              bookingDetails: _bookingDetailsResult!,
                            ));
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

  bool _notNull(dynamic val) => val != null;

  Future<bool> _createAndSharePDF(ETicketModel model) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return printLayout(model); // Center
        },
      ),
    );
    WidgetsFlutterBinding.ensureInitialized();
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/e_ticket.pdf';
    final file = File(path);
    return await file.writeAsBytes(await pdf.save()).then((value) {
      return Share.shareFiles(['${value.path}'], text: 'Great picture')
          .then((value) => true)
          .catchError((onError) => false);
    }).catchError((onError) => false);
  }
}
