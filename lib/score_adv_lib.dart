import 'dart:io';

// List<StudentScore> 클래스 만들어주기
class Score {
  int score;
  Score(this.score);
  void showInfo() {
    print('점수: $score');
  }
}

class StudentScore extends Score {
  String name;
  StudentScore(this.name, super.score);
  @override
  void showInfo() {
    // TODO : 이름출력
    print('이름: $name, 점수: $score');
  }
}
// 각 줄을 읽어 StudentScore 객체로 변환하고, 이를 List<StudentScore>에 저장합니다.
// -> class 정의하고 StudentScore에 저장해라..?

List<StudentScore> loadStudentData(String filePath) {
  List<StudentScore> studentList = []; // 변수 선언은 중괄호 안에서!!!!
  try {
    final File file = File(filePath);
    final lines = file.readAsLinesSync(); // 파일의 모든 줄을 읽어서 리스트로 만듬, Sync는 파일을 다 읽을 때까지

    for (var line in lines) {            // line의 각 줄을 하나씩 꺼내서 반복 시작.
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);

      //student 객체 생성 및 추가해주기, 객체 사용 시작.
      StudentScore student = StudentScore(name, score);
      studentList.add(student);
    }

  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  // TODO 학생 정보 불러오기
  return studentList;
}
