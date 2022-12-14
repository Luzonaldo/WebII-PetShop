<%-- 
    Document   : produtos
    Created on : Oct 20, 2022, 9:01:00 AM
    Author     : ALUNO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.devCaotics.model.entities.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, td, th {border: 1px solid green}
        </style>
    </head>
    <body>
        <h1>Produtos Cadastrados</h1>
        
        <a href="cadastroProduto.jsp">Cadastrar um produto</a></br>
        <a href="index.html">home</a>
        
            <h2>${sessionScope.msg}</h2>
            
            <c:remove var="msg" scope="session"/>
            
            <% 
                session.removeAttribute("msg");
            %>
        
        <% 
            List<Produto> produtos = (List<Produto>)session.getAttribute("listaProdutos");
        %>
        
        <table>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Categoria</th>
                <th>Operações</th>
            </tr>
            <% 
                for(Produto p: produtos){
                    request.setAttribute("p", p);
            %>
                <tr>
                    <td>${requestScope.p.codigo}</td>
                    <td><%= p.getNome() %></td>
                    <td><%= p.getMarca() %></td>
                    <td><%= p.getCategoria() %></td>
                    <td>
                        <a href="ProdutoServlet?codigo=<%= p.getCodigo() %>&operacao=v">visualizar</a>
                        <a href="ProdutoServlet?codigo=<%= p.getCodigo() %>&operacao=a">alterar</a>
                        <a href="ProdutoServlet?codigo=<%= p.getCodigo() %>&operacao=d">deletar</a>
                    </td>
                </tr>
            
            <% } %>
        </table>
    </body>
</html>
