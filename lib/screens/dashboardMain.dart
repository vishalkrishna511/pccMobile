import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pcc/Services/notifi_service.dart';

import 'package:mobile_pcc/screens/sideNavigator.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain({super.key});

  // final String title;

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
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
    AppBar appBar = AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFb40404),
      centerTitle: true,
      title: const Text(
        'WELLS FARGO',
        style: TextStyle(
          fontSize: 30,
          color: Color(0xFFfdc312),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            Positioned(
              right: 11,
              top: 11,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: const Text(
                  '9',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ],
    );
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0), // here the desired height
          child: appBar),
      body: Container(
        height:
            MediaQuery.of(context).size.height - appBar.preferredSize.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFf0ebe5),
              Color.fromARGB(255, 253, 234, 184),
              Color(0xFFf0ebe5)
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFb40404),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFfdc312),
                      width: 5,
                    ),
                  ),
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(20),
                  //     bottomRight: Radius.circular(20))

                  // borderRadius: BorderRadius.vertical(
                  //   bottom: Radius.elliptical(
                  //     MediaQuery.of(context).size.width,50,
                  //   ),
                  // ),
                ),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 1.5),
                      // borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      width: 80,
                      height: 70,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'EST',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '17:00',
                              style: TextStyle(fontSize: 21),
                            )
                          ]),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black, width: 1.5),
                      //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      width: 80,
                      height: 70,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'PST',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '13:00',
                              style: TextStyle(fontSize: 21),
                            )
                          ]),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black, width: 1.5),
                      //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      width: 80,
                      height: 70,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'MST',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '11:00',
                              style: TextStyle(fontSize: 21),
                            )
                          ]),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black, width: 1.5),
                      //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      width: 80,
                      height: 70,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'CST',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14:00',
                              style: TextStyle(fontSize: 21),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          // shape: RoundedRectangleBorder(
                          //   side: BorderSide(color: Colors.black, width: 1),
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          title: Text(
                            'Opening Fed Balance',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '88,966,692,525 USD',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          // shape: RoundedRectangleBorder(
                          //   side: BorderSide(color: Colors.black, width: 1),
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          title: Text(
                            'Current Fed Balance',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '110,457,915,014 USD',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          // shape: RoundedRectangleBorder(
                          //   side: BorderSide(color: Colors.black, width: 1),
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          title: Text(
                            'Hours Fed Open',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('5:00 AM ET'),
                          trailing: Text(
                            '45 min',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          // shape: RoundedRectangleBorder(
                          //   side: BorderSide(color: Colors.black, width: 1),
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          title: Text(
                            'Fed Closes',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('7:00 PM ET'),
                          trailing: Text(
                            '13hr 15min',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ExpansionTile(
                title: const Text('Alerts'),
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
                                          current = index;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
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
                                                  color:
                                                      Colors.deepPurpleAccent,
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
                                      leading: Icon(
                                          Icons.notifications_active_rounded),
                                      title: Text(texts[current][0]),
                                      subtitle: Text(alertsNum[current][0]),
                                      // dense: true,
                                      isThreeLine: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: ListTile(
                                      leading: const Icon(
                                          Icons.notifications_active_rounded),
                                      title: Text(texts[current][1]),
                                      subtitle: Text(alertsNum[current][1]),
                                      // dense: true,
                                      isThreeLine: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: ListTile(
                                      leading: const Icon(
                                          Icons.notifications_active_rounded),
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
                                      Duration(milliseconds: 1000),
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
              ExpansionTile(
                title: const Text('Notifications'),
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
                                        duration:
                                            const Duration(milliseconds: 300),
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
                                                  color:
                                                      Colors.deepPurpleAccent,
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
                                      leading: Icon(Icons.notifications_sharp),
                                      title: Text(notifications[current1][0]),
                                      subtitle: const Text('Payment'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.notifications_sharp),
                                      title: Text(notifications[current1][1]),
                                      subtitle: const Text('ACH'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.notifications_sharp),
                                      title: Text(notifications[current1][2]),
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
                                      const Duration(milliseconds: 1000),
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
              ExpansionTile(
                title: const Text('Post Outages'),
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
                                        duration:
                                            const Duration(milliseconds: 300),
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
                                                  color:
                                                      Colors.deepPurpleAccent,
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
                                      leading: const Icon(
                                          Icons.notifications_active_rounded),
                                      title: Text(texts[current2][0]),
                                      subtitle: Text(alertsNum[current2][0]),
                                      // dense: true,
                                      isThreeLine: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: ListTile(
                                      leading: const Icon(
                                          Icons.notifications_active_rounded),
                                      title: Text(texts[current2][1]),
                                      subtitle: Text(alertsNum[current2][1]),
                                      // dense: true,
                                      isThreeLine: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: ListTile(
                                      leading: const Icon(
                                          Icons.notifications_active_rounded),
                                      title: Text(texts[current2][2]),
                                      subtitle: Text(alertsNum[current2][2]),
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
                                      Duration(milliseconds: 1000),
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFb40404),
        onPressed: () {
          NotificationService().showNotification(
              title: 'ALERT!!!!', body: 'Required Action immediately!!!');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
