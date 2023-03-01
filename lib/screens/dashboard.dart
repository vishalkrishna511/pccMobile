import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pcc/Services/notifi_service.dart';
import 'package:mobile_pcc/screens/Gmos.dart';
import 'package:mobile_pcc/screens/customAppBar.dart';
import 'package:mobile_pcc/screens/graphs.dart';
import 'package:mobile_pcc/screens/login.dart';
import 'package:mobile_pcc/screens/paymentBroker.dart';

import 'package:mobile_pcc/screens/sideNavigator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  // final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
  var currentIndex = 0;
  var badgeNotification = 0;
  List<Color> listColors = [
    const Color.fromARGB(120, 76, 175, 79),
    const Color.fromARGB(139, 255, 193, 7),
    const Color.fromARGB(131, 255, 153, 0),
    const Color.fromARGB(123, 244, 67, 54),
  ];
  List<String> stringInfo = ['Info', 'Warning', 'Critical', 'Error'];
  List<String> errInfo = ['5', '10', '5', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 249, 241, 226),
      // backgroundColor: Colors.transparent,

      drawer: const NavigationDrawerWidget(),
      // appBar: AppBar(),
      appBar: customAppBar(badgeNotification),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: const AssetImage('assets/bg.webp'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              ...[_buildMarquee()].map(_wrapWithStuff).toList(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4),
                child: Container(
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: List.generate(
                            2,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  child: (index == 0)
                                      ? PaymentBroker(title: 'Payments Broker')
                                      : GMosRepair(title: 'GMos Repair'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    ' Payment Broker',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      ' \u{25B2} 38',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.albertSans(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        // backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    ' GMOS Q Depth',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.albertSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      ' \u{25BC} 20',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.albertSans(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        // backgroundColor: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4),
                child: Container(
                    width: 400,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 4,
                        shrinkWrap: false,
                        children: List.generate(
                          4,
                          (index) {
                            return Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: listColors[index],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(errInfo[index],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.albertSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(stringInfo[index],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.albertSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ));
                          },
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, bottom: 8.0, right: 8.0, top: 14.0),
                child: Container(
                  color: const Color.fromARGB(232, 249, 241, 226),
                  child: ExpansionTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    title: Text(
                      'Alerts',
                      style: GoogleFonts.albertSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        color: const Color.fromARGB(232, 249, 241, 226),
                        width: 400,
                        height: 150,
                        margin: const EdgeInsets.all(5),
                        child: ListView(
                          children: [
                            /// CUSTOM TABBAR
                            SizedBox(
                              width: 400,
                              height: 60,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: items.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              current = index;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            margin: const EdgeInsets.all(5),
                                            width: 80,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: current == index
                                                  ? Colors.white70
                                                  : Colors.white54,
                                              borderRadius: current == index
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(10),
                                              border: current == index
                                                  ? Border.all(
                                                      color: Colors.black,
                                                      width: 2)
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Text(
                                                items[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: current == index
                                                        ? Colors.black
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: current == index,
                                          child: Container(
                                            width: 5,
                                            height: 5,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 86, 52, 177),
                                                shape: BoxShape.circle),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 380,
                              height: 200,
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CarouselSlider(
                                    items: [
                                      SizedBox(
                                        width: 380,
                                        height: 50,
                                        child: ListTile(
                                          selectedTileColor: Colors.black,
                                          leading: const Icon(Icons
                                              .notifications_active_rounded),
                                          title: Text(texts[current][0]),
                                          subtitle: Text(alertsNum[current][0]),
                                          // dense: true,
                                          isThreeLine: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 380,
                                        child: ListTile(
                                          leading: const Icon(Icons
                                              .notifications_active_rounded),
                                          title: Text(texts[current][1]),
                                          subtitle: Text(alertsNum[current][1]),
                                          // dense: true,
                                          isThreeLine: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 380,
                                        child: ListTile(
                                          leading: const Icon(Icons
                                              .notifications_active_rounded),
                                          title: Text(texts[current][2]),
                                          subtitle: Text(alertsNum[current][2]),
                                          // dense: true,
                                          isThreeLine: true,
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: true,
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 3100),
                                      viewportFraction: 1.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: const Color.fromARGB(232, 249, 241, 226),
                  child: ExpansionTile(
                    title: Text(
                      'Notifications',
                      style: GoogleFonts.albertSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        width: 400,
                        height: 150,
                        margin: const EdgeInsets.all(5),
                        child: ListView(
                          children: [
                            /// CUSTOM TABBAR
                            SizedBox(
                              width: 400,
                              height: 60,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: items.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              current1 = index;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            margin: const EdgeInsets.all(5),
                                            width: 80,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: current1 == index
                                                  ? Colors.white70
                                                  : Colors.white54,
                                              borderRadius: current1 == index
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(10),
                                              border: current1 == index
                                                  ? Border.all(
                                                      color: Colors.black,
                                                      width: 2)
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Text(
                                                items[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: current1 == index
                                                        ? Colors.black
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: current1 == index,
                                          child: Container(
                                            width: 5,
                                            height: 5,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 86, 52, 177),
                                                shape: BoxShape.circle),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 380,
                              height: 200,
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CarouselSlider(
                                    items: [
                                      SizedBox(
                                        width: 380,
                                        height: 50,
                                        child: ListTile(
                                          selectedTileColor: Colors.black,
                                          leading: const Icon(
                                              Icons.notifications_sharp),
                                          title:
                                              Text(notifications[current1][0]),
                                          subtitle: const Text('Payment'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 380,
                                        child: ListTile(
                                          leading: const Icon(
                                              Icons.notifications_sharp),
                                          title:
                                              Text(notifications[current1][1]),
                                          subtitle: const Text('ACH'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 380,
                                        child: ListTile(
                                          leading: const Icon(
                                              Icons.notifications_sharp),
                                          title:
                                              Text(notifications[current1][2]),
                                          subtitle: const Text('Card'),
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: true,
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 3000),
                                      viewportFraction: 1.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: const Color.fromARGB(232, 249, 241, 226),
                  child: ExpansionTile(
                    title: Text(
                      'Post Outages',
                      style: GoogleFonts.albertSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        width: 400,
                        height: 150,
                        margin: const EdgeInsets.all(5),
                        child: ListView(
                          children: [
                            /// CUSTOM TABBAR

                            SizedBox(
                              width: 400,
                              height: 60,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: items.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              current2 = index;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            margin: const EdgeInsets.all(5),
                                            width: 80,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: current2 == index
                                                  ? Colors.white70
                                                  : Colors.white54,
                                              borderRadius: current2 == index
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(10),
                                              border: current2 == index
                                                  ? Border.all(
                                                      color: Colors
                                                          .deepPurpleAccent,
                                                      width: 2)
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Text(
                                                items[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: current2 == index
                                                        ? Colors.black
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: current2 == index,
                                          child: Container(
                                            width: 5,
                                            height: 5,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 86, 52, 177),
                                                shape: BoxShape.circle),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 380,
                              height: 200,
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  CarouselSlider(
                                    items: [
                                      SizedBox(
                                        width: 380,
                                        height: 50,
                                        child: ListTile(
                                          selectedTileColor: Colors.black,

                                          leading: const Icon(Icons
                                              .notifications_active_rounded),

                                          title: Text(texts[current2][0]),

                                          subtitle:
                                              Text(alertsNum[current2][0]),

                                          // dense: true,

                                          isThreeLine: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 380,
                                        child: ListTile(
                                          leading: const Icon(Icons
                                              .notifications_active_rounded),

                                          title: Text(texts[current2][1]),

                                          subtitle:
                                              Text(alertsNum[current2][1]),

                                          // dense: true,

                                          isThreeLine: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 380,
                                        child: ListTile(
                                          leading: const Icon(Icons
                                              .notifications_active_rounded),

                                          title: Text(texts[current2][2]),

                                          subtitle:
                                              Text(alertsNum[current2][2]),

                                          // dense: true,

                                          isThreeLine: true,
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      enlargeCenterPage: true,

                                      autoPlay: true,

                                      // aspectRatio: 16 / 9,

                                      autoPlayCurve: Curves.fastOutSlowIn,

                                      enableInfiniteScroll: true,

                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 3200),

                                      viewportFraction: 1.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
          BottomNavigationBarItem(
            label: 'Live',
            icon: Icon(
              Icons.auto_graph_sharp,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
          BottomNavigationBarItem(
            label: 'Console',
            icon: Icon(
              Icons.all_inbox,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
          BottomNavigationBarItem(
            label: 'Logout',
            icon: Icon(
              Icons.logout_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Graphs(),
                ),
              );
              break;
            // case 2:
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => ,
            //   ),
            // );
            // break;
            // case 3:
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => ,
            //   ),
            // );
            // break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const LoginPage(title: 'Login Page'),
                ),
              );
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFb40404),
        onPressed: () async {
          badgeNotification += 1;
          await customAppBar(badgeNotification);
          NotificationService().showNotification(
              title: 'ALERT!!!!', body: 'Required Action immediately!!!');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text:
          'ALERTS:: SWIFT - In (SWF) Actual Volume - 288 | Difference Volume 283 Deadline 14 hr 17 mins||  '
          'SWIFT - Out (SWF) Actual Volume - 1391 | Difference Volume 1387 Deadline 15 hr 22 mins|| '
          'Online Wires (PB 1) Intraday Average Value (\$1907) | EOD Value (\$6027) ',
      style: GoogleFonts.albertSans(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        backgroundColor: Colors.white,
      ),
      velocity: 75,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Container(
        height: 30.0, color: const Color(0xFFd81e29), child: child);
  }
}
