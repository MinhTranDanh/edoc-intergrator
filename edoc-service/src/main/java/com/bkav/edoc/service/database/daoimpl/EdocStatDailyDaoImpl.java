package com.bkav.edoc.service.database.daoimpl;

import com.bkav.edoc.service.database.dao.EdocStatDailyDao;
import com.bkav.edoc.service.database.entity.EdocDailyCounter;
import com.bkav.edoc.service.database.entity.EdocDocument;
import com.bkav.edoc.service.database.entity.EdocStatDaily;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class EdocStatDailyDaoImpl extends RootDaoImpl<EdocStatDaily, Long> implements EdocStatDailyDao {

    public EdocStatDailyDaoImpl() {
        super(EdocStatDaily.class);
    }


    public void createStatDaily(EdocStatDaily statDaily) {
        this.persist(statDaily);
    }


    public void deleteAll() {
        Session session = openCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("DELETE from EdocStatDaily");
            Query query = session.createQuery(sql.toString());
            query.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public EdocStatDaily findById(String organDomain) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT ed from EdocStatDaily ed where ed.organDomain = :organDomain");
            Query<EdocStatDaily> query = session.createQuery(sql.toString(), EdocStatDaily.class);
            query.setParameter("organDomain", organDomain);
            List<EdocStatDaily> statdaily = query.list();
            if (statdaily != null && statdaily.size() > 0) {
                return statdaily.get(0);
            }
        } catch (Exception e) {
            LOGGER.error("Error find statdaily with organDomain  " + organDomain + " in database !!!!!!!!!!!" + " cause " + Arrays.toString(e.getStackTrace()));
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return null;
    }

    public static void main(String[] args) {
        EdocStatDailyDaoImpl edocStatDailyDao = new EdocStatDailyDaoImpl();
    }

    private static final Logger LOGGER = Logger.getLogger(EdocDocumentDaoImpl.class);

}
