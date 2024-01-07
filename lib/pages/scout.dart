import 'package:flutter/material.dart';
import 'package:scouting2024/widgets/increment.dart';
import 'package:scouting2024/widgets/checkbox.dart';
import 'package:scouting2024/widgets/formText.dart';
import 'package:scouting2024/widgets/formTitle.dart';
import 'package:scouting2024/widgets/dropdown.dart';
import 'package:scouting2024/pages/scan.dart';
import 'package:scouting2024/widgets/slider.dart';

const List<String> endingStages = <String>[
  'PARKED',
  'ONSTAGE',
  'ONSTAGE + HARMONY',
  'Not PARKED or ONSTAGE'
];

bool autoLeftStartingZone = false;

int autoAmpNotesScored = 0;
int autoAmpNotesMissed = 0;
int autoSpeakerNotesScored = 0;
int autoSpeakerNotesMissed = 0;

int teleNotesRetrievedSource = 0;
int teleNotesMissedSource = 0;
int teleAmpNotesScored = 0;
int teleAmpNotesMissed = 0;
int teleSpeakerNotesScored = 0;
int teleSpeakerNotesMissed = 0;
int teleBumps = 0;

bool robotFellOver = false;
bool robotStoppedWorking = false;
bool robotNeverShowedUp = false;

String? endingStage;

bool noteInTrap = false;
bool robotFellOffStage = false;

double rankingPoints = 0;
final allianceScore = TextEditingController();

final personalNotes = TextEditingController();

class ScoutPage extends StatefulWidget {

  final String? scouterName;
  final String? teamNumber;
  final String matchNumber;
  
  const ScoutPage({super.key, required this.scouterName, required this.teamNumber, required this.matchNumber});

  @override
  State<ScoutPage> createState() => _ScoutPageState();
}

