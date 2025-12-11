// 2번 문제

import 'dart:io';

// List<StudentScore> 클래스 만들어주기
// 부모 클래스 (기본 점수 기능)
class Score {
  int score;
  Score(this.score);
  void showInfo() {
    print('점수: $score');
  }
}

// 자식 클래스 (점수 + 이름 기능 추가)
class StudentScore extends Score {
  String name;
  StudentScore(this.name, super.score); // 부모 클래스 호출, 먼저 실행.
  @override // 부모 showInfo를 재정의
  void showInfo() {
    print('이름: $name, 점수: $score');
  }
}

// 파일 경로를 넣고, List<StudentScore>를 반환하는 함수
List<StudentScore> loadStudentData(String filePath) {
  
  // - 리스트 초기화: 학생들을 담을 그릇. *변수 선언은 중괄호 안에서!!!!
  List<StudentScore> studentList = []; 
  try {
    final File file = File(filePath);

    // - 파일 내용을 한줄씩 쪼개서 리스트로 만듬. *Sync는 파일을 다 읽을 때까지
    final lines = file.readAsLinesSync(); 

    // - 텍스트를 실제 객체로 반복 시작.
    for (var line in lines) {
      final parts = line.split(',');  // line의 각 줄을 하나씩 꺼내서 반복 시작. *split은 쉼표로 구분
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line'); // 쉼표로 나눴을때 2개가 아니면 에러 처리해

      String name = parts[0];
      int score = int.parse(parts[1]); // 문자열을 숫자로 변환

      // - student 객체 생성 및 추가해주기, 객체 사용 시작.
      StudentScore student = StudentScore(name, score);
      studentList.add(student);
    }
  } catch (e) { // 예외처리
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return studentList;  // - 결과 반환, 함수 호출한 곳 main으로 넘김
}
