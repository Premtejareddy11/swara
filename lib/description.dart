import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:readmore/readmore.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

late PageController? _pageController;
late int selectedPage;
List<AssetImage> itemImages = [
  const AssetImage("assets/images/meetUp1.jpg"),
  const AssetImage("assets/images/meetUp2.jpg"),
  const AssetImage("assets/images/meetUp3.jpg"),
];

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Description"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 203, 198, 198)),
                height: height * 0.5,
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.42,
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
                                child: SizedBox(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image(
                                      image: itemImages[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 20,
                            child: PageViewDotIndicator(
                              currentItem: selectedPage,
                              count: itemImages.length,
                              unselectedColor: Colors.white,
                              selectedColor: Colors.blue,
                              boxShape: BoxShape.circle,
                              onItemClicked: (index) {
                                _pageController!.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.save_alt_outlined,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.save_outlined,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.favorite_outline,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.fullscreen_outlined,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.star_border_outlined,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(
                            Icons.share_outlined,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  const Icon(Icons.save_outlined),
                  Text(
                    "1077",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  const Icon(Icons.favorite_outline),
                  Text(
                    "1077",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    height: height * 0.03,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 220, 220),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: RatingBarIndicator(
                        rating: 3.2,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 66, 213, 213),
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                        unratedColor: Colors.white,
                        direction: Axis.horizontal,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "3.2",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Actor Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "Indian Actress",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  // Icon(Icons.punch_clock_outlined),
                  const Icon(IconData(0xe03a, fontFamily: 'MaterialIcons')),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Duration 20 Mins",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_outlined),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Total Average Fees \u{20B9} 9,999",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "About",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const ReadMoreText(
                'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
                trimLines: 2,
                preDataText: "AMANDA",
                preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                style: TextStyle(color: Colors.black),
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
