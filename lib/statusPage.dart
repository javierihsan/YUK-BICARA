import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'homePage.dart';
import 'statusDetails.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  int _selectedIndex = 1;

  void _onNavBarTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StatusPage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Status Confirmation",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF232528),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipOval(
              child: Container(
                color: Color(0xFF232528), // Tambahkan warna latar belakang (opsional)
                child: Image.asset(
                  'assets/yukbicaralogo.png', // Path gambar logo
                  fit: BoxFit.contain, // Menyesuaikan ukuran logo
                  width: 50, // Ukuran logo sama seperti di ReportPage
                  height: 50, // Ukuran logo sama seperti di ReportPage
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
            StatusCard(
              title: "Pelecehan Verbal",
              date: "August 17",
              status: "Finished",
              statusColor: Colors.green,
              onEdit: () {
                // Action edit
              },
              onDelete: () {
                // Action delete
              },
              onTap: () {
                // Navigasi ke StatusDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatusDetailsPage(
                      title: "Pelecehan Verbal",
                      date: "August 17",
                      status: "Finished",
                      description: "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an.",
                    ),
                  ),
                );
              },
            ),
            StatusCard(
              title: "Pelecehan Fisik",
              date: "Oktober 5",
              status: "Processed",
              statusColor: Colors.yellow,
              onEdit: () {
                // Action edit
              },
              onDelete: () {
                // Action delete
              },
              onTap: () {
                // Navigasi ke StatusDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatusDetailsPage(
                      title: "Pelecehan Fisik",
                      date: "Oktober 5",
                      status: "Processed",
                      description: "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an.",
                    ),
                  ),
                );
              },
            ),
            StatusCard(
              title: "Pelecehan Seksual",
              date: "Desember 13",
              status: "Sent",
              statusColor: Colors.red,
              onEdit: () {
                // Action edit
              },
              onDelete: () {
                // Action delete
              },
              onTap: () {
                // Navigasi ke StatusDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatusDetailsPage(
                      title: "Pelecehan Seksual",
                      date: "Desember 13",
                      status: "Sent",
                      description: "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an.",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF232528),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Status",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback onTap; // Menambahkan onTap untuk navigasi

  const StatusCard({
    Key? key,
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
    this.onEdit,
    this.onDelete,
    required this.onTap, // Inisialisasi onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menambahkan aksi tap untuk navigasi
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: statusColor,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: statusColor, width: 1.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit, color: Colors.blue, size: 20),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.red, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
