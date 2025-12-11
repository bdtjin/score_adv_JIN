import 'dart:io';
import 'package:score_advanced/score_adv_lib.dart';


void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}

void main() {
  // List<StudentScore> 학생 정보 불러오기, txt 파일 students에 저장
  List<StudentScore> studentList = loadStudentData('lib/model/students.txt');
  

  while (true) {
    print('어떤 학생의 점수를 확인하시겠습니까?');
    String userInput = stdin.readLineSync()!; // 사용자의 입력을 받아서 문자열로 반환

    bool isname = false;
    
    for (var student in studentList) {
      if (student.name == userInput) {
        print('이름: ${student.name}, 점수: ${student.score}');
        isname = true;

        String saveContent = "이름: ${student.name}, 점수: ${student.score}";
        saveResults('result.txt', saveContent);

        return;
      }
    }

    if (!isname) {
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');

      
    }
  }

  // while 문으로 감싸고 저장 확인 후

  //   try {
  //     final file = File(filePath);
  //     file.writeAsStringSync(content);
  //     print("저장이 완료되었습니다.");
  //   } catch (e) {
  //     print("저장에 실패했습니다: $e");
  //   }
}
