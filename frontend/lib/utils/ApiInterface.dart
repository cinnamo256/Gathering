import 'package:frontend/models/Project.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Project>> fetchProjects() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8080/api/projects'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    print(data);
    return data.map((json) => Project.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch API');
  }
}

Future<void> createProject({
  required String pname,
  required String description,
  required String startDate,
  required String endDate,
}) async {
  final int leader = 10000;
  final String status = "ONGOING";
  final url = Uri.parse('http://127.0.0.1:8080/api/projects');
  final body = jsonEncode({
    "name": pname,
    "description": description,
    "startDate": startDate,
    "endDate": endDate,
    "status": status,
    "teamLeaderId": leader,
  });

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json"
    },
    body: body,
  );

  if (response.statusCode == 201) {
    
  } else {

  }
}