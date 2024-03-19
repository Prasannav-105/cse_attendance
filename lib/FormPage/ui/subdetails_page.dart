import 'package:aamec_cse_attendance_app/AbsentiesNotingPage/ui/absenties_ui.dart';
import 'package:aamec_cse_attendance_app/shared/common_shared_components.dart';

import 'package:flutter/material.dart';

class EnterDetailsPage extends StatefulWidget {
  const EnterDetailsPage({super.key});

  @override
  State<EnterDetailsPage> createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  late TextEditingController _subCodeController;
  late TextEditingController _staffNameController;
  @override
  void initState() {
    super.initState();
    _subCodeController = TextEditingController();
    _staffNameController = TextEditingController();
  }

  List<int> periods = List.generate(8, (index) => index + 1);
  int selectedPeriod = 1;
  List<int> years = List.generate(3, (index) => index + 2);
  int selectedyear = 2;
  List<String> sections = ['A', 'B'];
  String selectedSection = 'A';

  @override
  void dispose() {
    _subCodeController.dispose();
    _staffNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(years);
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Your Details"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidgets.textField(
            hintText: 'Enter Subject Code ',
            controller: _subCodeController,
          ),
          CommonWidgets.textField(
            hintText: 'Enter Staff Name ',
            controller: _staffNameController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select period : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 15, 5, 75)),
                child: Center(
                  child: DropdownButton(
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      value: selectedPeriod,
                      items: periods
                          .map(
                            (period) => DropdownMenuItem(
                              value: period,
                              child: Text(
                                period.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedPeriod = val!;
                        });
                      }),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select year : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 15, 5, 75)),
                child: Center(
                  child: DropdownButton(
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      value: selectedyear,
                      items: years
                          .map(
                            (year) => DropdownMenuItem(
                              value: year,
                              child: Text(
                                year.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedyear = val!;
                        });
                      }),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Section : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 15, 5, 75)),
                child: Center(
                  child: DropdownButton(
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      value: selectedSection,
                      items: sections
                          .map(
                            (section) => DropdownMenuItem(
                              value: section,
                              child: Text(
                                section.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedSection = val!;
                        });
                      }),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CommonWidgets.customizedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarkAbsentiesPage(Section: selectedSection,),
                    ));
              },
              text: 'Submit')
        ],
      ),
    );
  }
}
