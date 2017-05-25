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
            Game game = new Game();
            
            ArrayList <Shape> shapes = game.getShapes();        
            session.setAttribute("game", game);

        %>
            <p>Tehtäväsi on yrittää muistaa pelin esittämiä muotoja. Aina kun pääset eteenpäin, näytettävien muotojen määrä kasvaa yhdellä. 
                Muotojen pitää olla samoja ja samassa järjestyksessä. Erilaisia muotoja on <%=shapes.size()%> ja ne ovat seuraavat:</p>
            
            <p></p>
                <% for (int i = 0; i < shapes.size(); i++){ %>
                    <img src="<%=shapes.get(i).getFileName()%>">
            <% 
                    }
            %>
            <br><br><form action="game.jsp" method="get">
                    <input type="submit" value="Aloita peli"/>
            </form>
    </body>
</html>
