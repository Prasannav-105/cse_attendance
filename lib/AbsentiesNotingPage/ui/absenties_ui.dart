import 'package:aamec_cse_attendance_app/AbsentiesNotingPage/helpers/absenties_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarkAbsentiesPage extends StatefulWidget {
  const MarkAbsentiesPage({super.key});

  @override
  State<MarkAbsentiesPage> createState() => _MarkAbsentiesPageState();
}

class _MarkAbsentiesPageState extends State<MarkAbsentiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            " ${AbsentiesHelper.appbarTitleText} ${AbsentiesHelper.absenties.length}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  AbsentiesHelper.titleText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.pink)),
                  child: Wrap(
                    children: AbsentiesHelper.absenties
                        .map((regNo) => Text(
                              "$regNo ,",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(AbsentiesHelper.markAttendanceText,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: AbsentiesHelper.registerNo.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: const Offset(-5, -5),
                        blurRadius: 10)
                  ],
                  color: AbsentiesHelper.status[index]
                      ? Colors.white
                      : const Color.fromARGB(255, 255, 33, 17),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    subtitle: Text(
                      "Status : ${AbsentiesHelper.status[index] ? 'Present' : 'Absent'}",
                      style: TextStyle(
                          color: AbsentiesHelper.status[index]
                              ? Colors.black
                              : const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    title: Text(
                      AbsentiesHelper.registerNo[index],
                      style: TextStyle(
                          color: AbsentiesHelper.status[index]
                              ? Colors.black
                              : const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    trailing: CupertinoSwitch(
                        activeColor: Colors.amber,
                        trackColor: Colors.black.withOpacity(.5),
                        value: AbsentiesHelper.studentCount[index],
                        onChanged: (val) {
                          setState(
                            () {
                              val
                                  ? AbsentiesHelper.absenties.remove(index + 1)
                                  : AbsentiesHelper.absenties
                                          .contains(index + 1)
                                      ? null
                                      : AbsentiesHelper.absenties
                                          .add(index + 1);
                              AbsentiesHelper.studentCount[index] = val;
                            },
                          );

                          val
                              ? AbsentiesHelper.status[index] = true
                              : AbsentiesHelper.status[index] = false;
                        }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
