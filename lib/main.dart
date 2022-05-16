import 'package:f3_intro/image_samples.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseCrashlytics.instance.setCustomKey('user', '123');
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.light().copyWith(useMaterial3: true),
      home: const ImageSamplesView(),
    );
  }
}

class _MaterialView extends StatelessWidget {
  const _MaterialView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Test1'),
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Test2'),
      ]),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const Text('Hello World'),
              const Chip(label: Text('data')),
              ActionChip(label: const Text('m3'), onPressed: () {}),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (context) => const Text('a'));
                },
                child: const Text('ok'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
