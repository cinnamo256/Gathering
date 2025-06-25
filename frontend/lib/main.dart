import 'package:flutter/material.dart';
import 'package:frontend/models/Project.dart';
import 'package:frontend/utils/ApiInterface.dart';
import 'package:frontend/views/Dashboard.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gather',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder<List<Project>>(
        future: fetchProjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러(${snapshot.error})가 발생하였습니다.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('프로젝트가 없습니다.'));
          } else {
            return Dashboard(title: 'Dashboard', projects: snapshot.data!);
          }
        },
      ),
    );
  }
}