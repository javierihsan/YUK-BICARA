import 'package:flutter/material.dart';
import 'feedbackPage.dart';

class StatusDetailsPage extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String description;

  StatusDetailsPage({
    required this.title,
    required this.date,
    required this.status,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Status Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF232528),
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipOval(
              child: Container(
                color: Color(0xFF232528), // Warna latar belakang (opsional)
                child: Image.asset(
                  'assets/yukbicaralogo.png', // Path gambar logo
                  fit: BoxFit.contain,
                  width: 50, // Ukuran logo
                  height: 50, // Ukuran logo
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF232528),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Date: $date",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Status: $status",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(status),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Implementasi edit
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Implementasi delete
                  },
                ),
                Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  icon: Icon(Icons.feedback, color: Colors.white),
                  label: Text(
                    "Feedback",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // Navigasi ke halaman FeedbackPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menentukan warna berdasarkan status
  Color _getStatusColor(String status) {
    if (status == "Finished") {
      return Colors.green;
    } else if (status == "Processed") {
      return Colors.yellow;
    } else if (status == "Sent") {
      return Colors.red;
    }
    return Colors.grey;
  }
}
