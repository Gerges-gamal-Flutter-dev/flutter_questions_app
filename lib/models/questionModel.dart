

class Question {
  String title;
  List answers;

  Question({required this.title, required this.answers});
}

class Answers {
  String title;
  bool isCorrect;

  Answers({required this.title, required this.isCorrect});
}

List<Question> question = [
  Question(
    title: "Who is owner of flutter?",
    answers: [
      Answers(title: "Google", isCorrect: true),
      Answers(title: "Apple", isCorrect: false),
      Answers(title: "Microsoft", isCorrect: false ),
      Answers(title: "Meta", isCorrect: false),
    ]
    ),


    Question(
    title: "Which Flutter tool is used to build cross-platform user interfaces?",
    answers: [
      Answers(title: "Xamarin", isCorrect: false),
      Answers(title: "React Native", isCorrect: false),
      Answers(title: "Flutter", isCorrect: true ),
      Answers(title: "Ionic", isCorrect: false),
    ]
    ),
   

    Question(
    title: "Which of the following options is used to define layout in Flutter?",
    answers: [
      Answers(title: "Column", isCorrect: true),
      Answers(title: "Scaffold", isCorrect: false),
      Answers(title: "Widget", isCorrect: false ),
      Answers(title: "Container", isCorrect: false),
    ]
    ),
   

    Question(
    title: "Which tool is used to manage the state of the application in Flutter?",
    answers: [
      Answers(title: "ListView", isCorrect: false),
      Answers(title: "Provider", isCorrect: true),
      Answers(title: "GestureDetector", isCorrect: false ),
      Answers(title: "Hero", isCorrect: false),
    ]
    ),

     Question(
    title: "What command is used to install packages in a Flutter project?",
    answers: [
      Answers(title: "flutter run", isCorrect: false),
      Answers(title: "flutter build", isCorrect: false),
      Answers(title: " flutter pub get", isCorrect: true ),
      Answers(title: "flutter analyze", isCorrect: false),
    ]
    ),

      Question(
    title: "Which of the following options is used to display a vertically scrolling list in Flutter?",
    answers: [
      Answers(title: "GridView", isCorrect: false),
      Answers(title: "ListView", isCorrect: true),
      Answers(title: " Table", isCorrect: false ),
      Answers(title: "Stack", isCorrect: false),
    ]
    ),

      Question(
    title: "Which tool is used to add padding around a widget in Flutter?",
    answers: [
      Answers(title: "Margin", isCorrect: false),
      Answers(title: "Spacer", isCorrect: false),
      Answers(title: " Padding", isCorrect: true ),
      Answers(title: "Divider", isCorrect: false),
    ]
    ),

      Question(
    title: "What is the name of the object used to represent the application window in Flutter?",
    answers: [
      Answers(title: "AppBar", isCorrect: false),
      Answers(title: "MaterialApp", isCorrect: true),
      Answers(title: " Scaffold", isCorrect: false ),
      Answers(title: " StatefulWidget", isCorrect: false),
    ]
    ),

    Question(
    title: "Who is the founder of Facebook ?",
    answers: [
      Answers(title: "Mark Zuckerberg", isCorrect: true),
      Answers(title: "Stave Jobs", isCorrect: false),
      Answers(title: "Bill Gates", isCorrect: false ),
      Answers(title: "Jeff Bezos", isCorrect: false),
    ]
    ),
];
