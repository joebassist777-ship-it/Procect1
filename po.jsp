물론이죠! 아래는 여러분이 작성한 HTML 코드에 초보자도 이해할 수 있도록 친절한 주석을 추가한 버전입니다. HTML 구조, CSS 스타일, 그리고 JSP 코드까지 하나하나 설명해드릴게요.

---

```html
<!DOCTYPE html> <!-- HTML5 문서 선언 -->
<html lang="ko"> <!-- 문서의 언어를 한국어로 설정 -->
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩 설정 (한글 깨짐 방지) -->
    <title>Music Entry</title> <!-- 브라우저 탭에 표시될 제목 -->

    <!-- CSS 스타일 정의 -->
    <style>
        /* 전체 페이지 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif; /* 글꼴 설정 */
            background-color: #f0f0f5; /* 배경색 */
            color: #333; /* 글자색 */
            margin: 0;
            padding: 0;
        }

        /* 상단 헤더 스타일 */
        header {
            background-color: #800080; /* 보라색 배경 */
            color: white; /* 글자색 흰색 */
            padding: 15px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            margin: 0;
        }

        /* 콘텐츠 박스 스타일 */
        .container {
            width: 80%; /* 너비 설정 */
            max-width: 1200px; /* 최대 너비 제한 */
            margin: 40px auto; /* 가운데 정렬 */
            padding: 20px;
            background-color: white;
            border-radius: 10px; /* 모서리 둥글게 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        /* 입력 폼 스타일 */
        .form-container {
            display: flex;
            flex-direction: column; /* 세로 정렬 */
            gap: 15px; /* 요소 간 간격 */
        }

        /* 텍스트 입력창과 날짜 입력창 스타일 */
        input[type="text"], input[type="date"] {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        /* 입력창 포커스 시 테두리 색 변경 */
        input[type="text"]:focus, input[type="date"]:focus {
            border-color: #800080;
        }

        /* 버튼 스타일 */
        button {
            padding: 12px 20px;
            font-size: 16px;
            background-color: #800080;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* 버튼에 마우스를 올렸을 때 색 변경 */
        button:hover {
            background-color: #9b59b6;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse; /* 테두리 겹침 제거 */
        }

        th, td {
            padding: 12px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #800080;
            color: white;
        }

        td {
            background-color: #fafafa;
            border-bottom: 1px solid #ddd;
        }

        /* 테이블을 감싸는 박스 */
        .table-container {
            margin-top: 30px;
            overflow-x: auto; /* 가로 스크롤 가능 */
        }

        /* 화면이 작을 때 반응형 스타일 적용 */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            input[type="text"], input[type="date"] {
                font-size: 14px;
            }

            button {
                padding: 10px 16px;
                font-size: 14px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <!-- 상단 제목 영역 -->
    <header>
        <h1>음악 등록</h1>
    </header>

    <!-- 전체 콘텐츠 박스 -->
    <div class="container">
        <!-- 음악 등록 폼 -->
        <form action="add_music.jsp" method="post">
            <div class="form-container">
                <!-- 곡 제목 입력 -->
                <input type="text" name="title" placeholder="곡 제목" required>
                <!-- 보컬 입력 -->
                <input type="text" name="vocal" placeholder="보컬" required>
                <!-- 발매사 입력 -->
                <input type="text" name="releaseComp" placeholder="발매사" required>
                <!-- 발매일 입력 -->
                <input type="date" name="releaseDate" required>
                <!-- 등록 버튼 -->
                <button type="submit">곡 등록하기</button>
            </div>
        </form>

        <!-- 등록된 음악 목록 테이블 -->
        <div class="table-container">
            <h2>등록된 음악 목록</h2>
            <table>
                <tr>
                    <th>No.</th>
                    <th>곡 제목</th>
                    <th>보컬</th>
                    <th>발매사</th>
                    <th>발매일</th>
                </tr>

                <%-- JSP 코드: 등록된 음악 리스트 출력 --%>
                <%
                    // application 영역에서 musicList 가져오기
                    List<Map<String, String>> musicList = (List<Map<String, String>>)application.getAttribute("musicList");

                    // musicList가 비어있지 않으면 테이블에 출력
                    if (musicList != null && !musicList.isEmpty()) {
                        for (int i = 0; i < musicList.size(); i++) {
                            Map<String, String> music = musicList.get(i);
                %>
                <tr>
                    <td><%= i + 1 %></td> <!-- 번호 -->
                    <td><%= music.get("title") %></td> <!-- 곡 제목 -->
                    <td><%= music.get("vocal") %></td> <!-- 보컬 -->
                    <td><%= music.get("releaseComp") %></td> <!-- 발매사 -->
                    <td><%= music.get("releaseDate") %></td> <!-- 발매일 -->
                </tr>
                <%
                        }
                    } else {
                %>
                <!-- 음악이 없을 때 표시 -->
                <tr>
                    <td colspan="5" style="text-align:center;">등록된 음악이 없습니다.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>
```

