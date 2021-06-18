package com.controller.admin;

import java.io.BufferedReader;
import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.queryDAO;
import DAO.HttpUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.model.Api_data;
import com.model.Api_datalist;
import com.model.Article;

import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter;

@WebServlet("/api-admin-data")
public class insertProductSize extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public insertProductSize() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Api_data data = HttpUtil.of(request.getReader()).toModel(Api_data.class);
        System.out.print(data);
        queryDAO dao = new queryDAO();
        List<Article> list = dao.paging();
        String json = new Gson().toJson(list);

        response.getWriter().write(json);
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TypeToken<List<Api_datalist>> datarc = new TypeToken<List<Api_datalist>>() {
        };
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        BufferedReader reader = request.getReader();
        Gson gs = new Gson();
        List<Api_data> rs = gs.fromJson(reader, new TypeToken<List<Api_data>>() {
        }.getType());
        String str = "success";
        String json = new Gson().toJson(str);
        queryDAO qD = new queryDAO();

        try {
            if (qD.insertProductSize(rs.get(0).getidsize(), rs.get(0).getsize(), rs.get(0).getavailable()))
                str = "true";
            else
                str = "error";
        } catch (Exception e) {
            System.out.print(e);
        }

        String id = qD.getProductSizeId(rs.get(0).getidsize(), rs.get(0).getsize(), rs.get(0).getavailable());


        if (str == "true") {
            id = new Gson().toJson(id);
            response.getWriter().write(id);
        }

    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TypeToken<List<Api_datalist>> datarc = new TypeToken<List<Api_datalist>>() {
        };
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        BufferedReader reader = request.getReader();
        Gson gs = new Gson();
        List<Api_data> rs = gs.fromJson(reader, new TypeToken<List<Api_data>>() {
        }.getType());
        String str = "success";
        String json = new Gson().toJson(str);
        queryDAO qD = new queryDAO();
        for (int i = 0; i < rs.size(); i++) {
            try {
                if (qD.deleteProductSize(rs.get(i).getidsize()))
                    str = "true";
                else
                    str = "error";
            } catch (Exception e) {
                System.out.print(e);
            }
        }
        if (str == "true") {
            str = new Gson().toJson(str);
            response.getWriter().write(str);
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TypeToken<List<Api_datalist>> datarc = new TypeToken<List<Api_datalist>>() {
        };
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        BufferedReader reader = request.getReader();
        Gson gs = new Gson();
        List<Api_data> rs = gs.fromJson(reader, new TypeToken<List<Api_data>>() {
        }.getType());
        String str = "success";
        String json = new Gson().toJson(str);
        queryDAO qD = new queryDAO();
        for (int i = 0; i < rs.size(); i++) {
            try {
                if (qD.updateProductSize(rs.get(i).getidsize(), rs.get(i).getsize(), rs.get(i).getavailable()))
                    str = "true";
                else
                    str = "error";
            } catch (Exception e) {
                System.out.print(e);
            }
        }
        if (str == "true") {
            str = new Gson().toJson(str);
            response.getWriter().write(str);
        }

    }
}
