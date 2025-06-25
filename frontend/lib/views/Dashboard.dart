import 'package:flutter/material.dart';
import 'package:frontend/widgets/TodoCard.dart';
import 'package:frontend/widgets/NavItem.dart';

class Dashboard extends StatefulWidget{
  final String title;

  const Dashboard({super.key, required this.title});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF7B6CFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image.asset(
                    //   'assets/gather_logo.png',
                    //   height: 32,
                    // ),
                    Icon(Icons.settings, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  '5/24 일',
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                ),
                const SizedBox(height: 8),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '이재민 님,\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                      TextSpan(text: '졸업작품스튜디오!\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
                const Text(
                  '프로젝트 관련 확인하세요!',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF7B6CFF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('바로가기'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                    SizedBox(width: 4),
                    Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), shape: BoxShape.circle)),
                    SizedBox(width: 4),
                    Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), shape: BoxShape.circle)),
                  ],
                ),
              ],
            ),
          ),
          // 오늘의 할일
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: const [
                Text('오늘의 할일', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
          // 할일 카드 리스트
          SizedBox(
            height: 120, // 기존 100에서 120으로 높이 증가
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                TodoCard(
                  dday: 'D-5',
                  title: 'IA 설계',
                  subtitle: 'UXUI 디자인',
                  selected: true
                  ),
                SizedBox(width: 12),
                TodoCard(
                  dday: 'D-12',
                  title: '기획 PT 준비',
                  subtitle: '졸업작품스튜디오 !',
                  selected: false
                  ),
                SizedBox(width: 12),
                TodoCard(
                  dday: 'D-12',
                  title: '기획 PT',
                  subtitle: '졸업작품스튜디오',
                  selected: false
                  ),
              ],
            ),
          ),
          // ...아래 여백...
          Expanded(child: Container()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF7B6CFF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(icon: Icons.home, label: '홈', index: 0, selected: selectedIndex == 0, onTap: () => onItemTapped(0)),
              NavItem(icon: Icons.people, label: '알림', index: 1, selected: selectedIndex == 0, onTap: () => onItemTapped(1)),
              SizedBox(width: 40),
              NavItem(icon: Icons.calendar_today, label: '일정', index: 2, selected: selectedIndex == 0, onTap: () => onItemTapped(2)),
              NavItem(icon: Icons.person, label: '마이페이지', index: 3, selected: selectedIndex == 0, onTap: () => onItemTapped(3)),
            ],
          ),
        ),
      ),
    );
  }
}