---

이제 이 코드는 다음과 같은 기능을 합니다:

- 사용자에게 음악 정보를 입력받고 등록할 수 있는 폼을 보여줍니다.
- 등록된 음악 목록을 테이블 형태로 보여줍니다.
- CSS로 예쁘게 꾸며져 있고, 모바일에서도 잘 보이도록 반응형 디자인이 적용되어 있어요.

혹시 이걸 JSP 파일로 연결하거나 백엔드와 연동하는 부분도 설명이 필요하면 언제든지 도와드릴게요!


==========================================================================================
좋아요! 아래는 두 개의 JSP 페이지(MUSIC 수정용과 삭제용)에 대해 초보자도 쉽게 이해할 수 있도록 친절한 주석을 달아드린 버전입니다. 각 부분이 어떤 역할을 하는지 설명도 함께 넣었어요.

---

## 🎨 공통 상단 설정

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- JSP 페이지 설정 -->
<%@ page import="java.util.*" %> <!-- 자바 유틸 클래스 import -->
<%@ page import="com.melon.peace.bean.Music" %> <!-- Music 클래스 import -->
```

---

## 🖼️ HTML 기본 구조 및 스타일

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MUSIC LIST</title>

    <!-- CSS 스타일 정의 -->
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            margin-top: 20px;
        }

        /* 상단 링크 스타일 */
        h4 {
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
        }

        h4 a {
            text-decoration: none;
            color: #800080;
            font-weight: bold;
        }

        h4 a:hover {
            color: #9b59b6;
        }

        /* 테이블 스타일 */
        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #800080;
            color: white;
        }

        td {
            background-color: #ffffff;
        }

        /* 체크박스 크기 조절 */
        input[type="checkbox"] {
            transform: scale(1.2);
            margin: 0;
        }

        /* 버튼 스타일 */
        button {
            background-color: #800080;
            color: white;
            padding: 12px 24px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #9b59b6;
            transform: translateY(-3px);
        }

        button:active {
            transform: translateY(2px);
        }

        /* 모바일 화면 대응 */
        @media (max-width: 768px) {
            table {
                width: 90%;
            }

            th, td {
                font-size: 12px;
                padding: 10px;
            }

            button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
```

---

## 📝 수정용 페이지 (update_music.melon)

```html
<body>
    <!-- 홈으로 돌아가는 링크 -->
    <div>
        <h4><a href="/MVC_PROJECT/">Home</a></h4>
    </div>

    <!-- 페이지 제목 -->
    <div>
        <h1>MUSIC LIST</h1>
    </div>

    <!-- 수정할 음악들을 선택하고 수정하는 폼 -->
    <form action="update_music.melon" method="post">
        <table>
            <tr>
                <th>선택</th>
                <th>NO.</th>
                <th>Title</th>
                <th>Vocal</th>
                <th>ReleaseComp</th>
                <th>ReleaseDate</th>
            </tr>

            <%-- 음악 리스트를 반복 출력 --%>
            <%
                List<Music> musicList = (List<Music>)request.getAttribute("musicList");
                for (int i = 0; i < musicList.size(); i++) {
                    Music music = musicList.get(i);
            %>
            <tr>
                <!-- 체크박스로 수정할 음악 선택 -->
                <td>
                    <input type="checkbox" name="selectedMusicNo" value="<%= music.getMusicNo() %>">
                </td>
                <!-- 음악 정보 입력창 (수정 가능) -->
                <td><%= music.getMusicNo() %></td>
                <td><input type="text" name="title_<%= music.getMusicNo() %>" value="<%= music.getTitle() %>"></td>
                <td><input type="text" name="vocal_<%= music.getMusicNo() %>" value="<%= music.getVocal() %>"></td>
                <td><input type="text" name="releaseComp_<%= music.getMusicNo() %>" value="<%= music.getReleaseComp() %>"></td>
                <td><input type="text" name="releaseDate_<%= music.getMusicNo() %>" value="<%= music.getReleaseDate() %>"></td>
            </tr>
            <% } %>
        </table>

        <!-- 수정 버튼 -->
        <button type="submit" id="edit">수정하기</button>
    </form>

    <!-- 돌아가기 링크 -->
    <h4><a href="/MVC_PROJECT/">돌아가기</a></h4>
</body>
</html>
```

