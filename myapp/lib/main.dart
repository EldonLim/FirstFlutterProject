import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('Guide'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('Learn'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('Plans'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'background.png', // Replace 'background_image.jpg' with your image file
            fit: BoxFit.cover,
          ),
          // Centered Column for Text and Button
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bigger Text on Top Left
                const SizedBox(height: 50),
                Center(
                  child: const Padding(
                    padding: EdgeInsets.all(86.0),
                    child: Text(
                      'ZERO to ONE',
                      style: TextStyle(
                        fontSize: 110.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Text Widget
                const SizedBox(height: 20),
                const Center(
                    child: Text(
                  'What stage are you at in your Startup Journey?',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
                const SizedBox(
                    height: 20), // Adjust the spacing between text and button
                // Button Widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Your Card-shaped Buttons
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CardButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home2()),
                          );
                        },
                        height: 150.0,
                        width: 200.0,
                        buttonText: 'I want to start',
                      ),
                    ),
                    const SizedBox(
                        width: 20), // Adjust the spacing between buttons
                    // Your Card-shaped Buttons
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CardButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LearnPage()),
                          );
                        },
                        height: 150.0,
                        width: 200.0,
                        buttonText: 'I want to learn',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double height;
  final double width;

  const CardButton({
    required this.onPressed,
    required this.buttonText,
    this.height = 60.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(64.0),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 40.0,
              color: Color.fromARGB(184, 36, 120, 230),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final String previousText;
  final String nextText;
  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;

  CustomBottomNavigationBar({
    required this.previousText,
    required this.nextText,
    required this.onPreviousPressed,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: onPreviousPressed,
              child: Container(
                height: kBottomNavigationBarHeight,
                color: Color.fromARGB(255, 25, 144, 159),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 8), // Adjust spacing as needed
                    Text(
                      previousText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onNextPressed,
              child: Container(
                height: kBottomNavigationBarHeight,
                color: Color.fromARGB(255, 25, 144, 159),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      nextText,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 8), // Adjust spacing as needed
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 212, 22, 22)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            // Background Image
            Image.asset(
              'Ideation.png', // Replace 'Ideation.png' with your image file
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            // Centered Column for Text and Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'IDEATION',
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Center(
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Congratulations on starting this exciting journey. Let's work together to generate \n      great ideas and shape the future. Ready to dive in? Let's get started! 🚀",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Your Big Rectangular Section
                    Container(
                      height: 400.0,
                      width: 1500.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 700.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Learn On-The-Go!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Ideation:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const Text(
                                'This is the "Eureka!" moment, where entrepreneurs dive into the depths of creativity to unearth innovative ideas. Its akin to a journey through a maze of possibilities, where every twist and turn leads to a potential solution to a problem or a new opportunity. This stage is all about dreaming big, brainstorming relentlessly, and daring to imagine what could be.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const Text(
                                "Exploring possibilities, brainstorming relentlessly, and daring to imagine.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 16.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Learn from these Govt. courses \n',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          "→ Essentials of Starting Business (ACRA)\n",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "https://elearn.acra.gov.sg/acra/AAEnrolment/PublicCoursewareListings.aspx";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            print("URL can't be launched.");
                                          }
                                        },
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          "→ Design Thinking (MySkillsFuture)",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "https://www.myskillsfuture.gov.sg/content/portal/en/training-exchange/course-directory/course-detail.html?courseReferenceNumber=TGS-2020501678";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            print("URL can't be launched.");
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              // Add more paragraphs as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Column for Rectangular Sections at the bottom
                    const SizedBox(height: 20),
                    // First Row of Rectangular Sections
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RectangularSection(
                              text: 'Explore Emerging Industry Trends',
                              image: '1.png',
                              string1: 'Infographic by StartupSG',
                              link1: 'https://www.startupsg.gov.sg/resources',
                              string2: 'Infographic by Singstat',
                              link2:
                                  'https://www.singstat.gov.sg/modules/infographics/singapore-corporate-sector',
                            ),
                            RectangularSection(
                              text: 'Explore the latest Startup News',
                              image: '2.png',
                              string1: 'StartupSG',
                              link1: 'https://www.startupsg.gov.sg/news',
                              string2: 'Business Updates (GoBusiness)',
                              link2:
                                  'https://www.gobusiness.gov.sg/news-and-updates/news/', // Path to the image for Section 2
                            ),
                            RectangularSection(
                              text: 'Snapshot of Future industries',
                              image: '3.png',
                              string1: 'Future Industry Transformation Plans',
                              link1:
                                  'https://www.wsg.gov.sg/home/employers-industry-partners/jobs-transformation-maps',
                              string2: 'Future Improvement Challenges (URA SG)',
                              link2:
                                  'https://www.ura.gov.sg/Corporate/Get-Involved/Plan-Our-Future-SG',
                              // Path to the image for Section 3
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RectangularSection(
                              text: 'Success Stories!',
                              image: '4.png',
                              string1: 'Government Backed Startups',
                              link1:
                                  'https://www.openinnovationnetwork.gov.sg/success-stories/success-stories',
                              string2: 'NTU spinoffs',
                              link2:
                                  'https://www.ntuitive.sg/our-companies/stories', // Path to the image for Section 4
                            ),
                            RectangularSection(
                              text: 'Startup Related Events',
                              image: '5.png',
                              string1:
                                  'Explore Startup events happening soon and gain exposure',
                              link1: 'https://www.startupsg.gov.sg/events/',
                              string2: 'SWiTCH SG Conference',
                              link2:
                                  'https://www.switchsg.org/', // Path to the image for Section 5
                            ),
                            RectangularSection(
                              text: 'Try this awesome Idea Bank',
                              image: '6.png',
                              string1:
                                  'Work along with companies on existing industry challenges (Open Innovation Netwrok)',
                              link1:
                                  'https://www.openinnovationnetwork.gov.sg/home',
                              string2: 'Call for Innovation (EDB SG)',
                              link2:
                                  'https://www.edb.gov.sg/en/business-insights/innovation.html', // Path to the image for Section 6
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                      ],
                    ),
                    SizedBox(height: 100.0), // Adding space between containers

                    Container(
                      height: 250.0,
                      width: 1500.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 1450.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Learn On-The-Go!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Validation:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const Text(
                                'Once the spark of an idea ignites, it\'s time to test its mettle in the real world. Validation is like taking that rough gem of an idea and subjecting it to the fiery crucible of reality. It\'s about asking the tough questions, gathering feedback, and conducting experiments to determine if the idea has legs to stand on. This stage is not for the faint of heart—it\'s where dreams clash with cold, hard facts, and only the most resilient concepts survive.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const Text(
                                "Asking tough questions, gathering feedback, and conducting experiments.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 16.0),

                              // Add more paragraphs as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // First Row of Rectangular Sections
                    const Column(mainAxisSize: MainAxisSize.max, children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RectangularSection1(
                            text: 'Explore your chosen industry further',
                            image: '10.png',
                            string1: 'Dive into Industry-specific stats',
                            link1: 'https://www.enterprisesg.gov.sg/industries',
                          ),
                          RectangularSection1(
                            text: 'Explore the latest Startup News',
                            image: '10.png',
                            string1: 'Test Bed for Clean-Tech Ideas',
                            link1:
                                'https://www.nccs.gov.sg/singapores-climate-action/test-bedding/',
                            // Path to the image for Section 2
                          ),
                          RectangularSection1(
                            text:
                                'Download full report to validate growing industry and specific funding trends',
                            image: '10.png',
                            string1: 'Full Detailed Report',
                            link1: 'https://www.startupsg.gov.sg/resources',

                            // Path to the image for Section 3
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(height: 100.0), // Adding space between containers
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        previousText: "Back",
        nextText: "Next Page",
        onPreviousPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          // Navigate to the previous page
        },
        onNextPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RulesPage()),
          );
          // Navigate to the next page
        },
      ),
    );
  }
}

class RectangularSection extends StatelessWidget {
  final String text;
  final String image;
  final String? string1;
  final String? string2;
  final String? link1;
  final String? link2; // Path to the image

  const RectangularSection({
    Key? key,
    required this.text,
    required this.image,
    this.string1,
    this.link1,
    this.string2,
    this.link2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Adjust the height of the section as needed
      width: 400.0, // Adjust the width of the section as needed
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0, // Adjust the height of the image container as needed
            width: double.infinity, // Take the full width of the section
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth, // Ensure the image fills the container
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          if (string1 != Null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    text: "$string1\n",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        String? url = link1;
                        if (await canLaunch(url!)) {
                          await launch(url);
                        } else {
                          print("URL can't be launched.");
                        }
                      },
                  ),
                  // Additional text or content for the section
                ],
              ),
            ),
          if (string2 != Null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    text: "$string2\n",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        String? url = link2;
                        if (await canLaunch(url!)) {
                          await launch(url);
                        } else {
                          print("URL can't be launched.");
                        }
                      },
                  ),
                  // Additional text or content for the section
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class RectangularSection1 extends StatelessWidget {
  final String text;
  final String image;
  final String? string1;
  final String? link1;

  const RectangularSection1({
    Key? key,
    required this.text,
    required this.image,
    this.string1,
    this.link1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0, // Adjust the height of the section as needed
      width: 400.0, // Adjust the width of the section as needed
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 80.0, // Adjust the height of the image container as needed
          width: double.infinity, // Take the full width of the section
          child: Image.asset(
            image,
            fit: BoxFit.fitWidth, // Ensure the image fills the container
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        if (string1 != Null)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  text: "$string1\n",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      String? url = link1;
                      if (await canLaunch(url!)) {
                        await launch(url);
                      } else {
                        print("URL can't be launched.");
                      }
                    },
                ),
                // Additional text or content for the section
              ],
            ),
          ),
      ]),
    );
  }
}

