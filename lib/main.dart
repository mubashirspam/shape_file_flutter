import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:shapefile/chat_isar_repo.dart';
import 'package:shapefile/shape.dart';

import 'package:path_provider/path_provider.dart';

import 'model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    Future<Directory?>? dir;
    dir = getApplicationSupportDirectory();
    final Directory? directory = await dir;
    await Isar.open(
      name: 'db',
      [IsarModelSchema],
      directory: '${directory?.path}',
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  ValueNotifier<int> progressNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
 
    super.initState();
    init();
  }

  void init() async {
    try {
      setState(() => isLoading = true);
      await    IsarRepo.instance.postData(indianStatesList);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: isLoading
            ? ValueListenableBuilder<int>(
                valueListenable: progressNotifier,
                builder: (context, value, child) {
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(value: value / 100),
                          SizedBox(height: 20),
                          Text(' map loading $value%'),
                        ],
                      ),
                    ),
                  );
                },
              )
            : MapScreen());
  }
}
