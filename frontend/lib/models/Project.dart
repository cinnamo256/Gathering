class Project {
  final int id;
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final String status;
  final String teamLeaderName;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.teamLeaderName,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      teamLeaderName: json['teamLeaderName'],
    );
  }
}