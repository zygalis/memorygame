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
            ArrayList<Shape> suggestedShapes = (ArrayList <Shape>) session.getAttribute("suggestedShapes");
            
            String answer = request.getParameter("answer");
            game.setUserAnswer(answer);
            
        
        if (game.isCorrectAnswer() == true){ %>
            <p>Oikein!</p>
            <p>Olet tässä vaiheessa muistanut oikein <%=currentShapes.size()%> muotoa</p>
            <p>Sinulle ensin näytetyt muodot olivat seuraavat:</p>
            <p></p>
            <% for (int i = 0; i < currentShapes.size(); i++){ %>
                <img src="<%=currentShapes.get(i).getFileName()%>">
            <%}%>
            <p> Ja sen jälkeen näytetyt muodot olivat seuraavat:</p>
            <% for (int i = 0; i < suggestedShapes.size(); i++) {%>
                <img src="<%=suggestedShapes.get(i).getFileName()%>">
            <%
            game.clearShapes();} 
            %>
            <form action="game.jsp" method="post">
                <input type="submit" value="jatka">
            </form>
        <%}
        else if (game.isCorrectAnswer() == false){ 
            game.stopCounter();%>
            <p>VÄÄRIN!</p>
            <p>Muistit <%=(currentShapes.size() - 1)%> muotoa ja siihen loppui sinun muistisi.</p>
            <p>Pelisi kesti <%game.calculateReactionTime();%><%=game.getReactionTime()/1000.0%> sekuntia</p>
            <p>Sinulle ensin näytetyt muodot olivat seuraavat:</p>
            <p></p>
            <% for(int i = 0; i < currentShapes.size(); i++){ %>
                <img src="<%=currentShapes.get(i).getFileName()%>"/>
                
            <%}%>
            <p> Ja sen jälkeen näytety muodot olivat seuraavat:</p>
            <% for (int i = 0; i < suggestedShapes.size(); i++){ %>
                <img src="<%=suggestedShapes.get(i).getFileName()%>"/>
            <%}%>  
            <form action="index.jsp" method="post">
                <input type="submit" value="Uusi peli"/>
            </form>
        <%}%>
    </body>
</html>