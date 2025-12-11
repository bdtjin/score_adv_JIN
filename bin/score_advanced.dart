import 'dart:io';
import 'package:score_advanced/score_adv_lib.dart';


void main(){
    // List<StudentScore> 학생 정보 불러오기, txt 파일 students에 저장
    List<StudentScore> studentList = loadStudentData('lib/model/students.txt');
    print('어떤 학생의 점수를 확인하시겠습니까?');
    String userInput = stdin.readLineSync()!; // 사용자의 입력을 받아서 문자열로 반환
    print(userInput);

// 상황: studentList = [홍길동,김철수]
// case 1. 사용자 입력이 홍길동이라고 했을 때, => for문에서 studentList에서 if문 true. -> 이름: 홍길동, 점수: 90 -> 김철수
// case 2. 사용자 입력이 김철수 일때,        => 동일하게 작동, 김철수 
// case 3. 사용자 입력이 abc일 때,
    for (var student in studentList) {
      if (student.name == userInput) {
        print('이름: ${student.name}, 점수: ${student.score}');
        break;
      } else if (student.name != userInput) {
        print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
      }
    }
    
}
