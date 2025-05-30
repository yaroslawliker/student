<%--
  Created by IntelliJ IDEA.
  User: yarek
  Date: 25.04.25
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tests</title>
    <style>

        * {
            color: #3d3d3d;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 0;
            overflow: auto;
        }
        a {
            text-decoration: none;
        }
        .container {
            background-color: #fff;
            margin-top: 20px;
            padding: 30px 20px 10px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            row-gap: 10px;
        }
        .content {
            overflow: auto;
        }
        .form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .quizzes-name {
            font-weight: bold;
        }
        .line {
            border-bottom: 1px solid gray;
            width: 95%;
        }
        .name {
            max-width: 350px;
            font-weight: bold;
            font-size: small;
        }
        .description {
            max-width: 350px;
            font-size: smaller;
            align-self: flex-start;
        }
        .author-date {
            width: 90%;
        }
        .author-date > div {
            display: inline-block;
            font-size: x-small;
            color: #6e6e6e;
        }
        .author-date-gap {
            width: 100px;
        }
        .author {
            float: left;
        }
        .date {
            float: right;
        }

        .question-block {
            gap: 10px;
        }
        .text {
            max-width: 350px;
        }

        .finish-button {
            padding: 50px;
            width: fit-content;
            background-color: #8eb6e7;
            border-radius: 30px;
        }
        .score {
            font-size: small;
        }

        .datetime {
            font-size: x-small;
            color: #6e6e6e;
        }

    </style>
</head>
<body>
<%@include file="elements/navbar.jsp"%>

<div class="container content">
    <span class="quizzes-name">Test ${requestScope.quiz.id} </span>

    <div class="name">${requestScope.quiz.name}</div>

    <div class="description">${requestScope.quiz.description}</div>

    <div class="line"></div>

    <div class="author-date">
        <div class="author">${requestScope.username}</div>
        <div class="author-date-gap"></div>
        <div class="date">${requestScope.quiz.creationDate}</div>
    </div>

</div>

<div class="form">
    <c:forEach var="i" begin="0" end="${requestScope.resultAmount-1}">
        <div class="container content question-block">

            <div class="text">${requestScope.students[i]}</div>
            <div class="score">Score: ${requestScope.scores[i]} / ${requestScope.maxScore}</div>

            <div class="datetime">Started: ${requestScope.startTimes[i]}</div>
            <div class="datetime">Finished: ${requestScope.finishTimes[i]}</div>

        </div>
    </c:forEach>
</div>

</body>
</html>
