<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <#include "users_dashboard.css">
</head>
<body>
    <h1 class="top-header">User Dashboard (${user.name})</h1>
    <div class="container">

        <!-- Side navigation -->
        <div class="sidenav">
            <a href="/users/dashboard/connections?user_id=${user.id}">Connections</a>
            <a href="/users/dashboard/authorizations?user_id=${user.id}">Authorizations</a>
            <a href="/users/sign_in">Sign Out</a>
        </div>

        <div class="main">
            <h2>Consents</h2>

            <form method="post" action="/users/dashboard/consents/create">
                <input type="hidden" name="user_id" value="${user.id}">
                <input type="submit" value="Create new">
            </form>

            <br>

            <#list consents>
                <table border="1">
                    <tr>
                       <th>ID</th>
                       <th>Title</th>
                       <th>Description</th>
                       <th>ExpiresAt</th>
                    </tr>
                <#items as item>
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.title}</td>
                        <td>${item.description}</td>
                        <td>${item.expiresAt.toString()}</td>
                    </tr>
                </#items>
            </table>
            <#else>
                <p>Not registered</p>
            </#list>
        </div>
    </div>
</body>
</html>