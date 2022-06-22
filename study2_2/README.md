study2에서는 계층화적용
study2_2에서는 code적용


DB, Member테이블에서 JB01 대신에 학생으로 저장하면 됐을텐데.. 왜 굳이 JB01로???
Employee테이블에서 부서코드
Department테이블에서 부서코드, 부서명 => Employee테이블에 부서명 있으면 안되나?


1. 같은 데이터인데 개발자가 헷갈려서 다른 데이터로 인식하는 경우
-넥스트아이티교육센터학원, 넥스트아이티 교육센터를 개발자는 같은데이터라고 봤지만, DB는 다르다고 인식

2. 다른 데이터인데 비슷한 이름인 경우
- (용두동) 넥스트아이티교육센터학원, (둔산동) 넥스트아이티교육센터학원   개발자는 다른데이터라고 인식, DB는 같은 데이터로 인식
  DB에 넣을 때는 H01, H02로 넣자
  
  ==> 코드로 쓰기로 하면 안 헷갈린다.
  
3. 데이터 낭비
넥스트아이티교육센터학원은 데이터(byte)가 크다.
H01은 데이터(byte)가 작다

코드 적용하기
-form, edit : comm_code 테이블 조회한 다음 c:forEach
-list,view : comm_code 테이블 조회x,  free_board 조회하면서 join

Member
- form, edit : select를 2번 해야됨. 하나는 jobList ('JB00'), 하나는 hobbyList('HB00')
-list, view : VO에 memJobNm, memHobbyNm 추가
				Join도 2번
