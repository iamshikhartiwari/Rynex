import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rynex/screens/music/message.dart';
import 'package:rynex/screens/music/search.dart';
import 'package:rynex/screens/music/musicHome.dart';
import 'package:rynex/models/music.dart';

class MusicPlayingScreen extends StatefulWidget {
  const MusicPlayingScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayingScreen> createState() => _MusicPlayingScreenState();
}

class _MusicPlayingScreenState extends State<MusicPlayingScreen> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = [];
  int _currTapIndex = 0;
  Music? music;
  bool isPlaying = false;


  Widget miniPlayer(Music? music,{bool stop = false}) {
    this.music = music;

    Size deviseSize = MediaQuery.of(context).size;
    if (music == null) {
      return SizedBox();
    }
    if(stop){
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 700,
      ),
      color: Colors.blueGrey,
      width: deviseSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () async {
              isPlaying = !isPlaying;
              if(isPlaying){
                await _audioPlayer.play(UrlSource(music.audioUrl));
              }
              else{
                _audioPlayer.pause();
              }
              setState(() {});
            },
            icon: isPlaying? Icon(Icons.pause):Icon(Icons.play_arrow),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currTapIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [MusicHome(miniPlayer), SearchScreen(), ChatScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: IndexedStack(
        //   index: _currTapIndex,
        //   children: Tab,
        // ),
        body: Tabs[_currTapIndex],
        backgroundColor: Color(0xFF11388C),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            miniPlayer(music),
            BottomNavigationBar(
              currentIndex: _currTapIndex,
              onTap: onTabTapped,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.blueAccent),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.blueAccent),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined,
                        color: Colors.blueAccent),
                    label: "Chats"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
