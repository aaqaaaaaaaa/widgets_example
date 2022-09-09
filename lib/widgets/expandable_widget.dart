import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({Key? key}) : super(key: key);

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Widget'),
      ),
      body: ListView(
        children: [
          buildCard(
            'Expandable1',
            Container(width: 390, height: 250, child: const Placeholder()),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, Widget child) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              child,
              ScrollOnExpand(
                child: ExpandablePanel(
                    header: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    collapsed: const Text(
                      'Lorem Ipsum',
                      style: TextStyle(fontSize: 18),
                    ),
                    expanded: Text(
                      List.generate(500, (index) => 'Lorem Ipsum').join('\n\n'),
                      style: const TextStyle(fontSize: 12),
                    ),
                    builder: (_, collapsed, expanded) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Expandable(
                            expanded: expanded,
                            collapsed: collapsed,
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
