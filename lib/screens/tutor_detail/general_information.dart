import 'package:flutter/material.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 8),
                child: const Image(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/147/147133.png',
                        scale: 6))
            ),
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Abby', style: TextStyle(fontSize: 20),),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                          Icon(Icons.star_rate_rounded,color: Colors.yellow.shade700,),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Teacher', style: TextStyle(color: Color(0xff787878)),),
                        Icon(Icons.favorite_outline,color: Colors.pink,)
                      ],
                    ),
                  ),
                  const Text('Philippines the')
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 113, 240, 1),
                      padding: const EdgeInsets.all(12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text(
                      'Booking',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
              )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const[
                      Icon(Icons.message, color: Color.fromRGBO(0, 113, 240, 1),),
                      Text('Message', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1)),)
                    ],
                  ),
                  Column(
                    children: const[
                      Icon(Icons.report, color: Color.fromRGBO(0, 113, 240, 1),),
                      Text('Report', style: TextStyle(color: Color.fromRGBO(0, 113, 240, 1)),)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: const Text('I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
            style: TextStyle(fontSize: 16, height: 1.3),
          ),
        ),
      ],
    );
  }
}
