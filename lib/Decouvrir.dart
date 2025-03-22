import 'package:flutter/material.dart';
import 'main.dart';
import 'Profile.dart';
import 'fichier.dart';

void main() {
  runApp(MyApp());
}

/*class Main2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main2 Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous page
          },
          child: Text("Back to Main"),
        ),
      ),
    );
  }
}*/

Widget buildCon(String ty) {
  return ElevatedButton(
    onPressed: () {
      printhell();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Button background color
      foregroundColor: Colors.white, // Text color
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ), // Padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      elevation: 5, // Shadow effect
    ),
    child: Text(
      ty,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buil(User rt) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue, // Border color
        width: 3, // Border width
      ),
    ),
    child: Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Ensures space between components
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns them properly
      children: [
        /// **Column for Text**
        ///
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to left
            children: [
              Text(
                rt.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Kvaratskhelia, Georgia",
                style: TextStyle(
                  color: Color.fromARGB(255, 204, 204, 205),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),

        /// **Row for Icon and Number**
        Row(
          children: [
            Icon(Icons.star, color: Colors.red, size: 24),

            SizedBox(width: 5), // Space between icon and text
            Text(
              rt.number,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

PreferredSizeWidget Appbuild() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            'assets/profile.jpg',
          ), // Replace with your image
        ),

        // Search Bar (Expanded to take available space)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Color(0xFFA3C3E4),
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),

        // Notification Icon
        CircleAvatar(
          backgroundColor: Color(0xFFA3C3E4),
          radius: 20,
          child: Icon(Icons.notifications, color: Colors.white),
        ),

        SizedBox(width: 10), // Space between icons
        // Messages Icon
        CircleAvatar(
          backgroundColor: Color(0xFFA3C3E4),
          radius: 20,
          child: Icon(Icons.forum, color: Colors.white),
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  );
}

printhell() {
  print("hello");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeS2());
  }
}

class User {
  final String number;
  final String name;
  final String image;

  // Using a shorthand constructor with 'const'.
  const User(this.number, this.name, this.image);
}

class DateWidget extends StatelessWidget {
  final int index;
  final List<String> days = ["17", "18", "19", "20", "21", "22"];
  final List<String> weekDays = ["MAR", "MER", "JEU", "VEN", "SAM", "DIM"];

  DateWidget(this.index);

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == 2;
    return Container(
      width: 50,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF3A6EA5) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            days[index],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            weekDays[index],
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFA3C3E4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dr. Bensoltane Souhila",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black54, size: 18),
                  Icon(Icons.check_circle, color: Colors.green, size: 18),
                  Icon(Icons.cancel, color: Colors.red, size: 18),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            "Soins pour les amygdales",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class ContactEmergencyDoctorButton extends StatelessWidget {
  final String text;

  ContactEmergencyDoctorButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Selected Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0x396C9B), // Darker blue
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            children: [Text("Tous"), Icon(Icons.arrow_drop_down, size: 18)],
          ),
        ),
        SizedBox(width: 2),

        // Other Filter Buttons
        filterButton("Spécialité"),
        filterButton("Sexe"),
        filterButton("A Proximité"),
        iconButton(Icons.star_border),
        iconButton(Icons.favorite_border),
      ],
    );
  }

  Widget filterButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(10, 33), // Custom width & height
      ),
      child: Row(children: [Text(text), Icon(Icons.arrow_drop_down, size: 18)]),
    );
  }

  // Function to create circular icon buttons
  Widget iconButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(10),
          side: BorderSide(color: Colors.transparent),
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338,
      height: 120,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        // Round corners
        borderRadius: BorderRadius.circular(25),
        // Outer border
        border: Border.all(color: Colors.black54, width: 1),
        // Optional shadow for depth
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          // 1) Circular avatar
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20, top: 10),
                  width: 220,
                  height: 60,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Dr. Boudaoud Athmane",

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),

                      // const SizedBox(height: 4),
                      Text(
                        "Médecine interne",
                        style: TextStyle(color: Colors.grey[700], fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      // Star + rating
                      _buildIconBadge(icon: Icons.star_border, label: "5"),
                      const SizedBox(width: 5),

                      // User icon + number (example)
                      _buildIconBadge(icon: Icons.person_outline, label: "60"),
                      const SizedBox(width: 5),

                      // Question mark icon
                      _buildCircleIconButton(
                        icon: Icons.help_outline,
                        onTap: () {},
                      ),
                      const SizedBox(width: 5),

                      // Heart icon
                      _buildCircleIconButton(
                        icon: Icons.favorite_border,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 2) Bubble with Name & Specialty

          // 3) Icons and labels on the right
        ],
      ),
    );
  }

  /// A pill-shaped container with an icon and a label, e.g., star + rating
  Widget _buildIconBadge({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blue),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  /// A circular container for a single icon (e.g., question mark, heart)
  Widget _buildCircleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue),
        ),
        child: Icon(icon, size: 18, color: Colors.blue),
      ),
    );
  }
}

Widget _buildCircleIconButton1({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 70,
      height: 30,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12), // Rounded corners

        border: Border.all(color: Colors.blue),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("plus"), Icon(icon, size: 18, color: Colors.blue)],
      ),
    ),
  );
}

class HomeS2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 60, // Creates more space at the top
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),

            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFA3C3E4),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
            ),

            child: ListView(
              children: [
                Row(
                  children: [
                    Icon(Icons.search, color: Colors.black54),
                    SizedBox(width: 8),
                    Text(
                      "Prochains rendez-vous",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF073057),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                FilterButtons(),
                SizedBox(height: 16),
                DoctorCard(),
                SizedBox(height: 16),
                DoctorCard(),
                SizedBox(height: 16),
                DoctorCard(),
                SizedBox(height: 16),
                DoctorCard(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildCircleIconButton1(
                      icon: Icons.keyboard_arrow_down,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF396C9B),

            borderRadius: BorderRadius.circular(12),
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeS()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star, color: Color(0xFF073057)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeS2()),
                    );
                  },
                ),
                SizedBox(width: 40),
                IconButton(
                  icon: Icon(Icons.folder, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeS4()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeS3()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
