import 'package:animate_do/animate_do.dart';
import 'package:audio_session/audio_session.dart';
import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'components/common.dart';

class MyApp extends StatefulWidget {
  final String url;
  final VoidCallback press;
  final String title;
  final String? author;
  MyApp(
      {required this.url,
      required this.press,
      required this.title,
      this.author});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(widget.url)));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding?.instance.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    const double textSize = 10;
    return Container(
      decoration: backGroundGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: currentWidth < mobileWidth
              ? mobileAppBarHeight
              : desktopAppBarHeight,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueGrey,
              size: currentWidth < mobileWidth
                  ? mobileAppIconSize
                  : desktopAppIconSize,
            ),
            onPressed: widget.press,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                  delay: Duration(seconds: 3),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: currentWidth < mobileWidth ? 20 : 23,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: currentWidth < mobileWidth ? 12 : 6,
                ),
                // Display play/pause button and volume/speed sliders.
                ControlButtons(_player),
                sizedBoxNullCheck(),
                DelayedDisplay(
                  delay: Duration(seconds: 5),
                  child: Text(
                    "${authorNullCheck()}",
                    style: TextStyle(
                        fontSize: currentWidth < mobileWidth ? 20 : 23,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Display seek bar. Using StreamBuilder, this widget rebuilds
                // each time the position, buffered position or duration changes.
                StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      duration: positionData?.duration ?? Duration.zero,
                      position: positionData?.position ?? Duration.zero,
                      bufferedPosition:
                          positionData?.bufferedPosition ?? Duration.zero,
                      onChangeEnd: _player.seek,
                    );
                  },
                ),
                //TODO: Add ad banner here.  It should appear below the seekbar. I think you can make the ad banner appear at the bottom by using an expanded widget.
              ],
            ),
          ),
        ),
      ),
    );
  }

  String authorNullCheck() {
    if (widget.author == null) {
      return "";
    } else
      return " ${widget.author}";
  }

  SizedBox sizedBoxNullCheck() {
    if (widget.author == null) {
      return SizedBox();
    } else
      return SizedBox(
        height: getProportionateScreenWidth(2),
      );
  }
}

/// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    const double mobileAudioImage = 350;
    const double desktopAudioImage = 330;
    const double mobileTextSize = 15;
    const double desktopTextSize = 15;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ZoomIn(
            duration: Duration(milliseconds: 1200),
            child: Container(
              width: currentWidth < mobileWidth
                  ? mobileAudioImage
                  : desktopAudioImage,
              height: currentWidth < mobileWidth
                  ? mobileAudioImage
                  : desktopAudioImage,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/deep_breath_logo2.png"))),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(2),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Opens volume slider dialog
                IconButton(
                  icon: Icon(Icons.volume_up),
                  onPressed: () {
                    showSliderDialog(
                      context: context,
                      title: "Adjust volume",
                      divisions: 10,
                      min: 0.0,
                      max: 1.0,
                      value: player.volume,
                      stream: player.volumeStream,
                      onChanged: player.setVolume,
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),

                /// This StreamBuilder rebuilds whenever the player state changes, which
                /// includes the playing/paused state and also the
                /// loading/buffering/ready state. Depending on the state we show the
                /// appropriate button or loading indicator.
                StreamBuilder<PlayerState>(
                  stream: player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        width: 64.0,
                        height: 64.0,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (playing != true) {
                      return IconButton(
                        icon: Icon(Icons.play_arrow),
                        iconSize: 64.0,
                        onPressed: player.play,
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        icon: Icon(Icons.pause),
                        iconSize: 64.0,
                        onPressed: player.pause,
                      );
                    } else {
                      return IconButton(
                        icon: Icon(Icons.replay),
                        iconSize: 64.0,
                        onPressed: () => player.seek(Duration.zero),
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                // Opens speed slider dialog
                StreamBuilder<double>(
                  stream: player.speedStream,
                  builder: (context, snapshot) => IconButton(
                    icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      showSliderDialog(
                        context: context,
                        title: "Adjust speed",
                        divisions: 10,
                        min: 0.5,
                        max: 1.5,
                        value: player.speed,
                        stream: player.speedStream,
                        onChanged: player.setSpeed,
                      );
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