---

## 🗑️ 삭제용 페이지 (delete_music.melon)

```html
<body>
    <!-- 홈으로 돌아가는 링크 -->
    <div>
        <h4><a href="/MVC_PROJECT/">Home</a></h4>
    </div>

    <!-- 페이지 제목 -->
    <div>
        <h1>MUSIC LIST</h1>
    </div>

    <!-- 삭제할 음악들을 선택하는 폼 -->
    <form action="delete_music.melon" method="post">
        <table>
            <tr>
                <th>선택</th>
                <th>NO.</th>
                <th>Title</th>
                <th>Vocal</th>
                <th>ReleaseComp</th>
                <th>ReleaseDate</th>
            </tr>

            <%-- 음악 리스트를 반복 출력 --%>
            <%
                List<Music> musicList = (List<Music>)request.getAttribute("musicList");
                for (int i = 0; i < musicList.size(); i++) {
                    Music music = musicList.get(i);
            %>
            <tr>
                <!-- 체크박스로 삭제할 음악 선택 -->
                <td>
                    <input type="checkbox" name="musicNo" value="<%= music.getMusicNo() %>">
                </td>
                <!-- 음악 정보 출력 (수정 불가) -->
                <td><%= music.getMusicNo() %></td>
                <td><%= music.getTitle() %></td>
                <td><%= music.getVocal() %></td>
                <td><%= music.getReleaseComp() %></td>
                <td><%= music.getReleaseDate() %></td>
            </tr>
            <% } %>
        </table>

        <!-- 삭제 버튼 -->
        <button type="submit" id="delete">파일 삭제하기</button>
    </form>

    <!-- 수정 페이지로 이동 / 홈으로 이동 -->
    <h4><a href="/MVC_PROJECT/update_detail_music.melon">수정하기</a></h4>
    <h4><a href="/MVC_PROJECT/">돌아가기</a></h4>
</body>
</html>
```

---

이제 이 두 페이지는 다음과 같은 기능을 합니다:

- ✅ **수정 페이지**: 체크박스로 선택한 음악의 정보를 수정할 수 있어요.
- 🗑️ **삭제 페이지**: 체크박스로 선택한 음악을 삭제할 수 있어요.
- 📱 **반응형 디자인**: 모바일에서도 보기 좋게 자동 조절돼요.
- 🎨 **스타일 통일**: 보라색 테마로 꾸며져 있어 깔끔하고 일관성 있어요.

더 궁금한 점이나 연결이 안 되는 부분 있으면 언제든지 도와드릴게요!

============================================================================

물론이죠! 아래는 각 JSP 페이지에 초보자도 쉽게 이해할 수 있도록 친절한 주석을 추가한 버전입니다. 각 코드가 어떤 역할을 하는지 설명을 붙여드릴게요.

---

