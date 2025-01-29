import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_name_widget.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourceList;

  SourceTabWidget({required this.sourceList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).indicatorColor,
              dividerColor: AppColors.transParentColor,
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
                tabs: widget.sourceList.map((source){
                  return SourceNameWidget(source: source,
                      isSelected: selectedIndex == widget.sourceList.indexOf(source));
                }).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        )
    );
  }
}
