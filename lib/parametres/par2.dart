import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P.De Notifications',
      debugShowCheckedModeBanner: false,
      home: const NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _generalNotification = true;
  bool _sound = true;
  bool _vibrate = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: screenHeight * 0.8,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA3C3E4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "P.De Notifications",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF000000),
                          ),
                        ),

                        const SizedBox(height: 95),
                        _buildSwitchRow(
                          label: 'General Notification',
                          value: _generalNotification,
                          onChanged: (val) {
                            setState(() {
                              _generalNotification = val;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        const SizedBox(height: 20),
                        _buildSwitchRow(
                          label: 'Sound',
                          value: _sound,
                          onChanged: (val) {
                            setState(() {
                              _sound = val;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        const SizedBox(height: 20),

                        // 3) Vibrate
                        _buildSwitchRow(
                          label: 'Vibrate',
                          value: _vibrate,
                          onChanged: (val) {
                            setState(() {
                              _vibrate = val;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                  icon: Icon(Icons.home, color: Color(0xFF073057)),
                  onPressed: () {},
                ),

                IconButton(
                  icon: Icon(Icons.star, color: Colors.white),
                  onPressed: () {},
                ),
                SizedBox(width: 40),
                IconButton(
                  icon: Icon(Icons.folder, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsScreen(),
                      ),
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

  // Widget réutilisable pour chaque ligne de paramètre
  Widget _buildSwitchRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    Color activeColor = Colors.blue,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Switch(value: value, onChanged: onChanged, activeColor: activeColor),
      ],
    );
  }
}

class par1 extends StatelessWidget {
  const par1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.8,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA3C3E4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Parametres",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF000000),
                        ),
                      ),

                      const SizedBox(height: 95),

                      _buildProfileOption(
                        Icons.lightbulb,
                        'Paramétres de notification',
                      ),
                      const SizedBox(height: 35),
                      _buildProfileOption(
                        Icons.key,
                        'Gestionnaire De mot De Passe',
                      ),
                      const SizedBox(height: 35),
                      _buildProfileOption(Icons.person, 'Supprimer le Compte'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF073057), size: 28),
        const SizedBox(width: 15),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}
