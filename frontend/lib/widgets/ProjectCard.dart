import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String pname;
  final String discription;
  final String startDate;
  final String endDate;
  final String status;
  final String leader;
  final bool selected;

  const ProjectCard({
    super.key,
    required this.pname,
    required this.discription,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.leader,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2 - 20; // 2개씩, 간격 고려
    return Container(
      width: cardWidth,
      constraints: BoxConstraints(minHeight: 120),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pname,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            endDate,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            discription,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}