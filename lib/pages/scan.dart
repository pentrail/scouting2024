import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restart_app/restart_app.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

int timestamp = DateTime.now().millisecondsSinceEpoch;

DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
String datetime = "${tsdate.month}/${tsdate.day}/${tsdate.year}  ${tsdate.hour}:${tsdate.minute}";

class Scan extends StatefulWidget {
  const Scan({super.key, required this.autoLeftStartingZone, required this.autoAmpNotesScored, required this.autoAmpNotesMissed, required this.autoSpeakerNotesScored, required this.autoSpeakerNotesMissed, required this.teleNotesRetrievedSource, required this.teleNotesRetrievedFloor, required this.teleAmpNotesScored, required this.teleAmpNotesMissed, required this.teleSpeakerNotesScored, required this.teleSpeakerNotesMissed, required this.teleBumps, required this.robotFellOver, required this.robotStoppedWorking, required this.endingStage, required this.noteInTrap, required this.robotFellOffStage, required this.rankingPoints, required this.allianceScore, required this.personalNotes, required this.scouterName, required this.teamNumber, required this.matchNumber, required this.robotNeverShowedUp});

  final String? scouterName;
  final String? teamNumber;
  final String matchNumber;
  final String autoLeftStartingZone;
  final String autoAmpNotesScored;
  final String autoAmpNotesMissed;
  final String autoSpeakerNotesScored;
  final String autoSpeakerNotesMissed;
  final String teleNotesRetrievedSource;
  final String teleNotesRetrievedFloor;
  final String teleAmpNotesScored;
  final String teleAmpNotesMissed;
  final String teleSpeakerNotesScored;
  final String teleSpeakerNotesMissed;
  final String teleBumps;
  final String robotNeverShowedUp;
  final String robotFellOver;
  final String robotStoppedWorking;
  final String? endingStage;
  final String noteInTrap;
  final String robotFellOffStage;
  final String rankingPoints;
  final String allianceScore;
  final String personalNotes;

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  final GlobalKey _shotKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  
  @override
  Widget build(BuildContext context) { 

    final appBar = AppBar(); //Need to instantiate this here to get its size
    final bodyHeight = MediaQuery.of(context).size.height - (appBar.preferredSize.height + MediaQuery.of(context).padding.top);   

    final scanText = '${widget.matchNumber}*${widget.teamNumber!}*${widget.scouterName!}*${widget.allianceScore}*${widget.rankingPoints}*${widget.autoAmpNotesScored}*${widget.autoAmpNotesMissed}*${widget.autoSpeakerNotesScored}*${widget.autoSpeakerNotesMissed}*${widget.autoLeftStartingZone}*${widget.teleNotesRetrievedSource}*${widget.teleNotesRetrievedFloor}*${widget.teleAmpNotesScored}*${widget.teleAmpNotesMissed}*${widget.teleSpeakerNotesScored}*${widget.teleSpeakerNotesMissed}*${widget.teleBumps}*${widget.robotFellOver}*${widget.robotNeverShowedUp}*${widget.robotStoppedWorking}*${widget.endingStage!}*${widget.noteInTrap}*${widget.robotFellOffStage}*${widget.personalNotes}';

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.scouterName?.split(" ")[0]}'s Generated QR Code"),
        centerTitle: true,
      ),
      body: WidgetShot(
        key: _shotKey,
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 20),
            child: Text("Please Present This QR Code To The Scanner",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ))
            ),
            Container(
              alignment: Alignment.center,
              child: QrImageView(
                // ignore: prefer_interpolation_to_compose_strings
                data: (scanText),
                version: QrVersions.auto,
                padding: const EdgeInsets.all(30),
                size: (MediaQuery.of(context).size.width * 0.78 > bodyHeight * 0.78 ? bodyHeight * 0.78 : MediaQuery.of(context).size.width * 0.78),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15, top: 20),
              child: Text("(Match ${widget.matchNumber})\n$datetime",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 20),
              child: Text(scanText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13.0,
                )
              )
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(50),
              child: ButtonTheme(
                minWidth: 500,
                height: 100,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(50, 25, 50, 25))
                  ),
                  onPressed: () async {

                    final prefs = await SharedPreferences.getInstance();
                    prefs.setInt('match', (int.parse(widget.matchNumber)) + 1);

                    WidgetShotRenderRepaintBoundary repaintBoundary =
                    _shotKey.currentContext!.findRenderObject() as WidgetShotRenderRepaintBoundary;
                    var resultImage = await repaintBoundary.screenshot(
                        scrollController: _scrollController,
                        backgroundColor: Colors.black,
                        format: ShotFormat.png,
                        pixelRatio: 1);

                    try {
                      await ImageGallerySaver.saveImage(resultImage!);
                    } catch (error) {
                      debugPrint("error = $error");
                    }

                    Restart.restartApp();
                  },
                  child: const Text('Scout Again',
                    style: TextStyle(fontSize: 25)
                  ),
                )
              )
            ),
          ]
        ),
      )
    );
  }
}
