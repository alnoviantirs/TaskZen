import 'package:flutter/material.dart';
import 'package:todo_apps/ui/info.dart';
import 'package:todo_apps/ui/login_page.dart';
import 'package:todo_apps/ui/register_page.dart';
import 'package:todo_apps/ui/onboarding.dart'; // Sesuaikan dengan path yang benar
import 'package:todo_apps/ui/info.dart'; // Sesuaikan dengan path yang benar

class SimpleWelcomePage extends StatelessWidget {
  const SimpleWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 40), // Adjust vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.05, // Adjust the height of the SizedBox
              ),
              Image.asset(
                'assets/icons/clipboard.png', // Sesuaikan dengan path gambar Anda
                height: MediaQuery.of(context).size.height *
                    0.33, // Adjust the height
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Hello',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      letterSpacing: 3,
                      color: Colors.deepPurple,
                      fontSize: 45, // Adjust the font size
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Welcome to the best Task Reminder app ever !',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      letterSpacing: 3,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      wordSpacing: 2,
                      color: Colors.deepPurple,
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              _myButton(context, 'Sign In', LoginPage(), Colors.white),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              _myButton(context, 'Sign Up', RegisterPage(), Colors.white),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              _myOutlinedButton(
                  context, 'More Info', TaskZenPage()), // Add InfoPage here
            ],
          ),
        ),
      ),
    );
  }

  Widget _myButton(
      BuildContext context, String text, Widget destination, Color textColor) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Adjust border radius
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize:
                MediaQuery.of(context).size.width * 0.035, // Adjust font size
          ),
        ),
      ),
    );
  }

  Widget _myOutlinedButton(
      BuildContext context, String text, Widget destination) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Adjust width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Adjust border radius
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SimpleWelcomePage(),
  ));
}