class RectangularSection4 extends StatelessWidget {
  final String text;
  final String image;
  final String? string1;
  final String? link1;

  const RectangularSection4({
    Key? key,
    required this.text,
    required this.image,
    this.string1,
    this.link1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Adjust the height of the section as needed
      width: 290.0, // Adjust the width of the section as needed
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0, // Adjust the height of the image container as needed
            width: double.infinity, // Take the full width of the section
            child: Image.asset(
              image,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth, // Ensure the image fills the container
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          if (string1 != Null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    text: "$string1\n",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        String? url = link1;
                        if (await canLaunch(url!)) {
                          await launch(url);
                        } else {
                          print("URL can't be launched.");
                        }
                      },
                  ),
                  // Additional text or content for the section
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class RectangularSection2 extends StatelessWidget {
  final String text;
  final String image;
  final String? string1;
  final String? link1;

  const RectangularSection2({
    Key? key,
    required this.text,
    required this.image,
    this.string1,
    this.link1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0, // Adjust the height of the section as needed
      width: 290.0, // Adjust the width of the section as needed
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0, // Adjust the height of the image container as needed
            width: double.infinity, // Take the full width of the section
            child: Image.asset(
              image,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth, // Ensure the image fills the container
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          if (string1 != Null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    text: "$string1\n",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        String? url = link1;
                        if (await canLaunch(url!)) {
                          await launch(url);
                        } else {
                          print("URL can't be launched.");
                        }
                      },
                  ),
                  // Additional text or content for the section
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class RectangularSection3 extends StatelessWidget {
  final String text;
  final String image;
  final String? string1;
  final String? link1;

  const RectangularSection3({
    Key? key,
    required this.text,
    required this.image,
    this.string1,
    this.link1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0, // Adjust the height of the section as needed
      width: 420.0, // Adjust the width of the section as needed
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0, // Adjust the height of the image container as needed
            width: double.infinity, // Take the full width of the section
            child: Image.asset(
              image,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth, // Ensure the image fills the container
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          if (string1 != Null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    text: "$string1\n",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        String? url = link1;
                        if (await canLaunch(url!)) {
                          await launch(url);
                        } else {
                          print("URL can't be launched.");
                        }
                      },
                  ),
                  // Additional text or content for the section
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  final List<String> _stages = [
    'Ideation and Validation',
    'Company Registration and Regulations',
    'Scaling',
    'Getting Started Downloadables'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('Guide'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('Learn'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('Plans'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ), // Your existing app bar code

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'background.png', // Replace 'background_image.jpg' with your image file
            fit: BoxFit.cover,
          ),
          // Your existing background image
          // Your existing column for text and buttons
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'What stage of startup are you at?',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Dropdown list
                DropdownButton<String>(
                    value: null, // Update this with your selected item
                    hint: Text('Select stage',
                        style: TextStyle(fontSize: 20)), // Placeholder text
                    items: _stages.map((String stage) {
                      return DropdownMenuItem<String>(
                        value: stage,
                        child: Text(stage),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown item selection
                      if (newValue != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      } // Navigate to the next pag
                      // Navigate or perform actions based on the selected stage
                      // For example:
                      if (newValue == 'Ideation and Validation') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondRoute()),
                        );
                        // Navigate to Idea stage page
                      } else if (newValue ==
                          'Company Registration and Regulations') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RulesPage()),
                        );
                        // Navigate to Prototype stage page
                      } else if (newValue == 'Scaling') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScalingPage()),
                        );
                        // Navigate to Launch stage page
                      } else if (newValue == 'Getting Started Downloadables') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Downloadables()),
                        );
                        // Navigate to Growth stage page
                      }
                    }),
                // Your existing row with card-shaped buttons
                // Adjust the remaining content as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScalingPage extends StatelessWidget {
  const ScalingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            // Background Image
            Image.asset(
              'banner.png',
              alignment: Alignment
                  .topCenter, // Replace 'Ideation.png' with your image file
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            // Centered Column for Text and Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'SCALING',
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),

