import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:flutter/material.dart';

class NationalitiesMenu extends StatefulWidget {
  const NationalitiesMenu({
    Key? key,
    required this.nationalities,
    required this.tutorProvider,
    required this.name,
    required this.speciality,
  }) : super(key: key);
  final List<String> nationalities;
  final TutorProvider tutorProvider;
  final String name;
  final String speciality;


  @override
  State<NationalitiesMenu> createState() => _NationalitiesMenuState();
}

class _NationalitiesMenuState extends State<NationalitiesMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15,bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey.shade200
              ),
              child: DropdownButton(
                value: widget.nationalities[widget.tutorProvider.nationalityIndex],
                isExpanded: true,
                icon: const Icon(Icons.expand_more),
                style: const TextStyle(color: Colors.black),
                onChanged: (String? value) async {
                  await widget.tutorProvider.searchTutorByName(
                      widget.name,
                      widget.speciality,
                      value!,
                      context
                  );
                },
                underline: Container(),
                items: widget.nationalities.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
