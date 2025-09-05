import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../account/wigets/custom_background.dart';
import 'Widget/smart_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> sliderImages = [
    'assets/image/image1.jpeg',
    'assets/image/image2.png',
    'assets/image/image3.png',
    'assets/image/image4.png',
  ];

  final List<String> categories = [
    'All', 'Practical', 'Syntax', 'Flutter', 'Dart', 'Question', 'Quiz'
  ];

  String selectedCategory = 'All';

  final List<Map<String, String>> boxes = [
    {
      'title': 'Practical',
      'subtitle': 'Hands-on Projects',
      'image': 'assets/icon/practical.png'
    },
    {
      'title': 'Syntax',
      'subtitle': 'Basic Dart Syntax',
      'image': 'assets/icon/syntax.png'
    },
    {
      'title': 'Flutter',
      'subtitle': 'Flutter Framework',
      'image': 'assets/icon/flutter.png'
    },
    {
      'title': 'Dart',
      'subtitle': 'Learn Dart Lang',
      'image': 'assets/icon/dart.png'
    },
    {
      'title': 'Question',
      'subtitle': 'Interview Q&A',
      'image': 'assets/icon/questions.png'
    },
    {
      'title': 'Quiz',
      'subtitle': 'Test Yourself',
      'image': 'assets/icon/quiz.png'
    },
  ];

  final List<Map<String, String>> lectures = [
    {
      'title': 'Dart Introduction',
      'subtitle': 'Getting started with Dart',
      'type': 'Dart'
    },
    {
      'title': 'Flutter Widgets',
      'subtitle': 'Understanding core widgets',
      'type': 'Flutter'
    },
    {
      'title': 'Dart Syntax',
      'subtitle': 'Basic syntax rules',
      'type': 'Syntax'
    },
    {
      'title': 'Flutter Practical',
      'subtitle': 'UI Design & Layouts',
      'type': 'Practical'
    },
    {
      'title': 'Interview Questions',
      'subtitle': 'Most Asked Questions',
      'type': 'Question'
    },
    {
      'title': 'Quiz Challenge',
      'subtitle': 'Test your skills',
      'type': 'Quiz'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredLectures = selectedCategory == 'All'
        ? lectures
        : lectures.where((e) => e['type'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Forge'),

        actions: [
          IconButton(
            icon: const CircleAvatar(child: Icon(Icons.person)),
            onPressed: () {},
          ),
        ],
      ),
      drawer: SmartDrawer(),
      body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search topics...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CarouselSlider(
                  items: sliderImages.map((url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(url, fit: BoxFit.cover, width: double.infinity),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: selectedCategory == cat,
                          onSelected: (val) {
                            setState(() {
                              selectedCategory = cat;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: boxes.length,
                    itemBuilder: (context, index) {
                      final box = boxes[index];
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.only(right: 3),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Image.asset(box['image']!, height: 60, width: 60)),
                                const SizedBox(height: 10),
                                Text(box['title']!, style: const TextStyle(fontWeight: FontWeight.bold,)),
                                Text(box['subtitle']!, style: const TextStyle(color: Colors.grey)),
                                SizedBox(height: 3,),
                                InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedCategory = box['title']!;
                                      });
                                    },
                                    child: Text("Let's Start",style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold
                                    ),)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Lectures', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('View All', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  itemCount: filteredLectures.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final lecture = filteredLectures[index];
                    return Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            'assets/icon/flutter.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(lecture['title']!),
                        subtitle: Text(lecture['subtitle']!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LectureDetailScreen(title: lecture['title']!),
                            ),
                          );
                        },
                      ),
                    );

                  },
                )
              ],
            ),
          ),
        ),


    );
  }
}

class LectureDetailScreen extends StatelessWidget {
  final String title;
  const LectureDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Details for $title', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
