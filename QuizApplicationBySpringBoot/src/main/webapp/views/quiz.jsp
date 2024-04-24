<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .question {
            margin-bottom: 30px;
        }

        .options label {
            display: block;
            margin-bottom: 15px;
            cursor: pointer;
            padding-left: 25px;
            position: relative;
            font-size: 16px;
            color: #333;
            transition: color 0.3s ease;
        }

        .options input[type="radio"] {
            display: none;
        }

        .options label::before {
            content: '';
            display: inline-block;
            width: 18px;
            height: 18px;
            border: 2px solid #999;
            border-radius: 50%;
            margin-right: 10px;
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            transition: background-color 0.3s ease;
        }

        .options input[type="radio"]:checked+label::before {
            background-color: #2196F3;
            border-color: #2196F3;
        }

        .submit-btn {
            display: block;
            margin: 0 auto;
            padding: 12px 40px;
            background-color: #2196F3;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #0c7cd5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quiz</h1>
        <form id="quiz-form" action="/result">

            <c:forEach var="q" items="${quiz}">
            <div class="question">
                <p>${q.question}</p>
                 <div class="options">
                    <input type="radio" id="option1_${q.sno}" name="question${q.sno}" value="${q.option1}">
                    <label for="option1_${q.sno}">${q.option1}</label>
                    <input type="radio" id="option2_${q.sno}" name="question${q.sno}" value="${q.option2}">
                    <label for="option2_${q.sno}">${q.option2}</label>
                    <input type="radio" id="option3_${q.sno}" name="question${q.sno}" value="${q.option3}">
                    <label for="option3_${q.sno}">${q.option3}</label>
                    <input type="radio" id="option4_${q.sno}" name="question${q.sno}" value="${q.option4}">
                    <label for="option4_${q.sno}">${q.option4}</label>
                </div>
            </div>
            </c:forEach>

            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>
</body>
</html>
