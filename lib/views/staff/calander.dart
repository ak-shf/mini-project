import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class MyCalander extends StatefulWidget {
  const MyCalander({super.key});

  @override
  State<MyCalander> createState() => _MyCalanderState();
}

class _MyCalanderState extends State<MyCalander> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _descontroller = TextEditingController();
  Map<String, List> mySelectedEvent = {};
  CalendarFormat format = CalendarFormat.month;
  
  DateTime today = DateTime.now();
  DateTime selecteDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  List _listofMethod(DateTime dateTime) {
    if (mySelectedEvent[DateFormat('yyyy-mm-dd').format(dateTime)] != null) {
      return mySelectedEvent[DateFormat('yyyy-mm-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  showAddEvent() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'Add Event',
                textAlign: TextAlign.center,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titlecontroller,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        labelText: 'event',
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descontroller,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                        labelText: 'descreption',
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                    child: const Text('cancel')),
                TextButton(
                    onPressed: () {
                      if (_descontroller.text.isEmpty &&
                          _titlecontroller.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('required descreption and title'),
                          duration: Duration(seconds: 2),
                        ));
                        return;
                      } else {
                        // print(_titlecontroller.text);
                        // print(_descontroller.text);
                        if (mySelectedEvent[
                                DateFormat('yyyy-mm-dd').format(today)] !=
                            null) {
                          mySelectedEvent[
                                  DateFormat('yyyy-mm-dd').format(today)]
                              ?.add({
                            "eventTitle": _titlecontroller.text,
                            "eventDescp": _descontroller.text
                          });
                        } else {
                          mySelectedEvent[
                              DateFormat('yyyy-mm-dd').format(today)] = [
                            {
                              "eventTitle": _titlecontroller.text,
                              "eventDescp": _descontroller.text
                            }
                          ];
                        }
                        _descontroller.clear();
                        _titlecontroller.clear();
                        Navigator.pop(context);
                        return;
                      }
                    },
                    child: const Text('Add'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: (Column(
          children: [
            TableCalendar(
              eventLoader: _listofMethod,
              
              selectedDayPredicate: (day) => isSameDay(day, today),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusedDay,
              onDaySelected: _onDaySelected,
              calendarFormat: format,
              onFormatChanged: (CalendarFormat format) {
                setState(() {
                  format = format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle:
                    TextStyle(color: Color.fromARGB(255, 203, 18, 18)),
                todayDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 85, 111, 227),
                  shape: BoxShape.circle,
                ),
                weekendDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 219, 215, 220),
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    color: const Color.fromARGB(255, 219, 215, 220),
                  ),
                  formatButtonTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 110, 109, 109))),
            ),
            ..._listofMethod(today).map((myEvents) => ListTile(
                  leading: const Icon(Icons.abc),
                  title: Text('event:${myEvents['eventTitle']}'),
                  subtitle: Text('event:${myEvents['eventDescp']}'),
                ))
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showAddEvent(), label: const Text('Add Event')),
    );
  }
}
