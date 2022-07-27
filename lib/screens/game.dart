import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/gameModel.dart';
import '../widgets/gameScreen.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);

  // let's declare a list of the instance of gameModel
  List<GameModel> ListGameModel = [
    GameModel(
      image: 'asset/bmw.jpg',
      answerA: 'Mercedes',
      answerB: 'ford',
      answerC: 'bmw',
      answerD: 'tesla',
      correctAnswer: 'bmw',
    ),
    GameModel(
      image: 'asset/cat.jpg',
      answerA: 'dog',
      answerB: 'pig',
      answerC: 'cat',
      answerD: 'monkey',
      correctAnswer: 'cat',
    ),
    GameModel(
      image: 'asset/imageGuesser.jpg',
      answerA: 'phone',
      answerB: 'ford',
      answerC: 'game pad',
      answerD: 'tesla',
      correctAnswer: 'game pad',
    ),
    GameModel(
      image: 'asset/Lamborghini.jpg',
      answerA: 'lamb',
      answerB: 'Lamborghini',
      answerC: 'Venza',
      answerD: 'f1 runner',
      correctAnswer: 'Lamborghini',
    ),
    GameModel(
      image: 'asset/mice.jpg',
      answerA: 'parrot',
      answerB: 'mice',
      answerC: 'chicken',
      answerD: 'lion',
      correctAnswer: 'mice',
    ),
    GameModel(
      image: 'asset/porsche.jpg',
      answerA: 'tesla',
      answerB: 'mice',
      answerC: 'porsche',
      answerD: 'bmw',
      correctAnswer: 'porsche',
    ),
    GameModel(
      image: 'asset/volkswagen_beetle.jpg',
      answerA: 'bugatti',
      answerB: 'volkswagen beetle',
      answerC: 'hyundai',
      answerD: 'sienna',
      correctAnswer: 'volkswagen beetle',
    ),
  ];

  Timer? _timer;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int counter = 40;
  late String countdown;

  void startTimer_fortime() {
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(
          () {
            if (seconds < 0) {
              timer.cancel();
            } else {
              seconds = seconds + 1;
              if (seconds > 59) {
                minutes += 1;
                seconds = 0;
                if (minutes > 59) {
                  hours += 1;
                  minutes = 0;
                }
              }
              countdown = "$hours : $minutes : $seconds";
              print("$seconds : $minutes : $hours");
            }
          },
        );
      },
    );
  }

  void countDown() {
    //   here lets define our duration of timing
    Duration _duration = Duration(seconds: 1);
    //  lets declare our timer
    _timer = new Timer.periodic(_duration, (timer) {
      if (counter > 0) {
        setState(() {
          counter = counter - 1;
          countdown = counter.toString();
        });

        //   counter-=1;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  initState() {
    // this is for our hardcoded clock timing
    // startTimer_fortime();
    countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (ind) {
                setState(() {
                  index = ind;
                });
              },
              itemCount: ListGameModel.length,
              itemBuilder: (context, index) {
                this.index = index;
                return GameScreen(
                  sugestiona: ListGameModel[index].answerA,
                  sugestionb: ListGameModel[index].answerB,
                  sugestionc: ListGameModel[index].answerC,
                  sugestiond: ListGameModel[index].answerD,
                  correctAnswer: ListGameModel[index].correctAnswer,
                  image: ListGameModel[index].image,
                );
              },
            ),
          ),

          // this container holds the  NEXT and PREVIOUS buttons for this page
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index == 0
                    ? const SizedBox()

                    // this container holds the  PREVIOUS button for this page
                    : Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff502989),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: TextButton(
                            onPressed: () {
                              controller.previousPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeOut);
                            },
                            child: Text(
                              "Prev",
                              style: GoogleFonts.aldrich(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),

                Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(" Score : 0  ",textAlign: TextAlign.center,style: GoogleFonts.aldrich(fontSize: 20, fontWeight: FontWeight.bold),),

                    Text("$countdown Secs To Go  ",textAlign: TextAlign.center,style: GoogleFonts.aldrich(fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                )),

                // this container holds the  NEXT button for this page
                Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xff502989),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          "Next",
                          style: GoogleFonts.aldrich(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
