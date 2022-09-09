import 'package:flutter/material.dart';

class DraggableWidgetExample extends StatefulWidget {
  const DraggableWidgetExample({Key? key}) : super(key: key);

  @override
  State<DraggableWidgetExample> createState() => _DraggableWidgetExampleState();
}

class _DraggableWidgetExampleState extends State<DraggableWidgetExample> {
  Color color = Colors.black;
  List items = ['item1', 'item2', 'item3', 'item4', 'item5'];

  @override
  Widget build(BuildContext context) {
    var showDraggable = color == Colors.black;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IgnorePointer(
                    ignoring: !showDraggable,
                    child: Opacity(
                      opacity: showDraggable ? 1 : 0,
                      child: Draggable<Color>(
                        data: Colors.green,
                        feedback: Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                        ),
                        childWhenDragging: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  DragTarget<Color>(
                      onAccept: (data) => setState(() => color = data),
                      builder: (context, _, __) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: color,
                        );
                      }),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!showDraggable) {
                      setState(() {});
                      color = Colors.black;
                    }
                  },
                  child: const Text('Refresh')),
              ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex--;
                    final item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  });
                },
                shrinkWrap: true,
                children: [
                  for (final item in items)
                    ListTile(
                      key: ValueKey(item),
                      title: Text(item),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