## 🎵 1. 음악 삭제 페이지 (music_list.jsp)

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- JSP 페이지 설정 -->
<%@ page import="java.util.*" %> <!-- 자바 유틸 클래스 import -->
<%@ page import="com.melon.peace.bean.Music" %> <!-- Music 클래스 import -->
```

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MUSIC LIST</title>
    <style>
        /* 전체 페이지 스타일 설정 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            margin-top: 20px;
        }

        /* 상단 링크 스타일 */
        h4 {
            text-align: center;
            margin-top: 20px;
        }

        h4 a {
            color: #800080;
            font-weight: bold;
            text-decoration: none;
        }

        h4 a:hover {
            color: #9b59b6;
        }

        /* 테이블 스타일 */
        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #800080;
            color: white;
        }

        td {
            background-color: #fff;
        }

        /* 체크박스 크기 조절 */
        input[type="checkbox"] {
            transform: scale(1.2);
        }

        /* 삭제 버튼 스타일 */
        button {
            background-color: #800080;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #9b59b6;
            transform: translateY(-3px);
        }

        button:active {
            transform: translateY(2px);
        }

        /* 모바일 대응 */
        @media (max-width: 768px) {
            table {
                width: 90%;
            }

            th, td {
                font-size: 12px;
                padding: 10px;
            }

            button {
                font-size: 14px;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- 홈으로 돌아가는 링크 -->
    <div>
        <h4><a href="/MVC_PROJECT/">Home</a></h4>
    </div>

    <!-- 페이지 제목 -->
    <div>
        <h1>MUSIC LIST</h1>
    </div>

    <!-- 삭제할 음악 선택 폼 -->
    <form action="delete_music.melon" method="post">
        <table>
            <tr>
                <th>선택</th>
                <th>NO.</th>
                <th>Title</th>
                <th>Vocal</th>
                <th>ReleaseComp</th>
                <th>ReleaseDate</th>
            </tr>

            <%-- 음악 리스트 출력 --%>
            <%
                List<Music> musicList = (List<Music>)request.getAttribute("musicList");
                for (int i = 0; i < musicList.size(); i++) {
                    Music music = musicList.get(i);
            %>
            <tr>
                <td><input type="checkbox" name="musicNo" value="<%= music.getMusicNo() %>"></td>
                <td><%= music.getMusicNo() %></td>
                <td><%= music.getTitle() %></td>
                <td><%= music.getVocal() %></td>
                <td><%= music.getReleaseComp() %></td>
                <td><%= music.getReleaseDate() %></td>
            </tr>
            <% } %>
        </table>

        <!-- 삭제 버튼 -->
        <button type="submit" id="delete">파일 삭제하기</button>
    </form>

    <!-- 수정 페이지 및 홈으로 이동 링크 -->
    <h4><a href="/MVC_PROJECT/update_detail_music.melon">수정하기</a></h4>
    <h4><a href="/MVC_PROJECT/">돌아가기</a></h4>
</body>
</html>
```

---

## 📝 2. 음악 등록 페이지 (music_write_form.jsp)

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
```

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Write</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 폼 박스 스타일 */
        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 30px;
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #800080;
            margin-bottom: 20px;
        }

        /* 입력 필드 스타일 */
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="text"]:focus, input[type="date"]:focus {
            border-color: #800080;
            outline: none;
        }

        /* 버튼 스타일 */
        input[type="button"] {
            width: 100%;
            padding: 14px;
            background-color: #800080;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #9b59b6;
        }

        input[type="button"]:active {
            background-color: #8e44ad;
        }

        /* 모바일 대응 */
        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
                width: 80%;
            }

            h1 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <!-- 음악 등록 폼 -->
    <div class="form-container">
        <h1>Music Write</h1>
        <form id="frm1" action="/MVC_PROJECT/music_write.melon" method="post">
            <input type="text" name="title" placeholder="Title" required><br>
            <input type="text" name="vocal" placeholder="Vocal" required><br>
            <input type="text" name="releaseComp" placeholder="ReleaseComp" required><br>
            <input type="date" name="releaseDate" required><br>
            <input type="button" id="btnWrite" value="WRITE"><br>
        </form>
    </div>

    <!-- 버튼 클릭 시 확인 후 제출 -->
    <script>
        document.getElementById('btnWrite').addEventListener('click', function(){
            if(confirm('Are you sure?')){					
                document.getElementById('frm1').submit();
            }
        });
    </script>
</body>
</html>
```

---

