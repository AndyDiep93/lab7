package ca.sait.lab7.servlets;

import ca.sait.lab7.models.Role;
import ca.sait.lab7.models.User;
import ca.sait.lab7.services.RoleService;
import ca.sait.lab7.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andy Diep
 */
public class UserServlet extends HttpServlet {

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();
        RoleService roleService = new RoleService();
        String email = request.getParameter("email");
        String action = request.getParameter("action");

        try {
            List<User> users = service.getAll();

            request.setAttribute("users", users);
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            List<Role> roles = roleService.getAll();

            request.setAttribute("roles", roles);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (action.equals("delete")) {
            try {
                service.delete(email);
            } catch (Exception ex) {
                request.setAttribute("message", "Error.");
            }
        }

        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
//        UserService service = new UserService();
//        RoleService roleService = new RoleService();
//
//        String action = request.getParameter("action");
//
//        try {
//            List<User> users = service.getAll();
//
//            request.setAttribute("users", users);
//        } catch (Exception ex) {
//            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        try {
//            List<Role> roles = roleService.getAll();
//
//            request.setAttribute("roles", roles);
//        } catch (Exception ex) {
//            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        if (action.equals("edit") && action != null) {
//
//            try {
//                String email = request.getParameter("editEmail");
//                String firstName = request.getParameter("editFirstName");
//                String lastName = request.getParameter("editLastName");
//                String password = request.getParameter("editPassword");
//                String roleName = request.getParameter("editRoleName");
//
//                int roleId = roleService.getRoleId(roleName);
//
//                service.update(email, true, firstName, lastName, password, new Role(roleId, roleName));
//            } catch (Exception ex) {
//                request.setAttribute("message", "Error.");
//            }
//        }
//
//        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
//    }
}
