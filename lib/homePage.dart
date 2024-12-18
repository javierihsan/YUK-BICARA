import 'package:flutter/material.dart';
import 'statusPage.dart';
import 'profilePage.dart';
import 'reportPage.dart';
import 'bottomNavBar.dart';
import 'jadwalWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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

  void _navigateToReportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232528),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 8, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/user_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hallo,',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFAAB6C3),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Haqul Kurang Yakin !',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 110), // Jarak tetap antara teks dan logo
                      Image.asset(
                        'assets/yukbicaralogo.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ],
                  )

                ],
              ),
              SizedBox(height: 43), 
              Text(
                'Report Your Complaint',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 24),

              Center(
                child: Container(
                  width: double.infinity,
                  height: 172,
                  decoration: BoxDecoration(
                    color: Color(0xFF2E6FF3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Image.asset(
                          'assets/card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 32,
                        right: 32,
                        bottom: 10,
                        child: GestureDetector(
                          onTap: _navigateToReportPage,
                          child: Container(
                            height: 43,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Report Now!',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2E6FF3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25), 

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7D8A95),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              Jadwal(
                profileImagePath: 'assets/user_image.png',
                psikiaterName: 'Javier Widodo',
                kategori: 'Spesialis Kekerasan Verbal',
                rating: '4.8',
                jamTersedia: '10:30am - 5:30pm',
              ),
              SizedBox(height: 24), // Spacing between each Jadwal card
              Jadwal(
                profileImagePath: 'assets/user_image2.png',
                psikiaterName: 'Cak Givan',
                kategori: 'Spesialis Kekerasan Fisik',
                rating: '4.7',
                jamTersedia: '1:00pm - 6:00pm',
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}
