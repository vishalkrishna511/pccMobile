import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pcc/Services/notifi_service.dart';
import 'package:mobile_pcc/screens/customAppBar.dart';

import 'package:mobile_pcc/screens/sideNavigator.dart';

class DashboardSS extends StatefulWidget {
  const DashboardSS({super.key});

  // final String title;

  @override
  State<DashboardSS> createState() => _DashboardSSState();
}

class _DashboardSSState extends State<DashboardSS> {
  late final bool custom = false;
  List<String> items = [
    "Wires",
    "ACH OnUs",
    "ACH InTl",
  ];

  List<List<String>> texts = [
    ['Internal Wire Transfer', 'FedWire in', 'CHIPS In'],
    ['ACH OnUS Trans', 'ACH Fed In', 'ACH Transaction In'],
    ['ACH Intl In', 'ACH Value OutBound', 'Intl In']
  ];

  List<List<String>> alertsNum = [
    ['WIR-00007-20230216', 'WIR-00002-20230216', 'WIR-00004-20230216'],
    ['ACH-00001-20230216', 'ACH-00012-20230216', 'ACH-00009-20230216'],
    ['INT-00004-20230216', 'INT-00014-20230216', 'INT-00016-20230216']
  ];
  List<List<String>> notifications = [
    ['Opening Payment Wire!!', 'Alert to Payment', 'Wire Payment on Hold'],
    ['Opening Payment via ACH', 'ACH Fed In', 'ACH Transaction on Hold'],
    [
      'ACH Intl Payment initiated',
      'ACH Value OutBound Alert',
      'ACH Intl limit Exceeded'
    ]
  ];
  int current2 = 0;
  int current = 0;
  int current1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 236, 216),
      // backgroundColor: Colors.transparent,

      drawer: const NavigationDrawerWidget(),
      // appBar: AppBar(),
      appBar: customAppBar(5, context),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: const AssetImage('assets/bg.webp'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            ...[_buildMarquee()].map(_wrapWithStuff).toList(),
            const Text('ijinhunuhu')
          ]),
        ),
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text: 'GeeksforGeeks.org was created'
          ' with a goal in mind to provide well written,'
          ' well thought and well explained solutions for'
          ' selected questions. The core team of five super geeks constituting'
          ' of technology lovers and computer science enthusiasts'
          ' have been constantly working in this direction ',
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 50.0, color: Colors.white, child: child),
    );
  }
}
