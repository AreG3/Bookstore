package ovh.devnote.hello18.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.entity.Cart;
import ovh.devnote.hello18.entity.Ksiazka;
import ovh.devnote.hello18.services.BookService;


import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private Cart cart;

    @Autowired
    private BookService bookService;

    public CartController(Cart cart, BookService bookService) {
        this.cart = cart;
        this.bookService = bookService;
    }

    @GetMapping
    public String cart(Model model) {
        List<Ksiazka> cartBooks = bookService.getBooksInCart(cart.getBookIds());
        model.addAttribute("books", cartBooks);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam(name = "bookId") int id) {
        cart.addBookId(id);
        return "redirect:/cart";
    }

    @PostMapping("/cart/delete/{bookId}")
    public String removeFromCart(@PathVariable int bookId) {
        cart.deleteBookId(bookId);
        return "redirect:/cart";
    }


}
