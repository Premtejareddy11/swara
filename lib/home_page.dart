// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import "package:page_view_dot_indicator/page_view_dot_indicator.dart";

// class MeetUpHomePage extends StatefulWidget {
//   const MeetUpHomePage({super.key});

//   @override
//   State<MeetUpHomePage> createState() => _MeetUpHomePageState();
// }

// late final PageController _pageController;

// late int selectedPage;
// List<AssetImage> itemImages = [
//   const AssetImage("assets/images/meetUp1.jpg"),
//   const AssetImage("assets/images/meetUp2.jpg"),
//   const AssetImage("assets/images/meetUp3.jpg"),
// ];

// List<Map<String, dynamic>> trendingList = [{}];

// class _MeetUpHomePageState extends State<MeetUpHomePage> {
//   @override
//   void initState() {
//     selectedPage = 0;
//     _pageController = PageController(initialPage: selectedPage);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Indivial Meetup'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 width: width,
//                 height: height * 0.07,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Icon(
//                         semanticLabel: "Mic",
//                         Icons.search,
//                         size: height * 0.05,
//                       ),
//                       Expanded(
//                         child: Text(
//                           "Search",
//                           style: Theme.of(context).textTheme.displayMedium,
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.mic, size: height * 0.04),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.03,
//               ),
//               SizedBox(
//                 height: height * 0.25,
//                 width: width,
//                 child: Stack(
//                   children: [
//                     PageView.builder(
//                       controller: _pageController,
//                       onPageChanged: (page) {
//                         setState(() {
//                           selectedPage = page;
//                         });
//                       },
//                       itemCount: itemImages.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image(
//                               image: itemImages[index],
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     Positioned(
//                       left: width * 0.1,
//                       bottom: height * 0.03,
//                       child: Text(
//                         "Popular Meetups\nin India",
//                         style: GoogleFonts.openSans(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               PageViewDotIndicator(
//                 currentItem: selectedPage,
//                 count: 3,
//                 unselectedColor: Colors.black26,
//                 selectedColor: Colors.blue,
//                 boxShape: BoxShape.circle,
//                 onItemClicked: (index) {
//                   _pageController.animateToPage(
//                     index,
//                     duration: const Duration(milliseconds: 200),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: height * 0.03,
//               ),
//               Text(
//                 "Trending Popular People",
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               SizedBox(
//                 height: height * 0.25,
//                 width: width,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemExtent: width * 0.75,
//                   itemCount: itemImages.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 16.0),
//                       child: Container(
//                         height: height * 0.25,
//                         width: width * 0.75,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 dense: true,
//                                 leading: CircleAvatar(
//                                   backgroundColor: Colors.white,
//                                   child: SizedBox(
//                                     height: height * 0.15,
//                                     width: width * 0.18,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(120),
//                                       child: Image(
//                                         image: itemImages[index],
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   "Author",
//                                   style:
//                                       Theme.of(context).textTheme.titleMedium,
//                                 ),
//                                 subtitle: const Text("1028 Meetups"),
//                               ),
//                               const Divider(
//                                 thickness: 2,
//                               ),
//                               SizedBox(
//                                 height: height * 0.1,
//                                 width: width * 0.24,
//                                 child: Stack(
//                                   alignment: Alignment.topLeft,
//                                   children: List.generate(
//                                     1,
//                                     (index) => Positioned(
//                                       right: index * 0.15 * width,
//                                       left: 0,
//                                       bottom: 0,
//                                       top: 0,
//                                       child: SizedBox(
//                                         height: height * 0.1,
//                                         width: width * 0.2,
//                                         child: CircleAvatar(
//                                           radius: height * 0.02,
//                                           backgroundColor: Colors.white,
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(120),
//                                             child: Image(
//                                               image: itemImages[index],
//                                               fit: BoxFit.fill,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:page_view_dot_indicator/page_view_dot_indicator.dart";
import 'package:swara_ui/description.dart';

class MeetUpHomePage extends StatefulWidget {
  const MeetUpHomePage({Key? key}) : super(key: key);

  @override
  State<MeetUpHomePage> createState() => _MeetUpHomePageState();
}

class _MeetUpHomePageState extends State<MeetUpHomePage> {
  late final PageController _pageController;
  late int selectedPage;
  List<AssetImage> itemImages = [
    const AssetImage("assets/images/meetUp1.jpg"),
    const AssetImage("assets/images/meetUp2.jpg"),
    const AssetImage("assets/images/meetUp3.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
  }

  List<String> countNumbers = ["01", "02", "03", "04", "05"];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
        ),
        title: const Text('Indivial Meetup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: width,
                height: height * 0.07,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: height * 0.05,
                      ),
                      Expanded(
                        child: Text(
                          "Search",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.mic, size: height * 0.04),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              // Popular Meetups
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          selectedPage = page;
                        });
                      },
                      itemCount: itemImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image(
                              image: itemImages[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: width * 0.1,
                      bottom: height * 0.03,
                      child: Text(
                        "Popular Meetups\nin India",
                        style: GoogleFonts.openSans(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // PageViewDotIndicator
              PageViewDotIndicator(
                currentItem: selectedPage,
                count: itemImages.length,
                unselectedColor: Colors.black26,
                selectedColor: Colors.blue,
                boxShape: BoxShape.circle,
                onItemClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              SizedBox(height: height * 0.03),
              // Trending Popular People
              Text(
                "Trending Popular People",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * 0.02),
              // Trending People ListView
              SizedBox(
                height: height * 0.3,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemExtent: width * 0.75,
                  itemCount: itemImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        height: height * 0.25,
                        width: width * 0.75,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                dense: true,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: SizedBox(
                                    height: height * 0.15,
                                    width: width * 0.18,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image(
                                        image: itemImages[index],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Author",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                subtitle: const Text("1028 Meetups"),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: height * 0.1,
                                width: width,
                                child: Stack(
                                  children: List.generate(
                                    itemImages.length,
                                    (index) => Positioned(
                                      right: index * 0.2 * width,
                                      left: 0,
                                      child: SizedBox(
                                        height: height * 0.1,
                                        width: width * 0.2,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: SizedBox(
                                            height: height * 0.15,
                                            width: width * 0.22,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(120),
                                              child: Image(
                                                image: itemImages[index],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("See more")),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.03),

              Text(
                "Top Trending Meetups",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.3,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  // itemExtent: 0.7,
                  itemCount: countNumbers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DescriptionPage(),
                              ));
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: SizedBox(
                                width: width * 0.5,
                                height: height,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/meetUp1.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.1,
                                width: width * 0.2,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  countNumbers[index],
                                  style: const TextStyle(fontSize: 40),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
