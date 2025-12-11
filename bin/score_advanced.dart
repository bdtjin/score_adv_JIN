// 2, 3, 4번 문제

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
  List<StudentScore> studentList = loadStudentData('lib/model/students.txt');  // List<StudentScore> 학생 정보 불러오기, txt 파일 students에 저장

  while (true) {   // while 문으로 프로그램 종료될때까지 프로그램 실행
    print('어떤 학생의 점수를 확인하시겠습니까?');
    String userInput = stdin.readLineSync()!; // 사용자의 입력을 받아서 문자열로 반환

    bool isname = false;   // 변수 초기화, 검색 성공 여부 확인

    for (var student in studentList) {   // 리스트에 있는 학생들을 돌면서 검사
      if (student.name == userInput) {   // 입력한 값과 리스트 값이 일치하는지 비교
        print('이름: ${student.name}, 점수: ${student.score}');
        isname = true;  // 입력값과 리스트값 참일 경우, 실행

        String saveContent = "이름: ${student.name}, 점수: ${student.score}";
        saveResults('result.txt', saveContent);   // 힌트 내용, 위에 정의한 파일 저장 함수를 호출

        return; // main 함수 종료 시, 프로그램 실행을 끝냄 *while문 탈출
      }
    }

    if (!isname) {  // 입력값과 리스트값이 동일하지 않아서 거짓일 경우, 실행
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
    }
  } // while 끝
} // main 끝
