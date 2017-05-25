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
            game.startCounter();
            
            game.setCurrentShapes();
            game.setSuggestedShapes();
            
            ArrayList <Shape> currentShapes = game.getCurrentShapes();
            ArrayList <Shape> suggestedShapes = game.getSuggestedShapes();
            
            session.setAttribute("currentShapes", currentShapes);
            session.setAttribute("suggestedShapes", suggestedShapes);
        %>
            
            <p></p>
            <% for (int i = 0; i < currentShapes.size(); i++){  %>
                    <img src="<%=currentShapes.get(i).getFileName()%>">
            <% 
                    }
            %>
             <br><br><form action="guess.jsp" method="get">
                    <input type="submit" value="Jatka"/>
            </form>
    </body>
</html>