import 'package:flutter/material.dart';
import 'package:time_tracker/app/home/cupertino_home_scaffold.dart';
import 'package:time_tracker/app/home/tab_item.dart';

import 'jobs/jobs_page.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;
  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.jobs: (_) => JobsPage(),
      TabItem.entries: (_) => Container(),
      TabItem.account: (_) => Container(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
