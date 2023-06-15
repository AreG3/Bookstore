package ovh.devnote.hello18.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.dto.BookDTO;
import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Ksiazka;
import ovh.devnote.hello18.services.BookService;
import ovh.devnote.hello18.services.CategoryService;
import ovh.devnote.hello18.services.CategoryServiceImpl;
import ovh.devnote.hello18.dao.BookDAO;


import javax.transaction.Transactional;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BookDAO bookDAO;

    @Autowired
    private BookService bookService;

    @GetMapping("/list")
    public String listCustomers(Model model)
    {
        List<Ksiazka> books = bookService.getBooks();
        model.addAttribute("books",books);
        return "bookslist";
    }

    @GetMapping("/bookformadd")
    public String addForm(Model model)
    {
        Ksiazka book = new Ksiazka();
        List<Kategoria> categories = categoryService.getCategories();

        model.addAttribute("book",book);
        model.addAttribute("categories",categories);
        return "addbookform";
    }


    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("bookDTO") BookDTO bookDTO) {
        int id = bookDTO.getId();
        Ksiazka ksiazka = bookService.getBook(id);
        if (ksiazka == null) {
            ksiazka = new Ksiazka();
        }
        Kategoria kat = categoryService.getCategory(bookDTO.getKategoriaid());
        ksiazka.setKategoria(kat);
        ksiazka.setNazwa(bookDTO.getNazwa());
        ksiazka.setWydawnictwo(bookDTO.getWydawnictwo());
        ksiazka.setCena(bookDTO.getCena());
        bookService.saveBook(ksiazka);
        return "redirect:/books/list";
    }


    @GetMapping("/formadd2")
    public String addForm2(Model model) {
        BookDTO bookDTO = new BookDTO();
        model.addAttribute("bookDTO", bookDTO);
        model.addAttribute("categories", categoryService.getCategories());
        return "addbookform2";
    }

    /*@GetMapping("updateBookForm")
    public String updateBookForm(@RequestParam("bookId")int bookid, Model model){
        BookDTO bookDTO = new BookDTO();
        Ksiazka ksiazka = bookService.getBook(bookid);
        model.addAttribute("bookDTO", bookDTO);
        model.addAttribute("categories", categoryService.getCategories());
        return "addbookform";
    }*/


    @GetMapping("updateBookForm")
    public String updateBookForm(@RequestParam("bookId")int bookid, Model model){
        Ksiazka ksiazka = bookService.getBook(bookid);
        List<Kategoria> categories = categoryService.getCategories();
        model.addAttribute("book",ksiazka);
        model.addAttribute("categories", categories);
        return "addbookform";
    }

    /*@GetMapping("/updateBookForm")
    public String updateBookForm(@RequestParam("bookId") int bookId, Model model) {
        Ksiazka ksiazka = bookService.getBook(bookId);
        List<Kategoria> categories = categoryService.getCategories(); // Pobierz wszystkie kategorie
        model.addAttribute("ksiazka", ksiazka);
        model.addAttribute("categories", categories); // Przekaż listę kategorii do widoku
        return "addbookform2";
    }*/

}
