package ovh.devnote.hello18.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ovh.devnote.hello18.entity.Ksiazka;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Ksiazka> getBooks() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Ksiazka> cq = cb.createQuery(Ksiazka.class);
        Root<Ksiazka> root = cq.from(Ksiazka.class);
        cq.select(root);
        return session.createQuery(cq).getResultList();
    }

    @Override
    public Ksiazka getBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Ksiazka.class, id);
    }

    @Override
    public void saveBook(Ksiazka ksiazka) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(ksiazka);
    }

    @Override
    public void updateBook(Ksiazka ksiazka) {
        Session session = sessionFactory.getCurrentSession();
        session.update(ksiazka);
    }

    @Override
    public void deleteBook(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Ksiazka book = currentSession.get(Ksiazka.class, id);
        if (book != null) {
            currentSession.delete(book);
        }
    }

    @Override
    public List<Ksiazka> getBooksInCart(List<Integer> bookIds) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Ksiazka> cq = cb.createQuery(Ksiazka.class);
        Root<Ksiazka> root = cq.from(Ksiazka.class);
        cq.select(root).where(root.get("id").in(bookIds));
        return session.createQuery(cq).getResultList();
    }
}
