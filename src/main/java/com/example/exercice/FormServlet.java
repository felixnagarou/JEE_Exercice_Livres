package com.example.exercice;

import com.example.exercice.models.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FormServlet", value = "/FormServlet")
public class FormServlet extends HttpServlet {
    private List<Book> books;

    @Override
    public void init() throws ServletException {
        books = new ArrayList<>();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("title", "");
        req.setAttribute("author", "");
        req.setAttribute("date", LocalDate.now().toString());
        req.setAttribute("type", "");
        req.setAttribute("isbn", "1");
        req.setAttribute("confirmation", false);
        req.setAttribute("books", books);

        getServletContext().getRequestDispatcher("/WEB-INF/addBook.jsp").forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        LocalDate date = LocalDate.parse(req.getParameter("date"));
        String type = req.getParameter("type");
        String isbn = req.getParameter("isbn");

        Book book = new Book(title, author, date, type, isbn);
        books.add(book);
        req.setAttribute("confirmation", false);req.setAttribute("confirmation", true);
        System.out.println(book);

        req.setAttribute("title", title);
        req.setAttribute("author", author);
        req.setAttribute("date", date.toString());
        req.setAttribute("type", type);
        req.setAttribute("isbn", isbn);
        req.setAttribute("books", books);
        getServletContext().getRequestDispatcher("/WEB-INF/addBook.jsp").forward(req, resp);
    }
}
