A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

## 심화과제: 성적 분석 프로그램
- **Collection** 활용하여 데이터 처리하기
- **파일 입출력**을 통해 데이터를 불러오고 저장하기
- 객체 지향을 활용한 전체 구조 생각하기

> **필수 정의**
> **Score 클래스 (점수 표기)**
> - 속성 (점수)
> - 출력 메서드
>   - 현재 점수 출력하기 (점수: 90)
>
> **StudentScore 클래스 (학생 점수를 위한)**
> - 속성(이름, 점수)
> - 출력 메서드
>   - 해당 학생의 정보 출력하기
> ```이름: 홍길동, 점수: 90점```

### 1. 클래스 구성: Score와 StudentScore
- **`Score` 클래스**
점수 표현하는 `Score` 라는 부모 클래스 정의하고 `showInfo()` 메서드를 통해 점수를 출력

- **`StudentScore` 클래스**
   - `Score`클래스를 상속받는 자식 클래스
   - 학생 이름까지 더 구체적인 정보를 출력하기
   - `showInfo()` 메서드를 `@override`를 사용해서 부모 메서드를 재정의 필요!
- **힌트**
   - 클래스 상속에는 `extends` 키워드 사용
   - 메서드 재정의할 때는 `@override` 어노테이션 붙여주기
   - 생성자에서 `super(...)`를 사용해서 부모 클래스의 속성을 초기화 가능

**[조건]**
- `StudentScore` 클래스의 `showInfo()` 메서드는 반드시 `@override`로 부모 메서드를 재정의해야 합니다.


### 2. 초기 데이터 로딩: 파일로부터 학생 점수 데이터 읽어오기
- 소스 파일
  - `students.txt` 파일에서 학생들 점수 목록 받아오기
  ```
  홍길동, 90
  김철수, 80
  ```
  - 파일 형식: CSV (이름, 점수 형태의 데이터 확인)
  - `StudentScore` 객체로 변환 후에 `List<StudentScore>` 저장하기
  - dart:io 라이브러리의 File 클래스를 사용하여 파일을 읽기
  - split() 메서드를 사용하여 CSV 데이터를 분리한 후 변수(name, score)에 선언하기


### 3. 사용자로부터 입력 받아 학생 점수 확인 기능
핵심: 사용자로부터 이름 정보를 입력받아서 데이터 조회 로직을 포함하는 유효성을 검사
- `"어떤 학생의 점수를 확인하시겠습니까?"`라는 메세지 출력
- 사용자가 `학생 이름` 중 하나를 입력하면 리스트에서 해당 학생의 점수를 계산
   - StudentScore 클래스의 `showInfo*()`메서드를 통해 출력 가능
- 입력 값이 잘 못 됐을 경우, `"잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요."`를 출력하고 올바른 값이 입력될 때까지 반복되기

### 4. 결과 저장: 프로그램 종료 시에 결과 파일에 기록
- 실행 조건: 3번에서 사용자가 올바른 값을 입력한 경우에 해당 학생의 이름과 점수를 저장
   - 저장 형태: `이름: 홍길동, 점수: 90`
   - 종료: 저장 완료 후 `"저장이 완료되었습니다."` 메시지를 콘솔에 출력하기

- **힌트**
`dart:io` 라이브러리의 `writeAsStringSync()` 을 이용하여 파일을 저장할 수 있다
