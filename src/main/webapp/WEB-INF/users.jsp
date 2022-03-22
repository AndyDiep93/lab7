<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Andy's User Management System</h1>

                    <!--Add Users-->
                    <form id="addUser" action="user" method="post">
                        
                        <input type="hidden" name="action" value="addUser">

                        <input type="email" name="email" placeholder='Add User Email' required><br>
                        <input type="text" name="firstName" placeholder='Add User First Name'required><br>
                        <input type="text" name="lastName" placeholder='Add User Last Name'required><br>
                        <input type="password" name="password" placeholder='Create Password'required><br>
                        <select name="role"required>
                            <option value="1" selected>System admin</option>
                            <option value="2">Regular user</option>
                            <option value="3">Company admin</option>            
                        </select>  <button type="submit">Add</button>
                        <br>
                       

                    </form>
                    </td>
                    </tr>
                    </table>

                    </form> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>E-mail</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Active</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items= "${users}">
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.active ? "Y" : "N"}</td>

                                    <td>
                                        <a href="">Edit</a>
                                        <a href="user?action=delete&email=${user.email.replace("+", "%2B")}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>    
    </body>
</html>
