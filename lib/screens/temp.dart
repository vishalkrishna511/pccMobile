import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item
  List<String> items = [
    "Wires",
    "ACH OnUs",
    "ACH InTl",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.notification_important_sharp,
    Icons.notifications_active_rounded,
    Icons.notifications_sharp,
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: 400,
        height: 320,
        margin: const EdgeInsets.all(5),
        child: Column(
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
                            duration: const Duration(milliseconds: 300),
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
                                      color: Colors.deepPurpleAccent, width: 2)
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
                                color: Colors.deepPurpleAccent,
                                shape: BoxShape.circle),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 200,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[current],
                    size: 200,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    items[current],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
