<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Error Interno del Servidor</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      text-align: center;
      padding: 50px;
    }
    h1 {
      color: #666;
    }
    p {
      color: #999;
    }
    a {
      display: inline-block;
      padding: 10px 20px;
      margin: 20px 0;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
    }
    a:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<h1>Error 500 - Error Interno del Servidor</h1>
<p>Lo sentimos, algo salió mal. Estamos trabajando para solucionar este problema.</p>
<a href="<%=request.getContextPath()%>">Regresar</a>
</body>
</html>
