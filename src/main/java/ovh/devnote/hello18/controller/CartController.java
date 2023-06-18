package ovh.devnote.hello18.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.entity.Cart;
import ovh.devnote.hello18.entity.Ksiazka;
import ovh.devnote.hello18.services.BookService;


import java.util.Set;

@Controller
@RequestMapping("/cart")
public class CartController {

    private Cart cart;
    private BookService bookService;

    @Autowired
    public CartController(Cart cart, BookService bookService) {
        this.cart = cart;
        this.bookService = bookService;
    }

    @GetMapping
    public String cart(Model model) {
        Set<Ksiazka> cartBooks = bookService.getBooksInCart(cart.getBookIds());
        model.addAttribute("books", cartBooks);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam(name = "bookId") int id) {
        cart.addBookId(id);
        return "redirect:/cart";
    }


    @PostMapping("/delete")
    public String removeFromCart(@RequestParam("bookId") int id) {
        cart.deleteBookId(id);
        return "redirect:/cart";
    }

}