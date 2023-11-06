import 'package:bwp/screens/widgets/universal_widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UserResources extends StatefulWidget {
  const UserResources({Key? key}) : super(key: key);

  @override
  State<UserResources> createState() => _UserResourcesState();
}

class _UserResourcesState extends State<UserResources> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/timelapse.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
    _controller.setVolume(0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _playOrPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Resources"),
      ),
      drawer: const BurgerMenu(activeRoute: '/resources'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                "How to plant a bamboo",
                style: TextStyle(fontSize: 16),
              )),
              const SizedBox(height: 20),
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(_controller),
                          IconButton(
                            onPressed: _playOrPause,
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Bamboo Applications",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Row(
                children: [
                  Expanded(
                    child: Application(
                      text: 'Clothing',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Application(
                      text: 'Furniture',
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Application(
                      text: 'Accessories',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Application(
                      text: 'Construction',
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    child: Application(
                      text: 'Textiles',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Application(
                      text: 'Utensils',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Ebooks",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 12),
                    width: double.infinity,
                    height: 437,
                    child: Image.asset(
                      'assets/ebook1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Application extends StatelessWidget {
  final String text;

  const Application({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      height: 80,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
