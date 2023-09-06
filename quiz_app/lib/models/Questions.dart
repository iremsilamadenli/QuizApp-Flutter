class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        " What is the chemical symbol for water?",
    "options": ['H2O', 'CO2', 'NaCl', 'O2'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Which continent is known as the Land Down Under? ",
    "options": ['Asia', 'Africa', 'Australia', 'Europe'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": " Which film won the Academy Award for Best Picture in 2020?",
    "options": ['Parasite', '1917', 'Joker', 'The Shape of Water'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];