                    const SizedBox(height: 20),
                    // Your Big Rectangular Section
                    Container(
                      height: 350.0,
                      width: 1500.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 1500.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Learn On-The-Go!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Scaling:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const Text(
                                'Ah, the sweet taste of success! Scaling is the stage where the fledgling startup spreads its wings and takes flight. Its like watching a tiny sapling grow into a mighty oak tree, reaching for the sky and casting its shade far and wide. Scaling is about seizing opportunities, harnessing momentum, and expanding the business to new heights. Its a thrilling race against time and competition, where agility and adaptability are the keys to survival.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const Text(
                                "Seizing opportunities, harnessing momentum, and expanding the business.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 25.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Learn from these Govt. courses \n',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          "→ Learn while Scaling up (EDB Singapore)\n",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "https://edbsingapore.thinkific.com/collections/courses";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            print("URL can't be launched.");
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              // Add more paragraphs as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Column for Rectangular Sections at the bottom
                    const SizedBox(height: 20),
                    // First Row of Rectangular Sections
                    const Text(
                      "Funding",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RectangularSection4(
                              text:
                                  'Take the e-advisor to get detailed personalised available support programs',
                              image: 'Funding.png',
                              string1: 'Link',
                              link1:
                                  'https://eadviser.gobusiness.gov.sg/govassist?src=govassist_toolkits',
                            ),
                            RectangularSection4(
                              text: 'Government programs',
                              image: 'Funding.png',
                              string1: 'Link',
                              link1:
                                  'https://www.startupsg.gov.sg/programmes/?pillar=1601&need=6945&page=1', // Path to the image for Section 2
                            ),
                            RectangularSection4(
                              text: 'Government grants and loans',
                              image: 'Funding.png',
                              string1: 'Link',
                              link1:
                                  'https://www.gobusiness.gov.sg/gov-assist/',
                              // Path to the image for Section 3
                            ),
                            RectangularSection4(
                              text: 'Exclusive Tech based Startup funding',
                              image: 'Funding.png',
                              string1: 'Link',
                              link1:
                                  'https://www.sginnovate.com/startup-growth-funding',
                              // Path to the image for Section 3
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                    const Text(
                      "Network",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 31,
                            ),
                            RectangularSection2(
                              text:
                                  'Connect with VCs and People in the industry',
                              image: 'Network.png',
                              string1: 'Link',
                              link1: 'https://www.startupsg.gov.sg/directory',
                            ),
                            SizedBox(
                              width: 37,
                            ),
                            RectangularSection2(
                              text: 'Connect with the investment firms (EDBSg)',
                              image: 'Network.png',
                              string1: 'Link',
                              link1:
                                  'https://www.edb.gov.sg/en/how-we-help/incentives-and-schemes/tech-sg/tech-sg-recognised-investment-firms.html ', // Path to the image for Section 2
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                    const Text(
                      "Growth",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 31,
                            ),
                            RectangularSection2(
                              text:
                                  'Grow Digital: Scale Digitally using IMDA’s support',
                              image: 'Growth.png',
                              string1: 'Link',
                              link1:
                                  'https://www.imda.gov.sg/how-we-can-help/smes-go-digital',
                            ),
                            SizedBox(
                              width: 37,
                            ),
                            RectangularSection2(
                              text:
                                  'Grow local: Trial Hiring Schemes for Strartups',
                              image: 'Growth.png',
                              string1: 'Link',
                              link1:
                                  'https://www.wsg.gov.sg/home/employers-industry-partners/workforce-development-job-redesign/career-trial-for-employers', // Path to the image for Section 2
                            ),
                            SizedBox(
                              width: 37,
                            ),
                            RectangularSection2(
                              text: 'Grow overseas',
                              image: 'Growth.png',
                              string1: 'Link',
                              link1:
                                  'https://www.enterprisesg.gov.sg/grow-your-business/go-global', // Path to the image for Section 2
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        previousText: "Back",
        nextText: "Next Page",
        onPreviousPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RulesPage()),
          );
          // Navigate to the previous page
        },
        onNextPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Downloadables()),
          );
          // Navigate to the next page
        },
      ),
    ));
  }
}

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            // Background Image
            Image.asset(
              'companyregis.jpeg',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: 400,
            ),
            // Centered Column for Text and Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'COMPANY REGISTRATION AND REGULATIONS',
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // Stack to overlay the image and rectangular sections
                    Stack(
                      children: [
                        Image.asset('timeline.png'),
                        const Positioned(
                          left:
                              100, // Adjust the left position of the first section
                          top:
                              80, // Adjust the top position of the first section
                          child: RectangularSection3(
                            text: 'Step-by-step guide',
                            image: 'Growth.png',
                            string1: 'Link',
                            link1:
                                'https://www.gobusiness.gov.sg/start-a-business/choose-a-business-structure/',
                          ),
                        ),
                        const Positioned(
                          right:
                              100, // Adjust the right position of the second section
                          top:
                              260, // Adjust the top position of the second section
                          child: RectangularSection3(
                            text: 'Advisor to generate checklist',
                            image: 'Growth.png',
                            string1: 'Link',
                            link1:
                                'https://eadviser.gobusiness.gov.sg/startabusiness',
                          ),
                        ),
                        const Positioned(
                          left:
                              100, // Adjust the left position of the third section
                          top:
                              470, // Adjust the top position of the third section
                          child: RectangularSection3(
                            text: 'Stuck?',
                            image: 'Growth.png',
                            string1: 'Link',
                            link1:
                                'https://www.gobusiness.gov.sg/e-services/?src=topnav',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        previousText: "Back",
        nextText: "Next Page",
        onPreviousPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondRoute()),
          );
          // Navigate to the previous page
        },
        onNextPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScalingPage()),
          );
          // Navigate to the next page
        },
      ),
    );
  }
}

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Image.asset(
              'Ideation.png', // Replace 'Ideation.png' with your image file
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            // Centered Column for Text and Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Positioned(
                      left: 60,
                      child: Text(
                        'LEARN',
                        style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Center(
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Congratulations on starting this exciting journey. Let's work together to generate \n      great ideas and shape the future. Ready to dive in? Let's get started! 🚀",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Your Big Rectangular Section
                    Container(
                      height: 700.0,
                      width: 1500.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 1500.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Learn On-The-Go!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Ideation:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const Text(
                                'This is the "Eureka!" moment, where entrepreneurs dive into the depths of creativity to unearth innovative ideas. Its akin to a journey through a maze of possibilities, where every twist and turn leads to a potential solution to a problem or a new opportunity. This stage is all about dreaming big, brainstorming relentlessly, and daring to imagine what could be.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const Text(
                                "Exploring possibilities, brainstorming relentlessly, and daring to imagine.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 16.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Learn from these Govt. courses \n',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          "→ Essentials of Starting Business (ACRA)\n",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "https://elearn.acra.gov.sg/acra/AAEnrolment/PublicCoursewareListings.aspx";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            print("URL can't be launched.");
                                          }
                                        },
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          "→ Design Thinking (MySkillsFuture)",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "https://www.myskillsfuture.gov.sg/content/portal/en/training-exchange/course-directory/course-detail.html?courseReferenceNumber=TGS-2020501678";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            print("URL can't be launched.");
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 60.0),
                              const Text(
                                'Learn On-The-Go!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                "Scaling:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const Text(
                                'Ah, the sweet taste of success! Scaling is the stage where the fledgling startup spreads its wings and takes flight. Its like watching a tiny sapling grow into a mighty oak tree, reaching for the sky and casting its shade far and wide. Scaling is about seizing opportunities, harnessing momentum, and expanding the business to new heights. Its a thrilling race against time and competition, where agility and adaptability are the keys to survival.',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const Text(
                                "Seizing opportunities, harnessing momentum, and expanding the business.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 25.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Learn from these Govt. courses \n',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          "→ Learn while Scaling up (EDB Singapore)\n",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          String url =
                                              "https://edbsingapore.thinkific.com/collections/courses";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            print("URL can't be launched.");
                                          }
                                        },
                                    ),
                                    // Add more paragraphs as needed
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              const Text(
                                'To Be Continued...',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Column for Rectangular Sections at the bottom
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        previousText: "Back",
        nextText: "Next Page",
        onPreviousPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          // Navigate to the previous page
        },
        onNextPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          // Navigate to the next page
        },
      ),
    );
  }
}

