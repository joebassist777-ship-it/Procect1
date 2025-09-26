<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%!
    public static List<Map<String,String>> musicList = new ArrayList<Map<String, String>>();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Music Entry</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #800080;
            color: white;
            padding: 15px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            margin: 0;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="text"], input[type="date"] {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus {
            border-color: #800080;
        }

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

        button:hover {
            background-color: #9b59b6;
        }

        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
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

        .table-container {
            margin-top: 30px;
            overflow-x: auto;
        }

        /* 반응형 디자인 */
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
    <header>
        <h1>음악 등록</h1>
    </header>

    <div class="container">
        <form action="add_music.jsp" method="post">
            <div class="form-container">
                <input type="text" name="title" placeholder="곡 제목" required>
                <input type="text" name="vocal" placeholder="보컬" required>
                <input type="text" name="releaseComp" placeholder="발매사" required>
                <input type="date" name="releaseDate" required>
                <button type="submit">곡 등록하기</button>
            </div>
        </form>

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

                <%
                    List<Map<String, String>> musicList = (List<Map<String, String>>)application.getAttribute("musicList");
                    if (musicList != null && !musicList.isEmpty()) {
                        for (int i = 0; i < musicList.size(); i++) {
                            Map<String, String> music = musicList.get(i);
                %>
                <tr>
                    <td><%= i + 1 %></td>
                    <td><%= music.get("title") %></td>
                    <td><%= music.get("vocal") %></td>
                    <td><%= music.get("releaseComp") %></td>
                    <td><%= music.get("releaseDate") %></td>
                </tr>
                <%
                        }
                    } else {
                %>
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


==============================================================



                  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.melon.peace.bean.Music" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MUSIC LIST</title>
    <style>
           /* 전체적인 body 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

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
            font-weight: bold;
        }

        td {
            background-color: #ffffff;
        }

        /* 체크박스 스타일 */
        input[type="checkbox"] {
            transform: scale(1.2);
            margin: 0;
        }

        /* 삭제 버튼 스타일 */
        button {
            display: inline-block;
            background-color: #800080;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
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

        /* 반응형 웹 디자인 */
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
<body>
    <div>
        <h4><a href="/MVC_PROJECT/">Home</a></h4>
    </div>

    <div>
        <h1>MUSIC LIST</h1>
    </div>

    <!-- ✅ form으로 묶어야 체크된 값들을 전송할 수 있음 -->
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

            <%
                List<Music> musicList = (List<Music>)request.getAttribute("musicList");
                for (int i = 0; i < musicList.size(); i++) {
                    Music music = musicList.get(i);
            %>
            
            <tr>
                <!-- ✅ 체크박스의 name과 value 지정 -->
                <td>
                    <input type="checkbox" name="selectedMusicNo" value="<%= music.getMusicNo() %>">
                </td>
                <td><%= music.getMusicNo() %></td>
                <td>
                    <!-- 기존 값은 input 박스로 수정 가능하게 변경 -->
                    <input type="text" name="title_<%= music.getMusicNo() %>" value="<%= music.getTitle() %>">
                </td>
                <td>
                    <input type="text" name="vocal_<%= music.getMusicNo() %>" value="<%= music.getVocal() %>">
                </td>
                <td>
                    <input type="text" name="releaseComp_<%= music.getMusicNo() %>" value="<%= music.getReleaseComp() %>">
                </td>
                <td>
                    <input type="text" name="releaseDate_<%= music.getMusicNo() %>" value="<%= music.getReleaseDate() %>">
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <button type="submit" id="edit">수정하기</button>
        
    </form>
    <h4><a href="/MVC_PROJECT/">돌아가기</a></h4>
</body>
</html>
================================================================

              <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.melon.peace.bean.Music" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MUSIC LIST</title>
    <style>
        /* 전체적인 body 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

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
            font-weight: bold;
        }

        td {
            background-color: #ffffff;
        }

        /* 체크박스 스타일 */
        input[type="checkbox"] {
            transform: scale(1.2);
            margin: 0;
        }

        /* 삭제 버튼 스타일 */
        button {
            display: inline-block;
            background-color: #800080;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
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

        /* 반응형 웹 디자인 */
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
<body>
    <div>
        <h4><a href="/MVC_PROJECT/">Home</a></h4>
    </div>

    <div>
        <h1>MUSIC LIST</h1>
    </div>

    <!-- ✅ form으로 묶어야 체크된 값들을 전송할 수 있음 -->
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

            <%
                List<Music> musicList = (List<Music>)request.getAttribute("musicList");
                for (int i = 0; i < musicList.size(); i++) {
                    Music music = musicList.get(i);
            %>
            <tr>
                <!-- ✅ 체크박스의 name과 value 지정 -->
                <td>
                    <input type="checkbox" name="musicNo" value="<%= music.getMusicNo() %>">
                </td>
                <td><%= music.getMusicNo() %></td>
                <td><%= music.getTitle() %></td>
                <td><%= music.getVocal() %></td>
                <td><%= music.getReleaseComp() %></td>
                <td><%= music.getReleaseDate() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <!-- ✅ form 안에서 전송 버튼으로 처리 -->
        <button type="submit" id="delete">파일 삭제하기</button>
        
    </form>
        <h4><a href="/MVC_PROJECT/update_detail_music.melon">수정하기</a></h4>
        <h4><a href="/MVC_PROJECT/">돌아가기</a></h4>
</body>
</html>

                  ========================================================



              <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.melon.peace.bean.Music" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MUSIC LIST</title>
    <style>
        /* 전체적인 body 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

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
            font-weight: bold;
        }

        td {
            background-color: #ffffff;
        }

        /* 체크박스 스타일 */
        input[type="checkbox"] {
            transform: scale(1.2);
            margin: 0;
        }

        /* 삭제 버튼 스타일 */
        button {
            display: inline-block;
            background-color: #800080;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
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

        /* 반응형 웹 디자인 */
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
<body>
    <div>
        <h4><a href="/MVC_PROJECT/">Home</a></h4>
    </div>

    <div>
        <h1>MUSIC LIST</h1>
    </div>

    <!-- ✅ form으로 묶어야 체크된 값들을 전송할 수 있음 -->
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

            <%
                List<Music> musicList = (List<Music>)request.getAttribute("musicList");
                for (int i = 0; i < musicList.size(); i++) {
                    Music music = musicList.get(i);
            %>
            <tr>
                <!-- ✅ 체크박스의 name과 value 지정 -->
                <td>
                    <input type="checkbox" name="musicNo" value="<%= music.getMusicNo() %>">
                </td>
                <td><%= music.getMusicNo() %></td>
                <td><%= music.getTitle() %></td>
                <td><%= music.getVocal() %></td>
                <td><%= music.getReleaseComp() %></td>
                <td><%= music.getReleaseDate() %></td>
            </tr>
            <%
                }
            %>
        </table>

        <!-- ✅ form 안에서 전송 버튼으로 처리 -->
        <button type="submit" id="delete">파일 삭제하기</button>
        
    </form>
        <h4><a href="/MVC_PROJECT/update_detail_music.melon">수정하기</a></h4>
        <h4><a href="/MVC_PROJECT/">돌아가기</a></h4>
</body>
</html>


=============================================================================

              <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Write</title>
    <style>
        /* 전반적인 body 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 폼을 감싸는 div 스타일 */
        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 400px;
        }

        /* 헤더 스타일 */
        h1 {
            text-align: center;
            color: #800080;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* 각 input 필드 스타일 */
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
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
            transition: background-color 0.3s ease;
        }

        input[type="button"]:hover {
            background-color: #9b59b6;
        }

        input[type="button"]:active {
            background-color: #8e44ad;
        }

        /* 반응형 디자인 */
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
    <div class="form-container">
        <h1>Music Write</h1>
        <form id="frm1" action="/MVC_PROJECT/music_write.melon" method="post">
            <input type="text" name="title" placeholder="Title" required><br>
            <input type="text" name="vocal" placeholder="Vocal" required><br>
            <input type="text" name="releaseComp" placeholder="ReleaseComp" required><br>
            <input type="date" name="releaseDate" placeholder="ReleaseDate" required><br>
            <input type="button" id="btnWrite" value="WRITE"><br>
        </form>
    </div>

    <script>
        document.getElementById('btnWrite').addEventListener('click', function(){
            if(confirm('Are you sure?')){					
                document.getElementById('frm1').submit();
            }
        });
    </script>
</body>
</html>


                  =========================================================

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Welcome to MVC Project</title>
    <style>
        /* 전체적인 body 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        h1 {
            text-align: center;
            color: #800080;
            margin-top: 50px;
            font-size: 36px;
            font-weight: bold;
        }

        h3 {
            text-align: center;
            font-size: 18px;
            color: #666;
        }

        /* 네비게이션 스타일 */
        div {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            gap: 20px;
        }

        li {
            display: inline-block;
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: #800080;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #9b59b6;
            transform: translateY(-3px);
        }

        a:active {
            transform: translateY(2px);
        }

        /* 반응형 웹 디자인 */
        @media (max-width: 768px) {
            h1 {
                font-size: 28px;
            }

            ul {
                flex-direction: column;
                gap: 15px;
            }

            a {
                font-size: 16px;
                padding: 10px 18px;
            }
        }
    </style>
</head>
<body>
    <h1>Welcome to MVC Project</h1>
    <h3>Your Web Application</h3>
    <div>
        <ul>
            <li><a href="/MVC_PROJECT/music_write_form.melon">1. Music Write</a></li>
            <li><a href="/MVC_PROJECT/music_list.melon">2. Music List</a></li>
        </ul>
    </div>
</body>
</html>
