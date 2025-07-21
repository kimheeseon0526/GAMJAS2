# GAMJAS 🥔 여행 플랫폼 프로젝트(6/9 ~ 7/9 프로젝트 끝. 7/16 ~ 개인 리빌드 시작)
GAMJAS는 지하철 노선도 + 구글 지도 API를 기반으로  
사용자에게 여행 정보와 미션 투어 기능을 제공하는 웹 플랫폼입니다.

## 📌 주요 기능
- 구글지도 기반 지하철 노선도 시각화
- 여행 정보 장소 조회 (축제, 명소, 맛집)
- 지하철역 반경 기반 추천 장소 표시
- 미션 수행 → 감자티켓 지급 → 경품 응모
- 후기 작성 기능

## 🛠️ 기술 스택
- **Backend**: Java, JSP, MyBatis, SQL
- **Frontend**: HTML, CSS, JavaScript, jQuery, AJAX
- **API**: Kakao Map API, 공공데이터포털(지하철 API)
- **Version Control**: Git, GitHub
 
07.17
java maven -> spring 으로 변환




--------------------------------------------------
김희선
khseon0526
음성 채널에서 사용

박종민 — 2025-06-20 오후 4:10
dayjs.extend(window.dayjs_plugin_relativeTime)
dayjs.locale('ko')
dayjs('2025-06-20 15:40:44', 'YYYY-MM-DD HH:mm:ss').fromNow()
김희선 — 2025-06-23 오전 10:28
여러분 정산이 늦어서 스미마셍~
이미지
사진이 없어서 아쉽네여
ㅎ.ㅎ
박현정 — 2025-06-23 오전 10:30
이거 회식한 사람들이 아니라 크런치 막 끝나고 5일만에 집가는 사람들 얼굴인데요
김희선 — 2025-06-23 오전 10:30
살앙해여 녀러분 다음번엔 현정띠도 함께하길
ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ^^
전상현 — 2025-06-24 오전 10:49
첨부 파일 형식: unknown
f88deb04-81e4-4a99-9197-37c1e9610c5c.bmp
192.06 KB
박현정 — 2025-06-24 오전 10:50
첨부 파일 형식: unknown
1.1-MB.bmp
1.12 MB
김찬 — 2025-06-24 오후 5:25
일요일 (6/29) 학원 나오시는 분께서는 따봉 하나 남겨주세여~~
이용시간 11:00 ~ 17:00 입니다!
박종민 — 2025-06-24 오후 5:56
🇰🇷
write 폼
  - 인증 및 알림 관련 서블릿 처리
글쓰기 적용
list page(category)
  - pagination(paging)
  - sql
확장
pbl로드맵.txt
2KB
박종민 — 2025-06-26 오후 3:06
으잉?
켜져있었었는데 잠시만
박종민 — 2025-06-26 오후 5:10
https://github.com/lepela/universal_servlet_pbl
이런식으로 참고해서 만드세요
GitHub
GitHub - lepela/universal_servlet_pbl
Contribute to lepela/universal_servlet_pbl development by creating an account on GitHub.
Contribute to lepela/universal_servlet_pbl development by creating an account on GitHub.
박종민 — 2025-06-27 오후 12:58
<div class="container my-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2 class="h4 mb-0">갤러리 게시판</h2>
    <a href="#" class="btn btn-primary">글쓰기</a>
  </div>

  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
    <!-- 게시글 카드 시작 -->
    <div class="col">
      <div class="card h-100 shadow-sm">
        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="썸네일">
        <div class="card-body d-flex flex-column">
          <h5 class="card-title text-truncate">게시글 제목입니다</h5>
          <p class="card-text text-muted mb-1">카테고리: 자유</p>
          <p class="card-text text-muted mb-1">작성일: 25.06.26</p>
          <p class="card-text text-muted mb-1">조회수: 27</p>
          <a href="#" class="mt-auto btn btn-outline-primary btn-sm">자세히 보기</a>
        </div>
      </div>
    </div>
    <!-- 게시글 카드 끝 -->

    <!-- 추가 카드 복제해서 반복 -->
  </div>

  <!-- 페이지네이션 -->
  <nav class="mt-4 d-flex justify-content-center">
    <ul class="pagination">
      <li class="page-item disabled">
        <a class="page-link">이전</a>
      </li>
      <li class="page-item active"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">다음</a></li>
    </ul>
  </nav>
</div>
박종민 — 2025-07-01 오후 2:40
:root {
  --clanity: #E63946;
  --clanity-hover: #d6283d;
  --clanity-text: #ffffff;
}

