// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelAdd {
  String? createdAt;
  String question;
  int? availabileTime;
  String ?author;
  List <Reply> answers;
  ModelAdd({
     this.createdAt,
    required this.question,
     this.availabileTime,
     this.author,
     required this.answers,
  });

  ModelAdd copyWith({
    String? createdAt,
    String? question,
    int? availabileTime,
    String? author,
    List <Reply>? answers,
  }) {
    return ModelAdd(
      createdAt: createdAt ?? this.createdAt,
      question: question ?? this.question,
      availabileTime: availabileTime ?? this.availabileTime,
      author: author ?? this.author,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'question': question,
      'availabileTime': availabileTime,
      'author': author,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory ModelAdd.fromMap(Map<String, dynamic> map) {
    return ModelAdd(
      createdAt: map['createdAt'] as String,
      question: map['question'] as String,
      availabileTime: map['availabileTime'] as int,
      author: map['author'] as String,
      answers: List<Reply>.from(
        (map['answers'] as List<int>).map<Reply>(
          (x) => Reply.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelAdd.fromJson(String source) => ModelAdd.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelAdd(createdAt: $createdAt, question: $question, availabileTime: $availabileTime, author: $author, answers: $answers)';
  }

  @override
  bool operator ==(covariant ModelAdd other) {
    if (identical(this, other)) return true;
  
    return 
      other.createdAt == createdAt &&
      other.question == question &&
      other.availabileTime == availabileTime &&
      other.author == author &&
      other.answers == answers;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
      question.hashCode ^
      availabileTime.hashCode ^
      author.hashCode ^
      answers.hashCode;
  }
}

class Reply {
  String answer;
  bool isCorrect;
  Reply({
    required this.answer,
    required this.isCorrect,
  });

  Reply copyWith({
    String? answer,
    bool? isCorrect,
  }) {
    return Reply(
      answer: answer ?? this.answer,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }

  factory Reply.fromMap(Map<String, dynamic> map) {
    return Reply(
      answer: map['answer'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reply.fromJson(String source) => Reply.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Reply(answer: $answer, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant Reply other) {
    if (identical(this, other)) return true;
  
    return 
      other.answer == answer &&
      other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => answer.hashCode ^ isCorrect.hashCode;
}