class Downloadables extends StatelessWidget {
  const Downloadables({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        leading: Image.asset('logo.jpg'),
        title: const Text(
          'Salt and Pepper',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Add your first button logic here
            },
            child: Text('About Us'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            // Background Image
            Image.asset(
              '11.png',
              alignment: Alignment
                  .topCenter, // Replace 'Ideation.png' with your image file
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            // Centered Column for Text and Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'Getting Started Downloadables',
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 247, 53, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RectangularSection4(
                              text: 'Business Plan Template',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://images.startups.co.uk/wp-content/uploads/2023/11/Business-plan-template-from-Startups.co_.uk_.pdf?_gl=1*1vjvhxf*_ga*NzUyODYzNDY0LjE3MTIzODI5NzM.*_ga_TV8NP29ZR1*MTcxMjQ1NDg2Ny42LjEuMTcxMjQ1NDg2OS41OC4wLjA.',
                            ),
                            RectangularSection4(
                              text: 'Founder\'s Agreement',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.svca.org.sg/sites/default/files/2022-09/VIMA%202.0%20Model%20Founders%27%20Agreement%20%28Revised%29%20%28clean%29.docx', // Path to the image for Section 2
                            ),
                            RectangularSection4(
                              text: 'Model Constitution',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.svca.org.sg/sites/default/files/2022-09/VIMA%202.0%20Model%20Constitution.docx',
                              // Path to the image for Section 3
                            ),
                            RectangularSection4(
                              text:
                                  'EnterpriseSG Toolkits and Marketing Guides',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.enterprisesg.gov.sg/resources/all-guides-and-tools',
                              // Path to the image for Section 3
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RectangularSection4(
                              text: 'Non-Disclosure Agreeement',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.svca.org.sg/sites/default/files/2022-09/VIMA%202.0%20Model%20Non-Disclosure%20Agreement%20%282019%20updated%29.docx',
                            ),
                            RectangularSection4(
                              text: 'Shareholders\' Agreemnent',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.svca.org.sg/sites/default/files/2022-09/VIMA%202.0%20Model%20Non-Disclosure%20Agreement%20%282019%20updated%29.docx', // Path to the image for Section 2
                            ),
                            RectangularSection4(
                              text: 'Term Sheet (Short)',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.svca.org.sg/sites/default/files/2022-09/VIMA%202.0%20Model%20Term%20Sheet%20%28Short%20Form%29.docx',
                              // Path to the image for Section 3
                            ),
                            RectangularSection4(
                              text: 'Assignment of Intellectual Property',
                              image: '12.png',
                              string1: 'Link',
                              link1:
                                  'https://www.svca.org.sg/sites/default/files/2022-09/VIMA%202.0%20Model%20Assignment%20of%20Intellectual%20Property%20Rights.docx',
                              // Path to the image for Section 3
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        previousText: "Back",
        nextText: "Home",
        onPreviousPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScalingPage()),
          );
          // Navigate to the previous page
        },
        onNextPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          // Navigate to the next page
        },
      ),
    ));
  }
}
