import 'dart:io';

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
    super.showInfo();
  }
}
// 각 줄을 읽어 StudentScore 객체로 변환하고, 이를 List<StudentScore>에 저장합니다.
// -> class 정의하고 StudentScore에 저장해라..?
// List<StudentScore> (String filePath)

List<StudentScore> loadStudentData(String filePath) {
  try {
    final File file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  // TODO 학생 정보 불러오기
  return [];
}
