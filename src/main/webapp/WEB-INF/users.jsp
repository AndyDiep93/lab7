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
                    <h2>Add User</h2>
                    <p>*Enter new user info to be added</p>

                    <form id="addUser" action="user" method="post">

                        <input type="hidden" name="action" value="addUser">
                        <label for="email">Email:</label>
                        <input type="email" name="email" placeholder='Add User Email' required><br>

                        <label for="firstName">First Name:</label>
                        <input type="text" name="firstName" placeholder='Add User First Name'required><br>

                        <label for="Last Name">Last Name:</label>
                        <input type="text" name="lastName" placeholder='Add User Last Name'required><br>

                        <label for="password">Password:</label>
                        <input type="password" name="password" placeholder='Create Password'required><br>

                        <select name="role"required>
                            <option value="1">System administrator</option>
                            <option value="2">Regular user</option>
                            <option value="3">Company administrator</option>            
                        </select>  
                        <button type="submit">Add</button>

                    </form>

                    <br>
                    <br>

                    <h2>Current Users</h2>
                    <p>*These are all of the users</p>
                    <p>*Delete sets the user status to inactive</p>
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
                                    <td>${user.role.getName()}</td>

                                    <td>
                                        <a href="user?action=edit&email=${user.email}"></a>
                                        <a href="user?action=delete&email=${user.email}">Delete</a>       
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <br>
                    <br>

                    <div class="container">
                        <div class="row" > 
                            <div class="col">
                                <form id="editUser" action="user" method="post">
                                    <h2>Edit User</h2>
                                    <p>*Enter users email for the user info that needs to be edited</p>

                                    <input type="hidden" name="action" value="editUser">
                                    <label for="editEmail">Email:</label> 
                                    <input type="email" name="editEmail" placeholder='User Email'><br>

                                    <label for="editFirstName">First Name:</label> 
                                    <input type="text" name="editFirstName" placeholder='First Name'><br>

                                    <label for="editLastName">Last Name:</label> 
                                    <input type="text" name="editLastName" placeholder='Last Name'><br>

                                    <label for="editPassword">Password:</label> 
                                    <input type="password" name="editPassword" placeholder='password'><br>


                                    <select name="editRole" >
                                        <option value="1">System administrator</option>
                                        <option value="2">Regular user</option>
                                        <option value="3">Company administrator</option>            
                                    </select>
                                    <button type="submit">Save</button>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>    
                </body>
                </html>
