import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
      {Key? key,
        required this.sugestiona,
        required this.sugestionb,
        required this.sugestionc,
        required this.sugestiond,
        required this.correctAnswer,
        required this.image})
      : super(key: key);

        final String? sugestiona;
        final String? sugestionb;
        final String? sugestionc;
        final String? sugestiond;
        final String? correctAnswer;
        final String? image;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool answerIsA = false,
      answerIsB = false,
      answerIsC = false,
      answerIsD = false;
  bool isClickedA = false,
      isClickedB = false,
      isClickedC = false,
      isClickedD = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              // the top image art card containing image
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                elevation: 20,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      widget.image!,
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What is my name?",
                  style: GoogleFonts.aldrich(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Flexible(
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black, width: 1),
                                  color: isClickedA && answerIsA
                                      ? Colors.green
                                      : isClickedA && !answerIsA
                                      ? Colors.red
                                      : const Color(0xff9F05C5)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isClickedA = true;
                                  });
                                  if (widget.sugestiona == widget.correctAnswer) {
                                    setState(() {
                                      answerIsA = true;
                                      isClickedA = true;
                                    });
                                  } else if (widget.sugestionb ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsB = true;
                                      isClickedB = true;
                                    });
                                  }else if (widget.sugestionc ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsC = true;
                                      isClickedC = true;
                                    });
                                  }else if (widget.sugestiond ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsD = true;
                                      isClickedD = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "a. ",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${widget.sugestiona}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black, width: 1),
                                  color: isClickedB && answerIsB
                                      ? Colors.green
                                      : isClickedB && !answerIsB
                                      ? Colors.red
                                      : const Color(0xff9F05C5)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isClickedB = true;
                                  });
                                  if (widget.sugestiona == widget.correctAnswer) {
                                    setState(() {
                                      answerIsA = true;
                                      isClickedA = true;
                                    });
                                  } else if (widget.sugestionb ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsB = true;
                                      isClickedB = true;
                                    });
                                  }else if (widget.sugestionc ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsC = true;
                                      isClickedC = true;
                                    });
                                  }else if (widget.sugestiond ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsD = true;
                                      isClickedD = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "b. ",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.aldrich(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${widget.sugestionb}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aldrich(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black, width: 1),
                                  color: isClickedC && answerIsC
                                      ? Colors.green
                                      : isClickedC && !answerIsC
                                      ? Colors.red
                                      : const Color(0xff9F05C5)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isClickedC = true;
                                  });
                                  if (widget.sugestiona == widget.correctAnswer) {
                                    setState(() {
                                      answerIsA = true;
                                      isClickedA = true;
                                    });
                                  } else if (widget.sugestionb ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsB = true;
                                      isClickedB = true;
                                    });
                                  }else if (widget.sugestionc ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsC = true;
                                      isClickedC = true;
                                    });
                                  }else if (widget.sugestiond ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsD = true;
                                      isClickedD = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: SizedBox(
                                        child: Text(
                                          "c. ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.aldrich(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          "${widget.sugestionc}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aldrich(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black, width: 1),
                                  color: isClickedD && answerIsD
                                      ? Colors.green
                                      : isClickedD && !answerIsD
                                      ? Colors.red
                                      : const Color(0xff9F05C5)),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isClickedD = true;
                                  });
                                  if (widget.sugestiona == widget.correctAnswer) {
                                    setState(() {
                                      answerIsA = true;
                                      isClickedA = true;
                                    });
                                  } else if (widget.sugestionb ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsB = true;
                                      isClickedB = true;
                                    });
                                  }else if (widget.sugestionc ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsC = true;
                                      isClickedC = true;
                                    });
                                  }else if (widget.sugestiond ==
                                      widget.correctAnswer) {
                                    setState(() {
                                      answerIsD = true;
                                      isClickedD = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "d. ",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.aldrich(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${widget.sugestiond}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.aldrich(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ))
          ],
        ));
  }
}
