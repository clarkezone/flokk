import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msgraph/msgraph.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MSGraph tester'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String currentToken = "";

  //Azure AAD
  //This does work
  static final Config configAzureADMS = new Config(
    ReplaceWithtenanID, //tenantID
    ReplaceWithClientID, //client ID
    "openid profile offline_access user.read people.read", //scope
    "https://login.microsoftonline.com/common/oauth2/nativeclient", //callbackURL
  );

  final AadOAuth oauth = new AadOAuth(configAzureADMS);
  String _counter = "";

  // Windows only
  MethodChannel channel;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    if(Platform.isWindows)
    {
      initNotSoSecureStorageOnWindows();
    }
  }

  void initNotSoSecureStorageOnWindows() async {
    channel = new MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
    prefs = await SharedPreferences.getInstance();

    channel.setMockMethodCallHandler((MethodCall call) async {
      switch(call.method) {
        case 'write': {
          await prefs.setString(call.arguments['key'] as String, call.arguments['value'] as String);
          return null;
        }
        break;
        case 'read': {
          return prefs.getString(call.arguments['key'] as String);
        }
        break;
        case 'delete': {
          await prefs.setString(call.arguments['key'] as String, null);
          return null;
        }
        break;
      }
    });
  }

  Future _getMe() async {
    if (currentToken == "") {
      showMessage("Please log in.");
      return;
    }
    var msGraph = MsGraph(currentToken);
    var me = await msGraph.me.get(); //get me

    _setResult(String.fromCharCodes(me));
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = new AlertDialog(content: new Text(text), actions: <Widget>[
      new FlatButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login() async {
    try {
      await oauth.login();
      currentToken = await oauth.getAccessToken();
      showMessage("Logged in successfully, your access token: $currentToken");
    } catch (e) {
      showError(e);
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage("Logged out");
  }

  void _setResult(String result) {
    setState(() {
      _counter = result;
    });
  }

  void _incrementCounter() async {
    await _getMe();
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Graph result:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          RaisedButton(
            onPressed: login,
            child: Text("AAD Sign in"),
          ),
          RaisedButton(
            onPressed: logout,
            child: Text("AAD Sign out"),
          ),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text("Get Me from graph"),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
