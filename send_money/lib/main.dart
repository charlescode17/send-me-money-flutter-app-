import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USSD Support',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SupportPage(),
    );
  }
}

class SupportPage extends StatelessWidget {
  final String ussdCode = '*182*1*1*0788267156#';

  Future<void> _dialUSSD() async {
    final encodedUssd = Uri.encodeComponent(ussdCode);
    final Uri telUri = Uri.parse("tel:$encodedUssd");

    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      print('Could not launch $telUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: Text('Support Me')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Support Me by Dialing USSD Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone_android, color: Colors.green.shade700),
                        SizedBox(width: 8),
                        Text(
                          ussdCode,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ensure you have sufficient funds in your mobile money account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _dialUSSD,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.call, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Support Me", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("How it works:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green.shade700)),
                    SizedBox(height: 8),
                    Text("1. Click the 'Support Me' button"),
                    Text("2. Your phone's dialer will open with the USSD code"),
                    Text("3. Press 'Call' to proceed"),
                    Text("4. Follow the instructions to complete the transaction"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
