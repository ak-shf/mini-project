import 'package:flutter/material.dart';
import 'package:mini_project/views/calander/model/event.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final Function() onDelete;
  final Function()? onTap;
  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 39, 49, 244),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          title: Text(
            event.title.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            event.date.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          onTap: onTap,
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
