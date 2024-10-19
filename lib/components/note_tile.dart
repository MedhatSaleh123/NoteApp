import 'package:flutter/material.dart';
import 'package:noteapp/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile(
      {required this.text,
      required this.onEditPressed,
      required this.onDeletePressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(top: 10, left: 25, right: 25),
        child: ListTile(
          title: Text(text),
          trailing: Builder(builder: (context) {
            return IconButton(
              onPressed: () => showPopover(
                width: 130,
                height: 130,
                backgroundColor: Theme.of(context).colorScheme.background,
                context: context,
                bodyBuilder: (context) => NoteSettings(
                  onEditTap: onEditPressed,
                  onDeleteTap: onDeletePressed,
                ),
              ),
              icon: Icon(Icons.more_vert),
            );
          }),
        ));
  }
}
