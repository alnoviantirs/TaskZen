import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 8.0),
            Text(
              'Profiles',
              style: TextStyle(
                fontFamily: 'CustomFont', // Ganti dengan nama font kustom Anda
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 10, // Menambah bayangan pada app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 249, 247, 249)!,
              const Color.fromARGB(255, 249, 247, 249)!
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfile(
                'Rizkyria A.P Hutabarat',
                'assets/icons/kia (2).jpeg',
                'NPM: 1214023',
              ),
              SizedBox(height: 20),
              _buildProfile(
                'Al Novianti Ramadhani',
                'assets/icons/novi.jpeg',
                'NPM: 1214032',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(String name, String imagePath, String npm) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(
            255, 229, 222, 1), // Set card background color to pastel purple
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.purple[200],
            foregroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple[800],
            ),
          ),
          SizedBox(height: 10),
          Text(
            npm,
            style: TextStyle(
              fontSize: 16,
              color: Colors.purple[600],
            ),
          ),
        ],
      ),
    );
  }
}
