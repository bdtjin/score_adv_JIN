import 'dart:io';
import 'package:score_advanced/score_adv_lib.dart';

void main() {
  // List<StudentScore> 학생 정보 불러오기, txt 파일 students에 저장
  List<StudentScore> studentList = loadStudentData('lib/model/students.txt');
  print('어떤 학생의 점수를 확인하시겠습니까?');
  String userInput = stdin.readLineSync()!; // 사용자의 입력을 받아서 문자열로 반환
  // print(userInput); => 이름 한번 더 출력되고 있었음.

  bool isname = false;
  for (var student in studentList) {
    if (student.name == userInput) {
      print('이름: ${student.name}, 점수: ${student.score}');
      isname = true;
      break;
    }

    //   } else if (student.name != userInput) {
    //     print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
    //   }
  }
if (!isname){
    print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
}

}
