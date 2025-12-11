
// 부모 클래스
class Score {
  String name = '';
  int score = 90;
  void showInfo(){
    print('점수: $score점');
  }
}
// 자식 클래스
class StudentScore extends Score {
  @override
  String name = '홍길동';
  void showInfo(){
    print('이름: $name');
    super.showInfo();
  }
}
void main(){
  StudentScore studentScore = StudentScore();
  studentScore.showInfo();
}