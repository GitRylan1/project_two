import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
Include:
Enter Number, MC Block selector, Save button, Load button
 */
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _numberController = TextEditingController();
  int _savedNumber = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedNumber();
  }

  void _loadSavedNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedNumber = prefs.getInt('savedNumber') ?? 0;
    });
  }

  void _saveNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int enteredNumber = int.tryParse(_numberController.text) ?? 0;
    prefs.setInt('savedNumber', enteredNumber);
    _loadSavedNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter a Number'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
              onPressed: _saveNumber,
              child: Text('Save Number'),
              ),
            SizedBox(height: 16),
          Text('Saved Number: $_savedNumber'),
        ],
      ),
    );
  }
}
//Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa