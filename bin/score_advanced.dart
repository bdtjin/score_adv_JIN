import 'dart:io';
import 'package:score_advanced/score_adv_lib.dart';


// 부모 클래스
// class Score {
//   String name = '';
//   int score = 90;
//   void showInfo(){
//     print('점수: $score점');
//   }
// }
// // 자식 클래스
// class StudentScore extends Score {
//   @override
//   String name = '홍길동';
//   void showInfo(){
//     print('이름: $name');
//     super.showInfo();
//   }
// }
// void main(){
//   StudentScore studentScore = StudentScore();
//   studentScore.showInfo();
// }
// ------------------------------------
// void main(List<String> arguments) {}

void main(){
    // List<StudentScore> 학생 정보 불러오기, txt 파일 students에 저장
    List<StudentScore> studentList = loadStudentData('lib/model/students.txt');
    for (var student in studentList){
        student.showInfo();
    }
}
