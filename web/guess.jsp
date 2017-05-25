<%-- 
    Document   : index
    Created on : Nov 7, 2016, 9:43:16 AM
    Author     : n5leee00
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.mypackage.memorygame.Shape"%>
<%@page import="org.mypackage.memorygame.Game"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Muistipeli</h1>
        <%
            Game game = (Game)session.getAttribute("game");
            ArrayList<Shape> currentShapes = (ArrayList <Shape>) session.getAttribute("currentShapes");
            ArrayList <Shape> suggestedShapes = (ArrayList <Shape>) session.getAttribute("suggestedShapes");

        %>
            <% for (int i = 0; i < suggestedShapes.size(); i++){ %>
                    <img src="<%=suggestedShapes.get(i).getFileName()%>">
            <% 
                    }
            %> 
        <br><br>
        <form action="result.jsp" method="post">
            <input type="radio" name="answer" value="equal" checked="checked">Kyllä<br><br>
            <input type="radio" name="answer" value="not-equal" >Ei
            <input type="submit" value="Jatka">
        </form>
    </body>
</html>