/* 기본형 /
.btn-clanity {
  background-color: var(--clanity);
  color: var(--clanity-text) !important;  / 글자색 유지 /
  border: none;
  transition: background-color 0.3s ease;
}

.btn-clanity:hover {
  background-color: var(--clanity-hover);
  color: var(--clanity-text) !important; / 호버 시에도 흰색 고정 /
}

/ 아웃라인형 /
.btn-outline-clanity {
  background-color: transparent;
  color: var(--clanity);
  border: 1px solid var(--clanity);
  transition: all 0.3s ease;
}

.btn-outline-clanity:hover {
  background-color: var(--clanity-hover);
  color: #fff;
  border-color: var(--clanity-hover);
}

/ 유틸리티도 같이 정리 */
.bg-clanity {
  background-color: var(--clanity) !important;
  color: #fff !important;
}

.text-clanity {
  color: var(--clanity) !important;
}

.border-clanity {
  border: 1px solid var(--clanity) !important;
}
김찬 — 2025-07-02 오후 12:30
인생쉽지않네님이 한솥도시락 구로디지털단지벽산7차점의 함께주문에 초대했어요. 원하는 메뉴를 담아주세요.
https://s.baemin.com/yo000lIRJQbxq
배달의민족
[배달의민족] 함께주문
원하는 메뉴를 장바구니에 담아주세요!
이미지
김찬 — 2025-07-02 오후 12:38
110-390-961620 신한 김찬입니다 ~
이미지
이미지
실수였습니다!
전상현 — 2025-07-02 오후 3:38
https://hub.docker.com/repositories/manlubo
박종민 — 2025-07-02 오후 4:03
package util;

import redis.clients.jedis.JedisPooled;

public class RedisUtil {
    private static final JedisPooled JEDIS_POOLED = new JedisPooled("localhost", 6380);

    // 기본 10분
    public static void set(String key, String value) {
        set(key, value, 600);
    }

    public static void set(String key, String value, int expiry) {
        JEDIS_POOLED.setex(key, expiry, value);
    }

    public static String get(String key) {
        return JEDIS_POOLED.get(key);
    }

    public static Long ttl(String key) {
        return JEDIS_POOLED.ttl(key);
    }
    public static boolean exists(String key) {
        return JEDIS_POOLED.exists(key);
    }
}
박종민 — 2025-07-02 오후 4:10
package controller;

import java.io.IOException;import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JsonRespUtil;
import util.RedisUtil;

@WebServlet("/redis-binder")
public class RedisBinder extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = "user-token";
        RedisUtil.set(key, UUID.randomUUID().toString(), 10);

        JsonRespUtil.writeJson(resp, Map.of("ret", RedisUtil.get(key), "ttl", RedisUtil.ttl(key)));
    }

}
package controller;

import java.io.IOException;import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.JsonRespUtil;
import util.RedisUtil;

@WebServlet("/redis-checker")
public class RedisChecker extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = "user-token";
        if(RedisUtil.exists(key)) {
            JsonRespUtil.writeJson(resp, Map.of("ret", RedisUtil.get(key), "ttl", RedisUtil.ttl(key)));
        }
        else {
            JsonRespUtil.writeJson(resp, null);
        }
    }

}
박종민 — 2025-07-07 오전 9:41
오늘 일보느라 한시간정도 늦게 도착할듯 합니다 팀별 코드 10시반부터 팀별 코드 리뷰예정으합니다
전상현 — 2025-07-07 오전 10:00
넵!!
김희선 — 2025-07-07 오전 10:01
확인했습니다! 조심히 오십숑>,.<
김찬 — 2025-07-08 오후 12:29
인생쉽지않네님이 버거킹 구로점의 함께주문에 초대했어요. 원하는 메뉴를 담아주세요.
https://s.baemin.com/PC000m6AcZ9J9
배달의민족
[배달의민족] 함께주문
원하는 메뉴를 장바구니에 담아주세요!
이미지
전상현 — 2025-07-09 오후 12:18
manlubo11@gmail.com
박현정 — 2025-07-09 오후 12:20
seodam27@gmail.com
김찬 — 2025-07-09 오후 12:21
kimchan9408@gmail.com
김희선 — 2025-07-09 오후 12:21
xuan6.6j@gmail.com
김지유 — 2025-07-09 오후 12:22
jiyu16413@gmail.com
송성준 — 2025-07-09 오후 12:24
thdtjdwns0902@gmail.com
박종민 — 2025-07-09 오후 3:51
<!-- Servlet API -->
      <dependency>
          <groupId>javax.servlet</groupId>
          <artifactId>javax.servlet-api</artifactId>
          <version>4.0.1</version> <!-- Tomcat 9 대응 -->
          <scope>provided</scope>
      </dependency>
      <!-- https://mvnrepository.com/artifact/javax.websocket/javax.websocket-api -->
      <dependency>
          <groupId>javax.websocket</groupId>
          <artifactId>javax.websocket-api</artifactId>
          <version>1.1</version>
      </dependency>
      <!-- https://mvnrepository.com/artifact/javax.servlet/jsp-api -->
      <dependency>
          <groupId>javax.servlet</groupId>
          <artifactId>jsp-api</artifactId>
          <version>2.0</version>
          <scope>provided</scope>
      </dependency>
