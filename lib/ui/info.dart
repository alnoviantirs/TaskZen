import 'package:flutter/material.dart';
import 'package:todo_apps/ui/profile_page.dart';

class TaskZenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white), // Checkmark icon
            SizedBox(width: 8.0),
            Text('TaskZen'),
          ],
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(
              title: 'Deskripsi Aplikasi',
              icon: Icons.description,
              content:
                  'TaskZen adalah aplikasi manajemen tugas yang didesain untuk memudahkan pengguna dalam mengatur, melacak, dan menyelesaikan tugas-tugas mereka dengan efisien. Dengan antarmuka yang intuitif dan fitur-fitur canggih, TaskZen membantu anda tetap terorganisir dan fokus pada prioritas anda.',
              context: context,
            ),
            _buildCard(
              title: 'Tujuan Aplikasi',
              icon: Icons.star,
              content: '1. Pengingat Tugas yang Efektif\n'
                  'TaskZen bertujuan untuk menyediakan pengingat tugas yang efektif, memastikan anda tidak melewatkan batas waktu atau tugas penting.\n\n'
                  '2. Manajemen Tugas yang Mudah\n'
                  'Aplikasi ini dirancang untuk mempermudah pengguna dalam membuat, mengedit, dan mengelola daftar tugas mereka dengan cepat dan mudah.\n\n'
                  '3. Notifikasi yang Terkendali\n'
                  'Pengguna dapat mengatur notifikasi sesuai kebutuhan mereka, memastikan bahwa mereka hanya menerima pemberitahuan yang relevan dan penting.\n\n'
                  '4. Antarmuka yang Ramah Pengguna\n'
                  'TaskZen menawarkan antarmuka yang ramah pengguna, memastikan pengalaman pengguna yang menyenangkan dan efisien.',
              context: context,
            ),
            _buildCard(
              title: 'Tim Pembuat Aplikasi',
              icon: Icons.people,
              content:
                  'Rizkyria A. P. Hutabarat (1214023)\nAl Novianti Ramadhani  (1214032)',
              onTap: () {
                // Navigate to the ProfilePage when the card is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required String content,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromRGBO(
          255, 229, 222, 1), // Set background color to pastel purple
      child: InkWell(
        onTap: onTap != null
            ? onTap
            : () {
                // Display a pop-up with a photo when the card is tapped
                if (icon == Icons.description) {
                  _showPhotoDialog(context, 'assets/icons/taskzen.png');
                } else if (icon == Icons.star) {
                  _showPhotoDialog(context, 'assets/icons/taskzen.png');
                }
              },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Icon(icon, color: Colors.deepPurple),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                content,
                style: TextStyle(fontSize: 16.0, color: Colors.deepPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to show a pop-up with a photo
  void _showPhotoDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Desc'),
          backgroundColor: Colors.white, // Set background color to white
          content: Image.asset(imagePath),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void main() {
    runApp(MaterialApp(
      home: TaskZenPage(),
    ));
  }
}
