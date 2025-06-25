import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String dday;
  final String title;
  final String subtitle;
  final bool selected;

  const TodoCard({
    super.key,
    required this.dday,
    required this.title,
    required this.subtitle,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: selected ? Color(0xFF7B6CFF) : Colors.grey.shade200, width: 2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: selected ? Color(0xFF7B6CFF) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(dday, style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}