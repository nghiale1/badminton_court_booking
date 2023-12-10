import 'package:flutter/material.dart';
import 'package:badminton_court_booking/common/common.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Idea {
  String title;
  String description;
  String author;
  bool isAnonymous;
  int votes;

  Idea({
    required this.title,
    required this.description,
    required this.author,
    this.isAnonymous = false,
    this.votes = 0,
  });
}

class DreamPage extends StatefulWidget {
  DreamPage({super.key});

  @override
  State<DreamPage> createState() => _DreamPageState();
}

class _DreamPageState extends State<DreamPage> {
  final List<Idea> ideas = [
    Idea(
      title: 'Startup Idea',
      description: 'An idea for a revolutionary startup!',
      author: 'John Doe',
    ),
    Idea(
      title: 'Startup Idea',
      description: 'An idea for a revolutionary startup!',
      author: 'John Doe',
    ),
    // Add more ideas here
  ];

  bool _isSending = false;

  void _showSendingModal(BuildContext context) {
    setState(() {
      _isSending = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height *
                0.9, // Chiếm 90% chiều cao màn hình
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Đóng modal
                    },
                  ),
                ),
                TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    labelText: 'Ước mơ lớn nhất của bạn là gì',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Thực hiện xử lý khi người dùng bấm nút gửi
                    // Đặt logic xử lý dữ liệu ở đây
                    Navigator.of(context).pop(); // Đóng modal khi xong
                  },
                  child: Text('Gửi'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      setState(() {
        _isSending = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Sharing'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Constant.kAvatarDefault),
              ),
              Expanded(
                // Wrap TextField with Expanded
                child: GestureDetector(
                    onTap: () {
                      _showSendingModal(context);
                    },
                    child: Text('Ước mơ lớn nhất của bạn là gì')),
              ),
              const Icon(Icons.image)
            ],
          ),
          SizedBox(height: 20),
          // Hiển thị modal progress khi đang gửi dữ liệu
          if (_isSending)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: SpinKitFadingCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: ideas.length,
              itemBuilder: (context, index) {
                return IdeaCard(idea: ideas[index]);
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class IdeaCard extends StatelessWidget {
  final Idea idea;

  const IdeaCard({super.key, required this.idea});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              idea.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(idea.description),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  idea.isAnonymous ? 'Anonymous' : idea.author,
                  style: const TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        // Handle vote increment
                      },
                    ),
                    Text('${idea.votes} Votes'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
