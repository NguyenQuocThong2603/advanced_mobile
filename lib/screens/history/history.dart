import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'History',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            blurRadius: 2,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 8, left: 15),
                                    child: const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147133.png',scale: 8))
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Keegan'),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 8),
                                        child: Row(
                                          children: [
                                            const Text('Sat, 11 Mar 23'),
                                            Container(
                                              padding: const EdgeInsets.all(2),
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.blue, width: 1), color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
                                              child: const Text('8:15', style: TextStyle(color: Colors.blue),),
                                            ),
                                            const Text("-"),
                                            Container(
                                              padding: const EdgeInsets.all(2),
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.orange, width: 1), color: Colors.orange[50], borderRadius: BorderRadius.circular(4)),
                                              child: const Text('9:00', style: TextStyle(color: Colors.orange),),
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            blurRadius: 2,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 8, left: 15),
                                    child: const Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/147/147133.png',scale: 8))
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Keegan'),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 8),
                                        child: Row(
                                          children: [
                                            const Text('Sat, 11 Mar 23'),
                                            Container(
                                              padding: const EdgeInsets.all(2),
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.blue, width: 1), color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
                                              child: const Text('8:15', style: TextStyle(color: Colors.blue),),
                                            ),
                                            const Text("-"),
                                            Container(
                                              padding: const EdgeInsets.all(2),
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.orange, width: 1), color: Colors.orange[50], borderRadius: BorderRadius.circular(4)),
                                              child: const Text('9:00', style: TextStyle(color: Colors.orange),),
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
