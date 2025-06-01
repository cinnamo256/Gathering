import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 상단 환영 메시지 영역
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
                _todoCard('D-5', 'IA 설계', 'UXUI 디자인', true),
                SizedBox(width: 12),
                _todoCard('D-12', '기획 PT 준비', '졸업작품스튜디오 !', false),
                SizedBox(width: 12),
                _todoCard('D-12', '기획 PT', '졸업작품스튜디오', false),
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
              _navItem(Icons.home, '홈', 0),
              _navItem(Icons.people, '알림', 1),
              SizedBox(width: 40), // FAB 공간
              _navItem(Icons.calendar_today, '일정', 2),
              _navItem(Icons.person, '마이페이지', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _todoCard(String dday, String title, String subtitle, bool selected) {
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
        mainAxisSize: MainAxisSize.min, // overflow 방지
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

  Widget _navItem(IconData icon, String label, int index) {
    final selected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: selected ? Color(0xFF7B6CFF) : Colors.grey),
          Text(label, style: TextStyle(color: selected ? Color(0xFF7B6CFF) : Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
