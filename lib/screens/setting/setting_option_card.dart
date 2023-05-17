import 'package:flutter/material.dart';

class SettingOptionCard extends StatelessWidget {
  const SettingOptionCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.screen
  }) : super(key: key);
  final String name;
  final IconData icon;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white10 ,
                      offset: Offset(0,3)
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 4, right: 8),
                          child: Icon(icon)),
                      Text(name, style: const TextStyle(fontSize: 16),)
                    ],
                  ),
                  const Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
