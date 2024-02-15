// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:swara_ui/description.dart';
// import 'package:swara_ui/home_page.dart';

// class NavigatorBottom extends StatefulWidget {
//   const NavigatorBottom({super.key});

//   @override
//   State<NavigatorBottom> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<NavigatorBottom> {
//   List pages = const [
//     MeetUpHomePage(),
//     DescriptionPage(),
//     MeetUpHomePage(),
//     MeetUpHomePage(),
//     MeetUpHomePage(),
//   ];
//   int currentIndex = 0;
//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         showUnselectedLabels: false,
//         showSelectedLabels: true,
//         onTap: onTap,
//         currentIndex: currentIndex,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_outlined,
//               color: Colors.grey,
//             ),
//             tooltip: "Home",
//             backgroundColor: Colors.white,
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.propane_outlined,
//               color: Colors.grey,
//             ),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.manage_accounts,
//               color: Colors.grey,
//             ),
//             label: 'Manage Account',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.manage_accounts,
//               color: Colors.grey,
//             ),
//             label: 'Manage Account',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.manage_accounts,
//               color: Colors.grey,
//             ),
//             label: 'Manage Account',
//           ),
//         ],
//       ),
//       body: pages[currentIndex],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:swara_ui/description.dart';
import 'package:swara_ui/home_page.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({Key? key}) : super(key: key);

  @override
  State<NavigatorBottom> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigatorBottom> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = 2;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  List<Widget> pages = [
    const MeetUpHomePage(),
    const DescriptionPage(),
    const MeetUpHomePage(),
    const MeetUpHomePage(),
    const MeetUpHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        onTap: onTap,
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            tooltip: "Home",
            backgroundColor: Colors.white,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.grey,
            ),
            label: 'Manage Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.grey,
            ),
            label: 'Manage Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.grey,
            ),
            label: 'Manage Account',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
    );
  }
}
