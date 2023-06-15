package ovh.devnote.hello18.services;

import ovh.devnote.hello18.entity.Ksiazka;

import java.util.List;

public interface BookService {
    List<Ksiazka> getBooks();

    Ksiazka getBook(int id);

    public void saveBook(Ksiazka ksiazka);

    public void updateBook(Ksiazka ksiazka);

    void deleteBook(int id);

}
