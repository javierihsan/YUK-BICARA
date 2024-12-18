import 'package:flutter/material.dart';

class Jadwal extends StatelessWidget {
  final String profileImagePath;
  final String psikiaterName;
  final String kategori;
  final String rating;
  final String jamTersedia;

  const Jadwal({
    Key? key,
    required this.profileImagePath,
    required this.psikiaterName,
    required this.kategori,
    required this.rating,
    required this.jamTersedia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 165,
      decoration: BoxDecoration(
        color: Color(0xFF2B3037),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile image
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(profileImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Psikiater name
                    Text(
                      psikiaterName,
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF1F4F6),
                      ),
                    ),
                    SizedBox(height: 4),
                    // Psikiater category
                    Text(
                      kategori,
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFAAB6C3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                // Rating
                Text(
                  rating,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF1F4F6),
                  ),
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/Star.png',
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 18),
                Image.asset(
                  'assets/Time.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 8),
                // Available time
                Text(
                  jamTersedia,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF1F4F6),
                  ),
                ),
              ],
            ),
            Spacer(),
            // Book Appointment Button
            Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF555C6B),
                borderRadius: BorderRadius.circular(32),
              ),
              alignment: Alignment.center,
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF1F4F6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
