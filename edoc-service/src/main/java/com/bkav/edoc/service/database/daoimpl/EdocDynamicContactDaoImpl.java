package com.bkav.edoc.service.database.daoimpl;

import com.bkav.edoc.service.database.dao.EdocDynamicContactDao;
import com.bkav.edoc.service.database.entity.EdocDynamicContact;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class EdocDynamicContactDaoImpl extends RootDaoImpl<EdocDynamicContact, Long> implements EdocDynamicContactDao {

    public EdocDynamicContactDaoImpl() {
        super(EdocDynamicContact.class);
    }

    public EdocDynamicContact findByDomain(String domain) {
        Session currentSession = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc FROM EdocDynamicContact edc where edc.domain=:domain");
            Query<EdocDynamicContact> query = currentSession.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("domain", domain);
            List<EdocDynamicContact> result = query.list();
            if (result != null && result.size() > 0) {
                return result.get(0);
            }
            LOGGER.warn("Not found dynamic contact for organ domain " + domain);
            return null;
        } catch (Exception e) {
            LOGGER.error("Error get dynamic contact from organ domain " + domain + " cause " + e.getMessage());
            return null;
        } finally {
            currentSession.close();
        }
    }

    //MinhTDb
    public EdocDynamicContact findByName(String name) {
        Session currentSession = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc FROM EdocDynamicContact edc where edc.name=:name");
            Query<EdocDynamicContact> query = currentSession.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("name", name);
            List<EdocDynamicContact> edc = query.list();
            if (edc != null && edc.size() > 0) {
                return edc.get(0);
            }
            LOGGER.warn("Not found dynamic contact for organ domain " + name);
            return null;
        } catch (Exception e) {
            LOGGER.error("Error get dynamic contact from organ domain " + name + " cause " + e.getMessage());
            return null;
        } finally {
            currentSession.close();
        }
    }
    @Override
    public List<EdocDynamicContact> getDynamicContactsByAgency(boolean agency) {
        Session currentSession = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc FROM EdocDynamicContact edc WHERE edc.agency = :agency");
            Query<EdocDynamicContact> query = currentSession.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("agency", agency);
            return query.list();
        } catch (Exception e) {
            LOGGER.error(e);
            return new ArrayList<>();
        } finally {
            closeCurrentSession(currentSession);
        }
    }

    @Override
    public List<String> getAllDomain() {
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc.domain from EdocDynamicContact edc");
            Query<String> query = session.createQuery(sql.toString(), String.class);
            return query.getResultList();
        } catch (Exception e) {
            LOGGER.error(e);
            return null;
        } finally {
            closeCurrentSession(session);
        }
    }

    private String getFilterDomain(String domain) {
        String[] arr = domain.split("#");
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            String value = "domain" + i;
            builder.append("edc.domain like :").append(value);
            if (i != arr.length - 1) {
                builder.append(" or ");
            }
        }
        return builder.toString();
    }

    @Override
    public Long countOrgan(boolean agency) {
        Session currentSession = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT count(*) FROM EdocDynamicContact edc where edc.agency = :agency");
            Query<Long> query = currentSession.createQuery(sql.toString(), Long.class);
            query.setParameter("agency", agency);
            return query.uniqueResult();
        } catch (Exception e) {
            LOGGER.error(e);
            return 0L;
        } finally {
            closeCurrentSession(currentSession);
        }

    }

    @Override
    public boolean checkPermission(String organId, String token) {
        boolean result = false;
        Session session = openCurrentSession();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc from EdocDynamicContact edc where edc.domain=:domain and token=:token and edc.status=true");
            Query<EdocDynamicContact> query = session.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("domain", organId);
            query.setParameter("token", token);
            List<EdocDynamicContact> dynamicContacts = query.list();
            if (dynamicContacts != null && dynamicContacts.size() > 0) {
                result = true;
            }
            LOGGER.info("Check permission success for organ " + organId);
        } catch (Exception e) {
            LOGGER.error("Error when check permission for organId " + organId + " cause " + e.getMessage());
        } finally {
            closeCurrentSession(session);
        }
        return result;
    }

    @Override
    public void updateContact(EdocDynamicContact edocDynamicContact) {
        saveOrUpdate(edocDynamicContact);
    }

    @Override
    public void createContact(EdocDynamicContact contact) {
        this.persist(contact);
    }

    @Override
    public EdocDynamicContact deleteOrgan(long organId) {
        Session session = openCurrentSession();
        EdocDynamicContact contact = null;
        try {
            session.beginTransaction();
            EdocDynamicContact organ = this.findById(organId);
            if (organ == null) {
                LOGGER.error("Error delete organ not found document with id " + organId);
            } else {
                session.delete(organ);
                session.getTransaction().commit();
                contact = organ;
            }
        } catch (Exception e) {
            LOGGER.error("Error delete organ with id " + organId + " cause " + e.getMessage());
            session.getTransaction().rollback();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return contact;
    }

    @Override
    public String getNameByOrganId(String organId) {
        Session currentSession = openCurrentSession();
        String result = "";
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT name FROM EdocDynamicContact edc where edc.domain=:organId");
            Query<String> query = currentSession.createQuery(sql.toString(), String.class);
            query.setParameter("organId", organId);
            if (query.uniqueResult() != null) {
                result = query.uniqueResult();
            } else {
                LOGGER.warn("Get name from edoc_dynamic contact null with " + organId);
            }
        } catch (Exception e) {
            LOGGER.error(e);
        } finally {
            closeCurrentSession(currentSession);
        }
        return result;
    }

    @Override
    public List<EdocDynamicContact> getContactByMultipleDomain(List<String> domains) {
        Session session = openCurrentSession();
        List<EdocDynamicContact> contacts;
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc FROM EdocDynamicContact edc where edc.domain in (:domains)");
            Query<EdocDynamicContact> query = session.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("domains", domains);
            contacts = query.getResultList();
            if (contacts != null) {
                return contacts;
            } else {
                contacts = new ArrayList<>();
            }
        } catch (Exception e) {
            LOGGER.error("Error get list contact by multiple domain cause " + e.getMessage());
            contacts = new ArrayList<>();
        } finally {
            closeCurrentSession(session);
        }
        return contacts;
    }


    public List<EdocDynamicContact> searchByName(String name) {
        Session session = openCurrentSession();
        List<EdocDynamicContact> contacts;
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT edc FROM EdocDynamicContact edc where edc.name like concat('%' ,:name, '%')");
            Query<EdocDynamicContact> query = session.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("name", name);
            contacts = query.getResultList();
            if (contacts != null) {
                return contacts;
            } else {
                contacts = new ArrayList<>();
            }
        } catch (Exception e) {
            LOGGER.error("Error get list contact by multiple domain cause " + e.getMessage());
            contacts = new ArrayList<>();
        } finally {
            closeCurrentSession(session);
        }
        return contacts;
    }

    public List<EdocDynamicContact> getAllChildrenContact (String regexParent) {
        Session session = openCurrentSession();
        List<EdocDynamicContact> childOrgans;
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("Select edc from EdocDynamicContact edc where (edc.domain like concat('%', :regexParent, '%') OR edc.name like concat('%', :regexParent, '%')) and edc.agency = :agency");
            Query<EdocDynamicContact> query = session.createQuery(sql.toString(), EdocDynamicContact.class);
            query.setParameter("regexParent", regexParent);
            query.setParameter("agency", true);
            childOrgans = query.getResultList();

            if (childOrgans != null)
                return childOrgans;
        } catch (Exception e) {
            LOGGER.error(e);
        } finally {
            closeCurrentSession(session);
        }
        return new ArrayList<>();
    }
    public List<EdocDynamicContact> getAllContact () {
        Session session = openCurrentSession();
        List<EdocDynamicContact> childOrgans;
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("Select edc from EdocDynamicContact edc where  edc.agency = :agency");
            Query<EdocDynamicContact> query = session.createQuery(sql.toString(), EdocDynamicContact.class);

            query.setParameter("agency", true);
            childOrgans = query.getResultList();
//            System.out.println(childOrgans.size());
            if (childOrgans != null)
                return childOrgans;
        } catch (Exception e) {
            LOGGER.error(e);
        } finally {
            closeCurrentSession(session);
        }
        return new ArrayList<>();
    }

    public static void main(String[] args) {
        EdocDynamicContactDaoImpl edocDynamicContactDao = new EdocDynamicContactDaoImpl();
        System.out.println(edocDynamicContactDao.getAllChildrenContact("000.00.").size());
    }

    private static final Logger LOGGER = Logger.getLogger(EdocDynamicContactDaoImpl.class);
}
