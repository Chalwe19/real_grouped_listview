import 'package:flutter/material.dart';
import 'package:real_grouped_listview/real_grouped_listview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Item {
  int id;
  String name;
  int number;

  Item({required this.id, required this.name, required this.number});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var items = [
    Item(id: 1, name: "Chalwe", number: 4),
    Item(id: 2, name: "Charles", number: 2),
    Item(id: 3, name: "Tommy", number: 6),
    Item(id: 4, name: "Darlh", number: 2),
    Item(id: 5, name: "Kenny", number: 4),
    Item(id: 6, name: "Mike", number: 1),
    Item(id: 7, name: "Riot", number: 3),
    Item(id: 8, name: "Time", number: 7),
    Item(id: 9, name: "Please", number: 1),
    Item(id: 10, name: "Tooly", number: 1),
  ];

  // List<Ugh> ungroupedList = [
  //   Ugh(key: 'A', value: 'apple'),
  //   Ugh(key: 'B', value: 'banana'),
  //   Ugh(key: 'C', value: 'cherry'),
  //   Ugh(key: 'D', value: 'date'),
  //   Ugh(key: 'E', value: 'elderberry'),
  //   Ugh(key: 'F', value: 'fig'),
  //   Ugh(key: 'G', value: 'grape'),
  //   Ugh(key: 'A', value: 'avocado'),
  //   Ugh(key: 'B', value: 'blueberry'),
  //   Ugh(key: 'C', value: 'coconut'),
  //   Ugh(key: 'D', value: 'dragonfruit'),
  //   Ugh(key: 'E', value: 'elderflower'),
  //   Ugh(key: 'F', value: 'fuji apple'),
  //   Ugh(key: 'G', value: 'guava'),
  //   Ugh(key: 'H', value: 'honeydew'),
  // ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('${items.length}'),
      ),
      body: RealGroupedList(
        // itemCount: items.length,
        items: items,
        groupBy: (dynamic item) => item.number,
        order: GroupListOrder.asc,
        headerBuilder: (dynamic header) => Text(
          header.toString(),
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        itemWidget: (dynamic item) => SizedBox(
          height: 100,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(item.id.toString()),
                      Text(item.name),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // itemBuilder: (context, index) {
        //   return SizedBox(
        //     height: 100,
        //     child: Card(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Row(
        //           children: [
        //             Text(items[index].number.toString()),
        //             const SizedBox(width: 10),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Text(items[index].id.toString()),
        //                 Text(items[index].name),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   );
        // },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
