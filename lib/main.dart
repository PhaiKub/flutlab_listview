import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(), // Fixed missing value
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "รหัสนักศึกษา": "66209010001",
      "ชื่อ-นามสกุล": "นาย สมชาย ใจดี",
      "image":
          "https://i1.sndcdn.com/artworks-JSu5r3Jwry48zyNt-fz7vVA-t500x500.jpg"
    },
    {
      "รหัสนักศึกษา": "66209010002",
      "ชื่อ-นามสกุล": "นาย สมศัก ใจดี",
      "image": "https://i.ytimg.com/vi/Y3YKmpb2Lwo/hqdefault.jpg"
    },
    {
      "รหัสนักศึกษา": "66209010003",
      "ชื่อ-นามสกุล": "นาย อนุชา วัดดีมีสุข",
      "image": "https://media.tenor.com/wK3LuFMKBWsAAAAe/limbus-company.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6e6e6e),
        leading: const Icon(Icons.account_circle, color: Colors.white),
        title: const Text(
          "ข้อมูลนักศึกษา",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              items[index]['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(items[index]["รหัสนักศึกษา"]!),
            subtitle: Text(items[index]["ชื่อ-นามสกุล"]!),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(data: items[index]),
                ),
              );
            }, // Fixed the key name
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> data;
  const DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6e6e6e),
        title: const Text('รายละเอียดข้อมูลนักศึกษา',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                data['image']!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              Text("รหัสนักศึกษา : " + data['รหัสนักศึกษา']!,
                  style: TextStyle(fontSize: 18)),
              Text("ชื่อ-นามสกุล : " + data['ชื่อ-นามสกุล']!,
                  style: TextStyle(fontSize: 18)),
            ],
          )),
    );
  }
}
