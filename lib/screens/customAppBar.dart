import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pcc/screens/sideNavigator.dart';

AppBar customAppBar(num badgeNotification) {
  return AppBar(
    backgroundColor: const Color(0xFFd81e29),
    // elevation: 10,
    shadowColor: Colors.black,
    centerTitle: true,
    title: const Image(
      image: AssetImage('assets/appbar1.png'),
      fit: BoxFit.fill,
    ),
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(
    //     bottom: Radius.circular(30),
    //   ),
    // ),
    actions: [
      Row(
        children: [
          Container(
            width: 55,
            height: 18,
            color: Colors.white,
            child: Text(
              textAlign: TextAlign.center,
              '7:32 EST',
              style: GoogleFonts.dmSerifDisplay(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xffffd140),
                  // child: Icon(Icons.notification_important_outlined),
                  backgroundImage: AssetImage('assets/vk.jpg'),
                ),
              ),
              Positioned(
                right: 10,
                top: 2,
                // left: 30,
                child: Container(
                  height: 20,
                  width: 15,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Text(
                    '$badgeNotification',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSerifDisplay(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(30),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Hi, Vishal Krishna..',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
