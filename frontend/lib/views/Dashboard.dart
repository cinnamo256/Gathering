import 'package:flutter/material.dart';
import 'package:frontend/models/Project.dart';
import 'package:frontend/utils/ApiInterface.dart';
import 'package:frontend/widgets/TodoCard.dart';
import 'package:frontend/widgets/NavItem.dart';
import 'package:frontend/widgets/ProjectCard.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget{
  final String title;
  final List<Project> projects;

  const Dashboard({super.key, required this.title, required this.projects});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  late List<Project> projects;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    projects = widget.projects;
  }

  Future<void> refreshProjects() async {
    final newProjects = await fetchProjects();
    setState(() {
      projects = newProjects;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formattedDate = DateFormat('M/d (E)', 'ko').format(today);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 상단 보라색 영역 (스크롤/새로고침 X)
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
                  formattedDate,
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                ),
                const SizedBox(height: 8),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '미쿠 님,\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                      TextSpan(text: '허리피세요\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
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
          // 하단 흰색 영역 (스크롤/새로고침 O)
          Expanded(
            child: RefreshIndicator(
              onRefresh: refreshProjects,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    // 프로젝트 카드 리스트
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Row(
                        children: const [
                          Text('내 프로젝트', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.3,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: projects.map((project) => ProjectCard(
                        pname: project.name,
                        discription: project.description,
                        startDate: project.startDate,
                        endDate: project.endDate,
                        status: project.status,
                        leader: project.teamLeaderName,
                        selected: false,
                      )).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: FloatingActionButton(
          onPressed: () {
            String pname = '';
            String description = '';
            DateTime? startDate;
            DateTime? endDate;

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setModalState) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 24, right: 24, top: 24
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('프로젝트 생성', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(labelText: '프로젝트명'),
                            onChanged: (v) => pname = v,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: '설명'),
                            onChanged: (v) => description = v,
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) setModalState(() => startDate = picked);
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: '시작일',
                                  hintText: startDate != null ? startDate!.toString().split(' ')[0] : '날짜 선택',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: startDate ?? DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) setModalState(() => endDate = picked);
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: '종료일',
                                  hintText: endDate != null ? endDate!.toString().split(' ')[0] : '날짜 선택',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () async {
                              if (pname.isEmpty || description.isEmpty || startDate == null || endDate == null) return;
                              await createProject(
                                pname: pname,
                                description: description,
                                startDate: startDate!.toString().split(' ')[0],
                                endDate: endDate!.toString().split(' ')[0],
                              );
                              Navigator.pop(context);
                              await refreshProjects(); // 필요시 프로젝트 목록 새로고침
                            },
                            child: Text('생성하기'),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Color(0xFF7B6CFF),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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