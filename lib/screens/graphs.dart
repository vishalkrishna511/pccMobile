import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pcc/screens/Gmos.dart';
import 'package:mobile_pcc/screens/customAppBar.dart';
import 'package:mobile_pcc/screens/dashboard.dart';
import 'package:mobile_pcc/screens/paymentBroker.dart';
import 'package:mobile_pcc/screens/profile.dart';
import 'package:mobile_pcc/screens/sideNavigator.dart';
import 'package:mobile_pcc/screens/temp.dart';

import 'login.dart';

class Graphs extends StatelessWidget {
  const Graphs({super.key});

  @override
  Widget build(BuildContext context) {
    var currentIndex = 1;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: customAppBar(badgeNotification, context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: const AssetImage('assets/bg.webp'),
              fit: BoxFit.cover),
        ),
        child: Opacity(
          opacity: 0.6,
          child: ListView(
            children: [
              SizedBox(
                width: 200,
                height: 400,
                child: PaymentBroker(title: 'Payments Broker'),
              ),
              SizedBox(
                width: 200,
                height: 400,
                child: GMosRepair(title: 'GMOS Repair'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedLabelStyle:
            const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
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
            label: 'Console',
            icon: Icon(
              Icons.all_inbox,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.account_circle_sharp,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            backgroundColor: Color.fromRGBO(205, 19, 0, 1),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Dashboard(),
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
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Profile(),
                ),
              );
              break;
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
    );
  }
}