class _ScoutPageState extends State<ScoutPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.scouterName?.split(" ")[0]}'s Scouting Data | Match ${widget.matchNumber} | Team ${widget.teamNumber}"),
        centerTitle: true,
      ),
      body: ListView(
        children: [ Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              FormTitle203(text: "Autonomous Data"),

              Checkbox203(text: "Robot Left Starting Zone", field: autoLeftStartingZone,
                callback: (p0) {
                  setState(() {
                    autoLeftStartingZone = p0;
                  });
                }
              ),

              FormText203(text: "AMP Notes Scored"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: autoAmpNotesScored,
                callback: (p0) {
                  setState(() {
                    autoAmpNotesScored = p0;
                  });
                }),
              ),

              FormText203(text: "AMP Notes Missed"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: autoAmpNotesMissed,
                callback: (p0) {
                  setState(() {
                    autoAmpNotesMissed = p0;
                  });
                }),
              ),

              const SizedBox(height: 30),

              FormText203(text: "SPEAKER Notes Scored"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: autoSpeakerNotesScored,
                callback: (p0) {
                  setState(() {
                    autoSpeakerNotesScored = p0;
                  });
                }),
              ),

              FormText203(text: "SPEAKER Notes Missed"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: autoSpeakerNotesMissed,
                callback: (p0) {
                  setState(() {
                    autoSpeakerNotesMissed = p0;
                  });
                }),
              ),

              const SizedBox(height: 10),
              FormTitle203(text: "Teleoperated Data"),

              FormText203(text: "Notes Retrieved From SOURCE"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleNotesRetrievedSource,
                callback: (p0) {
                  setState(() {
                    teleNotesRetrievedSource = p0;
                  });
                }),
              ),

              FormText203(text: "Notes Missed From SOURCE"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleNotesMissedSource,
                callback: (p0) {
                  setState(() {
                    teleNotesMissedSource = p0;
                  });
                }),
              ),

              const SizedBox(height: 30),

              FormText203(text: "AMP Notes Scored"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleAmpNotesScored,
                callback: (p0) {
                  setState(() {
                    teleAmpNotesScored = p0;
                  });
                }),
              ),

              FormText203(text: "AMP Notes Missed"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleAmpNotesMissed,
                callback: (p0) {
                  setState(() {
                    teleAmpNotesMissed = p0;
                  });
                }),
              ),

              const SizedBox(height: 30),

              FormText203(text: "SPEAKER Notes Scored"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleSpeakerNotesScored,
                callback: (p0) {
                  setState(() {
                    teleSpeakerNotesScored = p0;
                  });
                }),
              ),

              FormText203(text: "SPEAKER Notes Missed"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleSpeakerNotesMissed,
                callback: (p0) {
                  setState(() {
                    teleSpeakerNotesMissed = p0;
                  });
                }),
              ),

              const SizedBox(height: 30),

              FormText203(text: "Major Bump With Another Robot"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Increment203(counter: teleBumps,
                callback: (p0) {
                  setState(() {
                    teleBumps = p0;
                  });
                }),
              ),

              FormTitle203(text: "Endgame"),

              FormText203(text: "Ending Stage:"),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Dropdown203(options: endingStages, selected: endingStage, hintText: "SELECT",
                callback: (p0) {
                  setState(() {
                    endingStage = p0;
                  });
                }) 
              ),
              
              Checkbox203(text: "Note scored in TRAP", field: noteInTrap,
                callback: (p0) {
                  setState(() {
                    noteInTrap = p0;
                  });
                }
              ),

              Checkbox203(text: "Robot fell off STAGE", field: robotFellOffStage,
                callback: (p0) {
                  setState(() {
                    robotFellOffStage = p0;
                  });
                }
              ),

              FormTitle203(text: "Observations:"),

              Checkbox203(text: "Robot Never Moved / Didn't Show Up", field: robotNeverShowedUp,
                callback: (p0) {
                  setState(() {
                    robotNeverShowedUp = p0;
                  });
                }
              ),

              Checkbox203(text: "Robot Fell Over", field: robotFellOver,
                callback: (p0) {
                  setState(() {
                    robotFellOver = p0;
                  });
                }
              ),
              
              Checkbox203(text: "Robot Stopped Working", field: robotStoppedWorking,
                callback: (p0) {
                  setState(() {
                    robotStoppedWorking = p0;
                  });
                }
              ),

              FormTitle203(text: "Final Scores"),

              FormText203(text: "Alliance Ranking Points:"),

              Slider203(max: 4, divisions: 4, value: rankingPoints,
                callback: (p0) {
                  setState(() {
                    rankingPoints = p0;
                  });
                }
              ),

              FormText203(text: "Alliance Final Score:"),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: allianceScore,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the final alliance score';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70, width: 2)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                    hintText: 'Alliance Final Score',
                  ),
                ),
              ),

              FormTitle203(text: "Other:"),

              FormText203(text: "Personal Notes (Optional):"),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: TextFormField(
                  controller: personalNotes,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70, width: 2)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
                    hintText: 'Strategy, Autonomous Path, Drivetrain Type, What Broke, Penalties, etc.',
                  ),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(50),
                  child: ButtonTheme(
                    minWidth: 500,
                    height: 100,
                    child: FilledButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          // side: const BorderSide(color: Colors.white)
                        )),
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(50, 25, 50, 25))
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scan(
                                scouterName: widget.scouterName,
                                matchNumber: widget.matchNumber,
                                teamNumber: widget.teamNumber,
                                autoLeftStartingZone: (autoLeftStartingZone ? "TRUE" : "FALSE"),
                                autoAmpNotesScored: autoAmpNotesScored.toString(),
                                autoAmpNotesMissed: autoAmpNotesMissed.toString(),
                                autoSpeakerNotesScored: autoSpeakerNotesScored.toString(),
                                autoSpeakerNotesMissed: autoSpeakerNotesMissed.toString(),
                                teleNotesRetrievedSource: teleNotesRetrievedSource.toString(),
                                teleNotesMissedSource: teleNotesMissedSource.toString(),
                                teleAmpNotesScored: teleAmpNotesScored.toString(),
                                teleAmpNotesMissed: teleAmpNotesMissed.toString(),
                                teleSpeakerNotesScored: teleSpeakerNotesScored.toString(),
                                teleSpeakerNotesMissed: teleSpeakerNotesMissed.toString(),
                                teleBumps: teleBumps.toString(),
                                robotFellOver: (robotFellOver ? "TRUE" : "FALSE"),
                                robotStoppedWorking: (robotStoppedWorking ? "TRUE" : "FALSE"),
                                robotNeverShowedUp: (robotNeverShowedUp ? "TRUE" : "FALSE"),
                                endingStage: endingStage,
                                noteInTrap: (noteInTrap ? "TRUE" : "FALSE"),
                                robotFellOffStage: (robotFellOffStage ? "TRUE" : "FALSE"),
                                rankingPoints: rankingPoints.toString(),
                                allianceScore: allianceScore.text,
                                personalNotes: personalNotes.text
                              )),
                          );
                        }
                      },
                      child: const Text('Submit',
                        style: TextStyle(fontSize: 25)
                      ),
                    )
                  )
                ),
              ),
            ]
          )
        ),
      ])
    );
  }
}