박종민 — 2025-07-11 오후 6:16
첨부 파일 형식: document
[별첨2-2] 팀별 프로젝트 결과보고서.pptx
1.16 MB
박종민 — 2025-07-13 오전 10:52
다들 힘든 주말 보내고계십니까..
프로젝트발표자료 완성본이 아니어도 되니 중간 과정을 오후 2시까지 보내주시기 바랍니다.
학원측에서 중간보고용으로 사용한다고하니 부탁드립니다
김찬 — 2025-07-14 오후 2:39
https://product.kyobobook.co.kr/detail/S000001923747
전상현 — 2025-07-15 오후 4:54
🧯 희망 산업별 현실판 해설
산업    뭐 하는 곳인지    현실    가지 말거나 조심해야 할 이유
SI (System Integration)    공공기관, 대기업 시스템 구축·유지보수 프로젝트. 외주 개발.    🧱 "파견 근무 + 야근 정식 코스"
남의 시스템 만드는데 내 경력처럼 안 됨.
개발보단 문서질+보고용 PPT 많이 함.    🔥 ① “SI 3년 = 커리어 시체”란 말 있음
② 실력보다 하청 구조에 적응 잘하는 사람이 오래 감
③ 기술 커리어 관리 어려움
SM (System Management)    이미 구축된 시스템 운영·유지보수 (운영팀)    💤 장애 처리, 로그 확인, 서비스 모니터링 위주.
주로 개발보단 감시+리포트.
발전 적음.    🧨 ① “운영 개발자”라는 말이 괜히 있는 게 아님
② 야근도 많고 기술적으로 남는 게 없음
③ 커리어 전환 어렵다
솔루션 회사    자사 제품(S/W) 만들어서 판매·유지보수    💻 솔루션 종류 따라 다름.
신기술은 잘 안 씀.
고객사 맞춤형 커스터마이징 지옥일 수도 있음.    ⚠️ ① 고도화? 없음. 고객사 요구사항만 반영
② 구조가 구리면 기술 부채만 쌓임
③ 개발자 = 헬프데스크 될 수도 있음
테크 스타트업    기술 기반 아이템으로 성장 중인 회사    🚀 일 많음. 자유도 높음. 커리어 성장 빠름
기술 선택권 있음. 실력 느는 건 확실함.    ⚠️ ① 돈 없으면 망함. 연봉·복지 박함
② "넌 CTO야" 하면서 잡일 다 시킴
③ 코드 품질보다 속도 우선.
웹 에이전시    웹사이트·쇼핑몰·랜딩페이지 외주 제작    🎨 웹 퍼블리싱 + 프론트 + 백 다 함.
"워드프레스+카페24 지옥"일 수도 있음    💀 ① 실력은 늠, 근데 경력으로 안 쳐줌
② 기술 성장 한계.
③ 야근/클라이언트 갑질 확률 높음
IT 대기업 계열사    삼성SDS, LG CNS 같은 곳    🏢 안정적이고 이름값 있음
복지 좋고 대우 괜찮음.
하지만 프로젝트 따라 외주화 느낌 날 수 있음    ⚠️ ① 대기업인 척하는 하청 구조도 있음
② 자사 기술 안 쓰고 남 기술 붙이는 SI성 프로젝트일 수도 있음
IT 서비스 (자사 서비스 운영)    토스, 배달의민족, 쿠팡처럼 자체 플랫폼 운영    🔥 기술 커리어 짱 좋음. 규모 있고 실무도 다양.
CS도 직접 받으면서 책임감 생김.    💣 ① 초기 입사 어려움 (코테, CS지식 등 요구)
② 실력 없으면 존버 못함
③ 계속 성장 못 하면 밀림

*본 프로젝트에서는 다음과 같은 기술을 활용하였습니다.*




- ![Java](https://img.shields.io/badge/Java-FF0000?style=for-the-badge&logo=java&logoColor=white)
- ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
- ![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
- ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
- ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)




- ![MVC](https://img.shields.io/badge/MVC%20Pattern-0078D7?style=for-the-badge&logo=microsoft&logoColor=white)




- ![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
- ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
- ![Google Sheets](https://img.shields.io/badge/Google%20Sheets-0F9D58?style=for-the-badge&logo=googlesheets&logoColor=white)
- ![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)
