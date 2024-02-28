import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      _currentPageIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              OnboardingPage(
                image: 'assets/image1.png',
                title: 'Welcome to MyApp',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              OnboardingPage(
                image: 'assets/image2.png',
                title: 'Discover Amazing Features',
                description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              OnboardingPage(
                image: 'assets/image3.png',
                title: 'Get Started Now',
                description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                isLastPage: true,
              ),
            ],
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: Row(
              children: List.generate(
                3,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: _currentPageIndex == index ? 20.0 : 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: _currentPageIndex == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool isLastPage;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                // Handle button press for last page
              },
              child: const Text('Get Started'),
            ),
        ],
      ),
    );
  }
}