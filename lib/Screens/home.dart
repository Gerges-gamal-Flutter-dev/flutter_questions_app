import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/questionModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  int score = 0;
  bool isSelected = false;
  Answers? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/photos/images (1).jpeg',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Simple Quiz App",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      "Question ${index + 1} / ${question.length}",
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 400,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 233, 152, 3).withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              question[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: -45,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color.fromARGB(255, 233, 152, 3),
                      ),
                    ),
                    const Positioned(
                      right: -45,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    const Positioned(
                      top: -50,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.check,
                          size: 45,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                for (var i = 0; i < question[index].answers.length; i++)
                  answerButton(question[index].answers[i]),
                buttonRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget answerButton(Answers ans) {
    isSelected = ans == selectedAnswer;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: MaterialButton(
        minWidth: 200,
        height: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          setState(() {
            selectedAnswer = ans;
          });
        },
        color: isSelected ? Colors.green : Colors.white,
        elevation: 5,
        child: Text(
          ans.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget buttonRow() {
    bool isLastQuestion = index == question.length - 1;
    bool isFirstQuestion = index == 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isFirstQuestion)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (index > 0) index--;
                  selectedAnswer = null;
                  isSelected = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Back',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        if (!isFirstQuestion) const SizedBox(width: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              if (selectedAnswer != null && selectedAnswer!.isCorrect) {
                score++;
              }
              if (isLastQuestion) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                     title: RichText(
                     text: TextSpan(
                      children: [
                         TextSpan(
                         text: score > question.length * 0.6 ? "Passed " : "Failed ",
                         style: TextStyle(
                         color: score > question.length * 0.6 ? Colors.green : Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                   ),
                    TextSpan(
                      text: "| score is $score",
                     style:const TextStyle(
                     color: Colors.black, 
                     fontWeight: FontWeight.normal,
                   ),
              ),
            ],
           ),
         ),
          content: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            score = 0;
                            index = 0;
                            selectedAnswer = null;
                            isSelected = false;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 5,
                        ),
                        child: const Text(
                          "Restart",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                setState(() {
                  index++;
                  selectedAnswer = null;
                  isSelected = false;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
         