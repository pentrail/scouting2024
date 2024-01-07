import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restart_app/restart_app.dart';

class Scan extends StatelessWidget {
  const Scan({super.key, required this.autoLeftStartingZone, required this.autoAmpNotesScored, required this.autoAmpNotesMissed, required this.autoSpeakerNotesScored, required this.autoSpeakerNotesMissed, required this.teleNotesRetrievedSource, required this.teleNotesMissedSource, required this.teleAmpNotesScored, required this.teleAmpNotesMissed, required this.teleSpeakerNotesScored, required this.teleSpeakerNotesMissed, required this.teleBumps, required this.robotFellOver, required this.robotStoppedWorking, required this.endingStage, required this.noteInTrap, required this.robotFellOffStage, required this.rankingPoints, required this.allianceScore, required this.personalNotes, required this.scouterName, required this.teamNumber, required this.matchNumber, required this.robotNeverShowedUp});

  final String? scouterName;
  final String? teamNumber;
  final String matchNumber;
  final String autoLeftStartingZone;
  final String autoAmpNotesScored;
  final String autoAmpNotesMissed;
  final String autoSpeakerNotesScored;
  final String autoSpeakerNotesMissed;
  final String teleNotesRetrievedSource;
  final String teleNotesMissedSource;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${scouterName?.split(" ")[0]}'s Generated QR Code"),
        centerTitle: true,
      ),
      body: ListView(
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
              data: (matchNumber + '*' +
              teamNumber! + '*' +
              scouterName! + '*' +
              allianceScore + '*' +
              rankingPoints + '*' +
              autoAmpNotesScored + '*' +
              autoAmpNotesMissed + '*' +
              autoSpeakerNotesScored + '*' +
              autoSpeakerNotesMissed + '*' +
              autoLeftStartingZone + '*' +
              teleNotesRetrievedSource + '*' +
              teleNotesMissedSource + '*' +
              teleAmpNotesScored + '*' +
              teleAmpNotesMissed + '*' +
              teleSpeakerNotesScored + '*' +
              teleSpeakerNotesMissed + '*' +
              teleBumps + '*' +
              robotFellOver + '*' +
              robotNeverShowedUp + '*' +
              robotStoppedWorking + '*' +
              endingStage! + '*' +
              noteInTrap + '*' +
              robotFellOffStage + '*' +
              personalNotes),
              version: QrVersions.auto,
              padding: EdgeInsets.all(30),
              size: (MediaQuery.of(context).size.width * 0.78 > MediaQuery.of(context).size.height * 0.78 ? MediaQuery.of(context).size.height * 0.78 : MediaQuery.of(context).size.width * 0.78),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
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
                onPressed: () {
                  Restart.restartApp();
                },
                child: const Text('Scout Again',
                  style: TextStyle(fontSize: 25)
                ),
              )
            )
          ),
        ]
      )
    );
  }
}
