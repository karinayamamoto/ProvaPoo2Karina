<%-- 
    Document   : index
    Created on : 14 de jun. de 2021, 08:29:30
    Author     : cutekah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>KARINA NAMIE YAMAMOTO CARDOSO</h1>
        <h1>1290481922021</h1>
        <h1>Ingresso em : 2 semestre 2019</h1>
        <a href="https://github.com/karinayamamoto">GITHUB</a>
        
        <hr/>
        
        <% String login = (String) session.getAttribute("user.login");%>
        <%if (login == null) {%>
        <div>Restrita p/ usuarios logados</div>
        <%}else{%>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Nota p1 </th>
                <th>Nota p2</th>
                <th>Media</th>
            <tr/>
            <%for Disciplinas disciplina: Disciplinas.getDisciplinas()) {%>
            <tr>
                <td><%=disciplina.getNome()%></td>
                <td><%=disciplina.getNotap1()%></td>
                <td><%=disciplina.getNotap2()%></td>
                <td><%=(disciplina.getNotap1() + disciplina.getNotap2()) / 2 %></td>
            </tr>
            <%}%>
        </table>         
    </body>
</html>
