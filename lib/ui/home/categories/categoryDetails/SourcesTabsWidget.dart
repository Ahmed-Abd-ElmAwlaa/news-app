import 'package:flutter/material.dart';
import '../../../../model/sourcesResponse/Source.dart';
import '../../news/NewsListWidget.dart';
import 'TabWidget.dart';

class SourcesTabsWidget extends StatefulWidget {
  List<Source> sources;
  SourcesTabsWidget(this.sources, {super.key});

  @override
  State<SourcesTabsWidget> createState() => _SourcesTabsWidgetState();
}

class _SourcesTabsWidgetState extends State<SourcesTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            const SizedBox(height: 12),
            TabBar(
              indicatorColor:Colors.transparent ,
              onTap: (newIndex){
                selectedIndex = newIndex;
                setState(() {

                });
              },
                isScrollable: true,
                tabs: widget.sources.map((source) =>
                    TabWidget(source,
                        widget.sources.indexOf(source)
                            == selectedIndex
                    ),
                ).toList(),
            ),
            const SizedBox(height: 12),
            Expanded(child:
            NewsListWidget(widget.sources[selectedIndex]
            ),
            )
          ],
        ),
    );
  }
}
