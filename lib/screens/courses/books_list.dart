import 'package:advanced_mobile/screens/course_detail/course_detail.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 6, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afilewhat_a_world.jpeg'),),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('What a world 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 40),
                          child: const Text('For teenagers who have an excellent vocabulary background and brilliant communication skills.',
                            style: TextStyle(color: Color(0xff808080)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const Text('Intermediate', style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 6, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afilewhat_a_world.jpeg'),),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('What a world 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 40),
                          child: const Text('For teenagers who have an excellent vocabulary background and brilliant communication skills.',
                            style: TextStyle(color: Color(0xff808080)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const Text('Intermediate', style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]
    );
  }
}
