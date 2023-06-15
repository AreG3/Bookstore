package ovh.devnote.hello18.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ovh.devnote.hello18.dao.BookDAO;
import ovh.devnote.hello18.entity.Ksiazka;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDAO bookDAO;

    @Override
    @Transactional
    public List<Ksiazka> getBooks() {
        return bookDAO.getBooks();
    }

    @Override
    @Transactional
    public Ksiazka getBook(int id) {
        return bookDAO.getBook(id);
    }

    @Override
    @Transactional
    public void saveBook(Ksiazka ksiazka) {
        if (ksiazka.getId() != 0) {
            Ksiazka existingBook = bookDAO.getBook(ksiazka.getId());
            if (existingBook != null) {
                existingBook.setNazwa(ksiazka.getNazwa());
                existingBook.setWydawnictwo(ksiazka.getWydawnictwo());
                existingBook.setCena(ksiazka.getCena());
                existingBook.setKategoria(ksiazka.getKategoria());
                bookDAO.updateBook(existingBook);
            }
        } else {
            bookDAO.saveBook(ksiazka);
        }
    }


    @Override
    @Transactional
    public void updateBook(Ksiazka ksiazka) {
        bookDAO.updateBook(ksiazka);
    }
}
