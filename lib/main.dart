import 'package:flutter/material.dart';
//importing all the whatsapp clone tab pages
import 'package:session2/TabPages/CallsPage.dart';
import 'package:session2/TabPages/CameraPage.dart';
import 'package:session2/TabPages/ChatsPage.dart';
import 'package:session2/TabPages/Statuspage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
          primaryColor: Color(0XFF075E54),
          accentColor: Color(0XFF25D366) // green color for whatapp clone theme
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // total tab we are creating is 4 so : length is 4 : initialIndex is set to position 1
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.5,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            // here we are creating 4 Tabs
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(text: "CALLS")
          ],
        ),
        //we need 2 menu icons on app bar : search and more setting
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        //this will work similar to fragment in android app
        controller: _tabController,
        //loading 4 pages in tabs
        children: <Widget>[CameraPage(), ChatsPage(), Statuspage(), CallsPage()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Button Clicked");
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}