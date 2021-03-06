import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/Datebase/Models/Todo.dart';
import 'package:to_do_list_route/providers/AppConfigProvider.dart';
import 'package:to_do_list_route/providers/ListPovider.dart';

class TodoItem extends StatelessWidget {
  final Todo item;

  TodoItem(this.item);

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of(context);
    AppConfigProvider provider = Provider.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xFFFE4A49),
      ),
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .25,
            // actionExtentRatio: 0.25,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (context) {
                  listProvider.deleteUser(item.id);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                color: provider.mode == ThemeMode.light
                    ? Colors.white
                    : Color.fromARGB(255, 20, 25, 34)),
            child: Row(
              children: [
                Container(
                  width: 2,
                  height: 62,
                  color: Colors.blue,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20),
                      ),
                      Text(item.description,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 20))
                    ],
                  ),
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor),
                  child: Image.asset('assets/images/ic_check.png'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
