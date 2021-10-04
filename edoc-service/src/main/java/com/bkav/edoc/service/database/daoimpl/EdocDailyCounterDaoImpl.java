package com.bkav.edoc.service.database.daoimpl;

import com.bkav.edoc.service.database.dao.EdocDailyCounterDao;
import com.bkav.edoc.service.database.entity.EPublicStat;
import com.bkav.edoc.service.database.entity.EdocDailyCounter;
import com.bkav.edoc.service.database.services.EdocDailyCounterService;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class EdocDailyCounterDaoImpl extends RootDaoImpl<EdocDailyCounter, Long> implements EdocDailyCounterDao {

    public EdocDailyCounterDaoImpl() {
        super(EdocDailyCounter.class);
    }


    @Override
    public boolean checkExistCounter(Date date) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT dc from EdocDailyCounter dc where dc.dateTime=:dateTime");
            Query<EdocDailyCounter> query = session.createQuery(sql.toString(), EdocDailyCounter.class);
            query.setParameter("dateTime", date);
            List<EdocDailyCounter> edocDailyCounters = query.getResultList();
            return edocDailyCounters.size() > 0;
        } catch (Exception e) {
            LOGGER.error(e);
            return false;
        } finally {
            closeCurrentSession(session);
        }
    }

    @Override
    public List<EdocDailyCounter> getOverStat(String organDomain) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT dc from EdocDailyCounter dc where dc.organDomain = :organDomain");
            Query<EdocDailyCounter> query = session.createQuery(sql.toString(), EdocDailyCounter.class);
            query.setParameter("organDomain", organDomain);
            return query.getResultList();
        } catch (Exception e) {
            LOGGER.error(e);
            return new ArrayList<>();
        } finally {
            closeCurrentSession(session);
        }
    }

    @Override
    public List<EdocDailyCounter> getOverStat(String organDomain, Date fromDate, Date toDate) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT dc from EdocDailyCounter dc where dc.organDomain = :organDomain " +
                    "and DATE(dateTime) >= DATE(:fromDate) and DATE(dateTime) <= DATE(:toDate)");
            Query<EdocDailyCounter> query = session.createQuery(sql.toString(), EdocDailyCounter.class);
            query.setParameter("organDomain", organDomain);
            query.setParameter("fromDate", fromDate);
            query.setParameter("toDate", toDate);
            return query.getResultList();
        } catch (Exception e) {
            LOGGER.error(e);
            return new ArrayList<>();
        } finally {
            closeCurrentSession(session);
        }
    }


    @Override
    public Long getStat(int year) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT sum(dc.sent + dc.received) from EdocDailyCounter dc where year(dateTime) = :year");
            Query<Long> query = session.createQuery(sql.toString(), Long.class);
            query.setParameter("year", year);
            return query.uniqueResult();
        } catch (Exception e) {
            LOGGER.error(e);
            return 0L;
        } finally {
            closeCurrentSession(session);
        }
    }

    public List<Long> getSentByMonth(int year, String organDomain) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            if (!organDomain.equals("")) {
                sql.append("select sum(sent) from EdocDailyCounter where year(dateTime) = :year and organDomain = :organDomain group by month(dateTime)");
                Query<Long> query = session.createQuery(sql.toString(), Long.class);
                query.setParameter("year", year);
                query.setParameter("organDomain", organDomain);
                return query.getResultList();
            }
            else {
                sql.append("select sum(sent) from EdocDailyCounter where year(dateTime) = :year group by month(dateTime)");
                Query<Long> query = session.createQuery(sql.toString(), Long.class);
                query.setParameter("year", year);
                return query.getResultList();
            }
        } catch (Exception e) {
            LOGGER.error(e);
            return new ArrayList<>();
        } finally {
            closeCurrentSession(session);
        }
    }

    public List<Long> getReceivedByMonth(int year, String organDomain) {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            if (!organDomain.equals("")) {
                sql.append("select sum(received) from EdocDailyCounter where year(dateTime) = :year and organDomain = :organDomain group by month(dateTime)");
                Query<Long> query = session.createQuery(sql.toString(), Long.class);
                query.setParameter("year", year);
                query.setParameter("organDomain", organDomain);
                return query.getResultList();
            } else {
                sql.append("select sum(received) from EdocDailyCounter where year(dateTime) = :year group by month(dateTime)");
                Query<Long> query = session.createQuery(sql.toString(), Long.class);
                query.setParameter("year", year);
                return query.getResultList();
            }
        } catch (Exception e) {
            LOGGER.error(e);
            return new ArrayList<>();
        } finally {
            closeCurrentSession(session);
        }
    }

    public static void main(String[] args) {
        EdocDailyCounterDaoImpl edocDailyCounterDao = new EdocDailyCounterDaoImpl();
        System.out.println(edocDailyCounterDao.getReceivedByMonth(2020, "000.00.39.H36"));
        //System.out.println(edocDailyCounterDao.getExistYearInDailycounter());
    }

    public List<Integer> getExistYearInDailycounter() {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("Select distinct year(dc.dateTime) from EdocDailyCounter dc");
            Query<Integer> query = session.createQuery(sql.toString(), Integer.class);
            return query.getResultList();
        } catch (Exception e) {
            LOGGER.error(e);
            return null;
        } finally {
            closeCurrentSession(session);
        }
    }

    public void createDailyCounter(EdocDailyCounter dailyCounter) {
        this.persist(dailyCounter);
    }

    private final static Logger LOGGER = Logger.getLogger(EdocDailyCounterDaoImpl.class);
}
