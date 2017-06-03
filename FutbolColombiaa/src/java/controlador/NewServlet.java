/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Acceso.DAOEquipo;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.equipos;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100,// 100 MB
        location = "C:\\Users\\IAN\\Documents\\NetBeansProjects\\FutbolColombiaa\\web\\imagenes"
)

public class NewServlet extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;

    /**
     * Directory where uploaded files will be saved, its relative to the web
     * application directory.
     */
    private static final String UPLOAD_DIR = "imagenes";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        DAOEquipo dao = new DAOEquipo();
        String uploadFilePath = "C:\\Users\\IAN\\Documents\\NetBeansProjects\\FutbolColombiaa\\web" + File.separator + UPLOAD_DIR;
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());
        equipos equipo = new equipos();
        String fileName = null;

        equipo.setNombre(request.getParameter("nombre"));
//          String nombre = (request.getParameter("nombre"));
        equipo.setEstadio(request.getParameter("estadio"));
        equipo.setFecha_fundacion(Integer.parseInt(request.getParameter("anio")));
        for (Part part : request.getParts()) {
            if (fileName == null) {
                fileName = getFileName(part);
                part.write(fileName);
            }
        }
        equipo.setPath(UPLOAD_DIR + "\\" + fileName );
        dao.crear(equipo);
        request.setAttribute("message", fileName + " File uploaded successfully!");
        getServletContext().getRequestDispatcher("/equipos.jsp").forward(
                request, response);

    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
