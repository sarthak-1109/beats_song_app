import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/consts/colors.dart';
import 'package:music_project/consts/text_style.dart';
import 'package:music_project/controller/player_controller.dart';
import 'package:music_project/views/login.dart';
import 'package:music_project/views/player.dart';
import 'package:music_project/views/premium_page.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controller/shared_pref.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PreferencesService _prefsService = PreferencesService();

  @override
  Widget build(BuildContext context) {
    Future<void> _markGrooveAsPremium() async {
      int dhoomSongId = 1;
      await _prefsService.setSongAsPremium(dhoomSongId);
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
        content: Text('Groove has been marked as premium.'),
      ));
    }

    var controller = Get.put(PlayerController());
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFF662D8C), Color(0xffED1E79)])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.sort_rounded,
                      color: Colors.white,
                    ))),
            title: Text(
              'Bajao Bhai',
              style: ourStyle(),
            ),
          ),
          drawer: Builder(
            builder: (BuildContext context) {
              return Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0XFF662D8C), Color(0xffED1E79)])),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 90,
                              width: 90,
                              child: Image.asset('assets/prime.png'))
                        ],
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Add a song as callertune',
                            style: TextStyle(color: sliderColor),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.add_alert_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // D// Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('Download multiple songs',
                              style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 48,
                          ),
                          Icon(
                            Icons.music_note,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('Watch video of songs',
                              style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 76,
                          ),
                          Icon(
                            Icons.music_video_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // D // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('No ads', style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('Skip More then 3 songs',
                              style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('Watch foreign language songs',
                              style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('Song Suggestions',
                              style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('Unlimited Access',
                              style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('No ads', style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('No ads', style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text('No ads', style: TextStyle(color: sliderColor)),
                          SizedBox(
                            width: 186,
                          ),
                          Icon(
                            Icons.add_comment_sharp,
                            color: sliderColor,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Premium Required"),
                              content: Text(
                                  "This content is only available for premium users."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Become Premium"),
                                  onPressed: () {
                                    // Implement functionality to become premium
                                    // This could navigate to a purchase screen or show more details
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PremiumPage())); // Dismiss dialog
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Simply dismiss the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // Handle item tap
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                              signOut();
                            },
                            icon: Icon(
                              Icons.logout,
                              color: sliderColor,
                            )),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          body: FutureBuilder<List<SongModel>>(
              future: controller.audioQuery.querySongs(
                  ignoreCase: true,
                  orderType: OrderType.ASC_OR_SMALLER,
                  sortType: null,
                  uriType: UriType.EXTERNAL),
              builder: (BuildContext context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No Song Found',
                      style: ourStyle(),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.white)),
                              child: Obx(
                                () => ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  title: Text(
                                    snapshot.data![index].displayNameWOExt,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  subtitle: Text(
                                    "${snapshot.data![index].artist}",
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  leading: QueryArtworkWidget(
                                    id: snapshot.data![index].id,
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget: const Icon(
                                      Icons.music_note,
                                      color: whiteColor,
                                      size: 32,
                                    ),
                                  ),
                                  trailing:
                                      controller.playIndex.value == index &&
                                              controller.isPlaying.value
                                          ? const Icon(
                                              Icons.play_arrow,
                                              color: whiteColor,
                                              size: 26,
                                            )
                                          : null,
                                  onTap: () {
                                    if (snapshot
                                            .data![index].displayNameWOExt ==
                                        'Groove') {
                                      _markGrooveAsPremium();
                                    } else {
                                      Get.to(
                                          () => PlayerPage(
                                                data: snapshot.data!,
                                              ),
                                          transition: Transition.downToUp);
                                      controller.playSong(
                                          snapshot.data![index].uri, index);
                                    }
                                  },
                                ),
                              ));
                        }),
                  );
                }
              })),
    );
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error');
    }
  }
}
