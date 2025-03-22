import 'package:flutter/material.dart';

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
