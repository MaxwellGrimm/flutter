import 'package:flutter/material.dart';
import 'ClaunsModel.dart';
import 'CrosswordCluans.dart';
import 'AddClaunWidget.dart';
import 'Clauns.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (context) => ClaunsModel(),
//       child: MaterialApp(title: 'Clauns', home: MyApp())));
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> tabViews = const [CrosswordClauns(), AddClaunWidget()];

  void _handleTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return ClaunsModel();
        },
        child: MaterialApp(
          home: DefaultTabController(
              length: 2,
              child: Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                      currentIndex: selectedIndex,
                      showUnselectedLabels: true,
                      selectedItemColor: Colors.blue,
                      unselectedItemColor: Colors.black,
                      backgroundColor: Colors.white,
                      onTap: _handleTap,
                      items: const [
                        BottomNavigationBarItem(
                            label: 'List', icon: Icon(Icons.list_rounded)),
                        BottomNavigationBarItem(
                            label: 'Add', icon: Icon(Icons.add))
                      ]),
                  appBar: AppBar(
                    title: const Text('Clauns'),
                  ),
                  body: tabViews[selectedIndex])),
        ));
  }
}
