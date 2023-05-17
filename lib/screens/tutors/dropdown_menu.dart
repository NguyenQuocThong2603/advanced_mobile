import 'package:advanced_mobile/providers/tutor_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class NationalitiesMenu extends StatefulWidget {
  const NationalitiesMenu({
    Key? key,
    required this.nationalities,
    required this.tutorProvider,
    required this.name,
    required this.speciality,
    required this.setFilter
  }) : super(key: key);
  final List<String> nationalities;
  final TutorProvider tutorProvider;
  final String name;
  final String speciality;
  final Function setFilter;


  @override
  State<NationalitiesMenu> createState() => _NationalitiesMenuState();
}

class _NationalitiesMenuState extends State<NationalitiesMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15,bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade200 : Colors.grey.shade800
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  dropdownStyleData: const DropdownStyleData(
                    maxHeight: 200,
                    offset: Offset(0, 0),
                  ),
                  value: widget.nationalities[widget.tutorProvider.nationalityIndex],
                  isExpanded: true,
                  onChanged: (String? value) async {
                    widget.tutorProvider.removeTutorsState();
                    widget.setFilter(
                      widget.name,
                      value
                    );
                    await widget.tutorProvider.searchTutorByName(
                        widget.name,
                        widget.speciality,
                        value!,
                        1,
                        12,
                        true,
                        context
                    );
                  },
                  items: widget.nationalities.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
