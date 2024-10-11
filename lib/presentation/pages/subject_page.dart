import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  final String subjectName;

  const SubjectPage({Key? key, required this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fake data
    final subjectData = {
      'timeSpent': '15h 30m',
      'questionsAnswered': 250,
      'correctRate': 0.75,
      'averageDailyTime': '45m',
      'averageDailyQuestions': 25,
      'streak': 7,
      'lastPractice': '2023-04-15',
    };

    final recentQuestions = [
      {
        'question': 'What is the capital of France?',
        'options': ['London', 'Berlin', 'Paris', 'Madrid'],
        'correctAnswer': 2,
        'userAnswer': 2,
      },
      {
        'question': 'Who wrote "Romeo and Juliet"?',
        'options': [
          'Charles Dickens',
          'William Shakespeare',
          'Jane Austen',
          'Mark Twain'
        ],
        'correctAnswer': 1,
        'userAnswer': 1,
      },
      {
        'question': 'What is the chemical symbol for gold?',
        'options': ['Au', 'Ag', 'Fe', 'Cu'],
        'correctAnswer': 0,
        'userAnswer': 1,
      },
      {
        'question': 'In which year did World War II end?',
        'options': ['1943', '1944', '1945', '1946'],
        'correctAnswer': 2,
        'userAnswer': 2,
      },
      {
        'question': 'What is the largest planet in our solar system?',
        'options': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
        'correctAnswer': 2,
        'userAnswer': 2,
      },
      {
        'question': 'Who painted the Mona Lisa?',
        'options': [
          'Vincent van Gogh',
          'Pablo Picasso',
          'Leonardo da Vinci',
          'Michelangelo'
        ],
        'correctAnswer': 2,
        'userAnswer': 2,
      },
      {
        'question': 'What is the boiling point of water in Celsius?',
        'options': ['90°C', '100°C', '110°C', '120°C'],
        'correctAnswer': 1,
        'userAnswer': 2,
      },
      {
        'question': 'Which country is known as the Land of the Rising Sun?',
        'options': ['China', 'Korea', 'Japan', 'Thailand'],
        'correctAnswer': 2,
        'userAnswer': 2,
      },
      {
        'question': 'What is the capital of Australia?',
        'options': ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
        'correctAnswer': 2,
        'userAnswer': 0,
      },
      {
        'question': 'Who discovered penicillin?',
        'options': [
          'Alexander Fleming',
          'Marie Curie',
          'Louis Pasteur',
          'Robert Koch'
        ],
        'correctAnswer': 0,
        'userAnswer': 0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName.capitalize()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatCard(subjectData),
              const SizedBox(height: 24),
              const Text(
                'Recent Questions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildRecentQuestions(recentQuestions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(Map<String, dynamic> data) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subject Statistics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildStatRow('Time Spent', data['timeSpent']),
            _buildStatRow(
                'Questions Answered', data['questionsAnswered'].toString()),
            _buildStatRow(
                'Correct Rate', '${(data['correctRate'] * 100).toInt()}%'),
            _buildStatRow('Avg. Daily Time', data['averageDailyTime']),
            _buildStatRow('Avg. Daily Questions',
                data['averageDailyQuestions'].toString()),
            _buildStatRow('Current Streak', '${data['streak']} days'),
            _buildStatRow('Last Practice', data['lastPractice']),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text(value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRecentQuestions(List<Map<String, dynamic>> questions) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question['question'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ...List.generate(4, (optionIndex) {
                  final isCorrect = optionIndex == question['correctAnswer'];
                  final isUserAnswer = optionIndex == question['userAnswer'];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          isUserAnswer
                              ? (isCorrect ? Icons.check_circle : Icons.cancel)
                              : (isCorrect ? Icons.check_circle_outline : null),
                          color: isUserAnswer
                              ? (isCorrect ? Colors.green : Colors.red)
                              : Colors.green,
                        ),
                        SizedBox(width: 8),
                        Text(question['options'][optionIndex]),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
