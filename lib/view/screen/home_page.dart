import 'package:flutter/material.dart';

import 'game.dart';

class HomePageGame extends StatelessWidget {
  const HomePageGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height,
                    child: Image.asset(
                      'assets/images/start.png',
                      fit: BoxFit.cover,
                    )),
                Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "T   E   T",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.white30),
                        children: [
                          TextSpan(
                            text: "   R   I   S",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white30),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 1.8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => const Gaaaame()));
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.white),
                            BoxShadow(color: Colors.red),
                            BoxShadow(color: Colors.yellow),
                            BoxShadow(color: Colors.black),
                          ],
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Colors.red,
                                  Colors.deepPurpleAccent,
                                  Colors.orangeAccent,
                                ]),
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            )),
                        child: const Center(
                          child: Text(
                            'GO',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
