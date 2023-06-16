package ovh.devnote.hello18.dao;

import ovh.devnote.hello18.entity.Ksiazka;


import java.util.List;
import java.util.Set;

public interface BookDAO {
    public List<Ksiazka> getBooks();

    public List<Ksiazka> getBooksInCart(List<Integer> id);

    public void saveBook(Ksiazka ksiazka);
    public void updateBook(Ksiazka ksiazka);
    public Ksiazka getBook(int id);

    public void deleteBook(int id);


}
