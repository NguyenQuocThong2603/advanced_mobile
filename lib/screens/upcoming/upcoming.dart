import 'package:flutter/material.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcoming',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
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
                      padding: const EdgeInsets.only(top: 15),
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
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey[200] as Color),
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Cancel',
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.blue),
                                          color: Colors.blue,
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(4),
                                              bottomRight: Radius.circular(20))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Go to meeting',
                                            style: TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
                      padding: const EdgeInsets.only(top: 15),
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
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey[200] as Color),
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Cancel',
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.grey.shade300),
                                          color: Colors.grey.shade400,
                                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Go to meeting',
                                            style: TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
