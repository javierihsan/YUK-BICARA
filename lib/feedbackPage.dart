import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232528),
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF232528),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipOval(
              child: Container(
                color: const Color(0xFF232528), // Background color (optional)
                child: Image.asset(
                  'assets/yukbicaralogo.png', // Path to logo
                  fit: BoxFit.contain, // Adjusts the logo size
                  width: 50, // Set width of the logo
                  height: 50, // Set height of the logo
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                color: Colors.grey[900],
                child: Center(
                ),
              ),
              Positioned(
                top: 0, 
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/1707809536.png", // Gambar dokter
                  width: 100,  // Setel lebar gambar sesuai keinginan
                  height: 320, // Setel tinggi gambar sesuai keinginan
                  fit: BoxFit.cover, // Menjaga gambar tetap proporsional
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Informasi Dokter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prof. Givan Kopling, S.Psi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "4.8 ",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Icon(Icons.star, color: Colors.yellow, size: 18),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Psikolog | Universitas Airlangga",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.badge, color: Colors.white70, size: 16),
                    SizedBox(width: 5),
                    Text(
                      "LPSUA122245",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Balon Chat Feedback
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                ChatBubble(
                  text:
                      "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an.",
                ),
                ChatBubble(
                  text:
                      "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting.",
                ),
              ],
            ),
          ),
          // Input Field di bagian bawah
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[800],
                      hintText: "Tuliskan feedback Anda...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Implementasi kirim feedback
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk Balon Chat
class ChatBubble extends StatelessWidget {
  final String text;
  const ChatBubble({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
