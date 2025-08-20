import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/widgets/text.dart';

class PianoWidget extends StatefulWidget {
  const PianoWidget({super.key});

  @override
  State<PianoWidget> createState() => _PianoWidgetState();
}

class _PianoWidgetState extends State<PianoWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final _currentOctave = 4;
  final List<String> whiteKeys = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  final Map<String, double> blackKeyOffsets = {
    'Db': 0.7,
    'Eb': 1.7,
    'Gb': 3.7,
    'Ab': 4.7,
    'Bb': 5.7,
  };

  String getFileName(String note) => '$note$_currentOctave.mp3';

  void _playNote(String note) async {
    try {
      await _audioPlayer.play(AssetSource('sounds/${getFileName(note)}'));
    } catch (e) {
      // print('Error playing $note: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double pianoWidth = 280;
    double whiteKeyWidth = pianoWidth / 7;
    double whiteKeyHeight = 150;
    double blackKeyWidth = whiteKeyWidth * 0.6;
    double blackKeyHeight = 100;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PhysicalModel(
          clipBehavior: Clip.none,
          elevation: 8,
          color: Colors.transparent,
          child: Container(
            height: whiteKeyHeight + 20,
            decoration: BoxDecoration(
              color: AppColors.redPiano,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: pianoWidth,
              height: whiteKeyHeight,
              child: Stack(
                children: [
                  // White keys
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:
                        whiteKeys.map((note) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => _playNote(note),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: AppColors.grey025,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: MyText(
                                    text: note,
                                    fontSize: 12,
                                    color: AppColors.grey600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  // Black keys
                  ...blackKeyOffsets.entries.map((entry) {
                    String note = entry.key;
                    double offset = entry.value;
                    return Positioned(
                      left: whiteKeyWidth * offset,
                      top: 0,
                      child: GestureDetector(
                        onTap: () => _playNote(note),
                        child: Container(
                          width: blackKeyWidth,
                          height: blackKeyHeight,
                          decoration: BoxDecoration(
                            color: AppColors.grey1000,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