## 🏠 3. 메인 페이지 (index.jsp)

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
```

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Welcome to MVC Project</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        /* 제목 스타일 */
        h1 {
            text-align: center;
            color: #800080;
            margin-top: 50px;
            font-size: 36px;
        }

        h3 {
            text-align: center;
            font-size: 18px;
            color: #666;
        }

        /* 메뉴 영역 스타일 */
        div {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        ul {
            list-style-type: none;
            display: flex;
            gap: 20px;
            padding: 0;
        }

        li




좋은 질문이에요! 위에 작성한 코드들을 종합하면, 이 프로그램은 **웹 기반 음악 관리 시스템**입니다. 
사용자가 웹 페이지를 통해 음악 정보를 등록하고, 목록을 보고, 수정하거나 삭제할 수 있도록 만든 **MVC(Model-View-Controller) 구조의 웹 애플리케이션**이에요.

---

## 🧭 전체 작동 순서 (쉽게 설명)

1. **메인 페이지(index.jsp)**  
   - 사용자가 처음 접속하면 "Welcome to MVC Project"라는 메인 화면이 보여요.  
   - 여기서 두 가지 메뉴가 있어요:  
     - 🎵 음악 등록하기  
     - 📋 음악 목록 보기

2. **음악 등록 페이지(music_write_form.jsp)**  
   - 사용자가 곡 제목, 보컬, 발매사, 발매일을 입력하고 "WRITE" 버튼을 누르면  
   - `music_write.melon` 주소로 POST 요청이 전송돼요.

3. **컨트롤러(MusicController.java)**  
   - 사용자의 요청 주소를 분석해서 어떤 작업을 할지 결정해요.  
   - `music_write.melon` 요청이 들어오면 → `MusicModel.writeMusic()` 호출해서 DB에 저장해요.  
   - 저장 후 메인 페이지로 리다이렉트돼요.

4. **음악 목록 보기(music_list.melon)**  
   - 사용자가 목록 보기 메뉴를 누르면 → 컨트롤러가 `MusicModel.listMusic()`을 호출해서 DB에서 음악 리스트를 가져와요.  
   - 가져온 리스트는 `music_list.jsp`에 전달돼서 테이블로 출력돼요.

5. **음악 삭제(delete_music.melon)**  
   - 목록에서 체크박스로 삭제할 음악을 선택하고 "파일 삭제하기" 버튼을 누르면  
   - 컨트롤러가 `MusicModel.deleteMusic()`을 호출해서 DB에서 해당 음악을 삭제해요.

6. **음악 수정(update_music.melon)**  
   - 수정 페이지에서는 각 음악 정보를 input 박스로 보여줘요.  
   - 사용자가 수정하고 싶은 항목을 체크하고 수정한 뒤 "수정하기" 버튼을 누르면  
   - 컨트롤러가 `MusicModel.updateMusic()`을 호출해서 DB에 반영해요.

---

## 🧩 이 프로그램은 어떤 기능을 하나요?

| 기능 | 설명 |
|------|------|
| 🎼 음악 등록 | 곡 제목, 보컬, 발매사, 발매일을 입력해서 DB에 저장 |
| 📋 음악 목록 | 등록된 음악들을 테이블로 보여줌 |
| 🗑️ 음악 삭제 | 체크박스로 선택한 음악을 삭제 |
| ✏️ 음악 수정 | 선택한 음악의 정보를 수정 가능 |
| 🖥️ 웹 기반 | 브라우저에서 쉽게 사용 가능 |
| 🧠 MVC 구조 | Model(DB), View(JSP), Controller(Java Servlet)로 역할 분리 |

---

## 💡 쉽게 말하면?

이건 "음악 관리 웹 프로그램"이에요.  
선생님이나 관리자 입장에서 음악 정보를 등록하고, 수정하고, 삭제할 수 있는 **작은 음악 데이터베이스 시스템**이라고 보면 돼요.  
웹 브라우저만 있으면 누구나 사용할 수 있고, 디자인도 깔끔하게 되어 있어서 사용자 친화적이에요.

---

필요하면 데이터베이스 구조나 기능 확장 아이디어도 도와드릴 수 있어요! 예를 들어 검색 기능, 페이징 처리, 로그인 기능 등도 추가할 수 있죠. 원하시나요? 😊


