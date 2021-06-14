<%-- 
    Document   : disciplinas
    Created on : 14 de jun. de 2021, 07:50:09
    Author     : cutekah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    if (request.getParameter("add")!= null) {
        String nome = request.getParameter("nome");
        String diaDaSemana = request.getParameter("diaDaSemana");
        String horario = request.getParameter("horario");
        int qtAulas = Integer.parseInt(request.getParameter("qtAulas"));
    try{
        Disciplinas.addDisciplina(nome, diaDaSemana, horario, qtAulas, 0.0, 0.0);
        response.sendRedirect(request.getRequestURI());
    }catch (Exception ex) {
        requestError = "FALHA AO CRIAR A DISCIPLINA" ["+ex.getMessage()+]";
    }
    }else if (request.getParameter("remove")! = null) {
    String nome = request.getParameter("nome");
    try{
        Disciplinas.removeDisciplina(nome);
        reponse.sendRedirect(request.getRequestURI());
    }catch (Exception ex) {
        requestError = "FALHA NA EXCLUSAO DA DISCIPLINA ["+ex.getMessage()+"]";
    }
    }else if (request.getParameter("update")! = null) {
    String nome = request.getParameter("nome");
     Double notap1 = Double.parseDouble("notap1");
     Double notap2 = Double.parseDouble("notap2");
    try{
        Disciplinas.removeDisciplina(nome, notap1, notap2);
        reponse.sendRedirect(request.getRequestURI());
    }catch (Exception ex) {
        requestError = "FALHA NA ADICAO DA DISCIPLINA ["+ex.getMessage()+"]";
    }
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(requestError != null){%>
            <div style="color: red">
                Erro ao manipular perfil: <%= requestError %>
            </div>
        <%}%>
        <h2>Meu Perfil</h2>
        <% String login = (String) session.getAttribute("user.login");%>
        <%if(login == null){%>
            <div>Esta página é restrita a usuários logados.</div>
        <%}else{%>
        <fieldset>
        <legend>Nova disciplina:</legend>
        <form method="post">
            Nome: <br/><input type="text" name="nome"/>
            <br/>Dia da semana<input type="text" name="nome"/>
            <br/>Horario<input type="text" name="nome"/>
            <br/>QtAulas<input type="text" name="nome"/>
            <br><br/>
            <input type="submit" name="add" value="Adicionar">
        </form>
        </fieldset>
        
        <br/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Dia da semana </th>
                <th>Horario</th>
                <th>QT Aulas</th>
                <th>Notap1</th>
                <th>Notap2</th>
                <th>Alterar</th>
                <th>Excluir</th>
            </tr>
            <%for(Disciplinas disciplina: Disciplinas.getDisciplinas()){%>
            <tr>
                <td><%= disciplina.getNome()%></td>
                <td><%= disciplina.getDiaDaSemana()%></td>
                <td><%= disciplina.getHorario()%></td>
                <td><%= disciplina.getQtAulas()%></td>
                <td><%= disciplina.getNotap1()%></td>
                <td><%= disciplina.getNotap2()%></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="nome" value="<%= disciplina.getNome()%>"
                        <input type="text" name="notap1" placeholder="Nota P1"/>
                        <input type="text" name="notap2" placeholder="Nota P2"/>
                        <input type="submit" name="updtade" placeholder="Alteracao"/>
                    </form>
                </td>
                <td>
                    <form method="post">
                        <input type="hidden" name="nome" value="<%= disciplina.getNome()%>"
                        <input type="submit" name="remove" value="Remover"/>
                    </form>
                </td>
            </tr>
        <%}%>
        </table>
        <%}%>
    </body>
</html>
