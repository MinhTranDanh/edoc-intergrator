package com.bkav.edoc.service.database.services;

import com.bkav.edoc.service.database.cache.DocumentCacheEntry;
import com.bkav.edoc.service.database.cache.TraceCacheEntry;
import com.bkav.edoc.service.database.daoimpl.EdocDocumentDaoImpl;
import com.bkav.edoc.service.database.daoimpl.EdocTraceDaoImpl;
import com.bkav.edoc.service.database.entity.EdocDocument;
import com.bkav.edoc.service.database.entity.EdocTrace;
import com.bkav.edoc.service.database.util.MapperUtil;
import com.bkav.edoc.service.memcached.MemcachedKey;
import com.bkav.edoc.service.memcached.MemcachedUtil;
import com.bkav.edoc.service.redis.RedisKey;
import com.bkav.edoc.service.redis.RedisUtil;
import com.bkav.edoc.service.xml.status.header.MessageStatus;
import org.apache.log4j.Logger;
import org.hibernate.Session;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class EdocTraceService {

    private final EdocTraceDaoImpl traceDaoImpl = new EdocTraceDaoImpl();
    private final EdocDocumentDaoImpl documentDaoImpl = new EdocDocumentDaoImpl();

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat(
            "dd/MM/yyyy");

    public boolean updateTrace(MessageStatus status) {
        // get info from status
        String fromOrganDomain = status.getFrom().getOrganId();
        String fromOrganName = status.getFrom().getOrganName();
        String fromOrganAdd = status.getFrom().getOrganAdd();
        String telephone = status.getFrom().getTelephone();
        String fax = status.getFrom().getFax();
        String website = status.getFrom().getWebsite();
        String organInCharge = status.getFrom().getOrganizationInCharge();
        String toOrganDomain = status.getResponseFor().getOrganId();
        String code = status.getResponseFor().getCode();
        String documentId = status.getResponseFor().getDocumentId();
        Date promulgationDate = status.getResponseFor().getPromulgationDate();

        // get other info
        String statusCodeStr = status.getStatusCode();
        Integer statusCode = null;
        try {
            if (statusCodeStr != null && !statusCodeStr.isEmpty()) {
                statusCode = Integer.parseInt(statusCodeStr);
            }
        } catch (NumberFormatException e) {
            LOGGER.error(e);
        }
        String description = status.getDescription();
        Date timestamp = status.getTimestamp();
        // get info staff info
        String department = status.getStaffInfo().getDepartment();
        String email = status.getStaffInfo().getEmail();
        String mobile = status.getStaffInfo().getMobile();
        String staff = status.getStaffInfo().getStaff();

        Session currentSession = traceDaoImpl.openCurrentSession();
        // search document by from organ domain and code
        documentDaoImpl.setCurrentSession(currentSession);
        EdocDocument edocDocument = documentDaoImpl.searchDocumentByOrganDomainAndCode(toOrganDomain, code);
        if (edocDocument == null) {
            return false;
        }

        // set info to edoc trace
        EdocTrace edocTrace = new EdocTrace();
        edocTrace.setFromOrganDomain(fromOrganDomain);
        edocTrace.setOrganName(fromOrganName);
        edocTrace.setOrganAdd(fromOrganAdd);
        edocTrace.setToOrganDomain(toOrganDomain);
        edocTrace.setCode(code);
        edocTrace.setPromulgationDate(promulgationDate);
        edocTrace.setEdxmlDocumentId(documentId);
        edocTrace.setStatusCode(statusCode);
        edocTrace.setComment(description);
        edocTrace.setTimeStamp(timestamp);
        edocTrace.setDepartment(department);
        edocTrace.setEmail(email);
        edocTrace.setStaffMobile(mobile);
        edocTrace.setStaffName(staff);
        edocTrace.setServerTimeStamp(new Date());
        edocTrace.setFax(fax);
        edocTrace.setTelephone(telephone);
        edocTrace.setWebsite(website);
        edocTrace.setOrganizationInCharge(organInCharge);
        edocTrace.setDocument(edocDocument);
        edocTrace.setEdxmlDocumentId(documentId);
        edocTrace.setEnable(true);
        // insert trace to db
        try {
            currentSession.beginTransaction();
            traceDaoImpl.persist(edocTrace);
            String cacheKey = MemcachedKey.getKey(String.valueOf(documentId), MemcachedKey.DOCUMENT_KEY);
            DocumentCacheEntry documentCacheUpdate = (DocumentCacheEntry) MemcachedUtil.getInstance().read(cacheKey);
            if (documentCacheUpdate != null) {
                List<TraceCacheEntry> traceCacheEntries = documentCacheUpdate.getTraces();
                TraceCacheEntry traceCacheEntry = MapperUtil.modelToTraceCache(edocTrace);
                traceCacheEntries.add(traceCacheEntry);
                traceCacheEntries.sort(Comparator.comparing(TraceCacheEntry::getTimeStamp));
                documentCacheUpdate.setTraces(traceCacheEntries);
                MemcachedUtil.getInstance().update(cacheKey, MemcachedKey.SEND_DOCUMENT_TIME_LIFE, documentCacheUpdate);
            }
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            LOGGER.error(e);
            if (currentSession != null) {
                currentSession.getTransaction().rollback();
            }
            return false;
        } finally {
            traceDaoImpl.closeCurrentSession();
        }

        return true;
    }

    private void saveEdocTraceCache(EdocTrace trace, String responseForOrganId) {
        // TODO: Cache
        List obj = RedisUtil.getInstance().get(RedisKey.getKey(responseForOrganId, RedisKey.GET_TRACE_KEY), List.class);
        // if data in cache not exist, create new
        if (obj == null) {
            List<EdocTrace> edocTraces = new ArrayList<EdocTrace>();
            edocTraces.add(trace);
            RedisUtil.getInstance().set(RedisKey.getKey(responseForOrganId, RedisKey.GET_TRACE_KEY), edocTraces);
        } else {
            // add edoc trace to old list in cache
            List<EdocTrace> oldEdocTraces = (List<EdocTrace>) obj;

            oldEdocTraces.add(trace);
            RedisUtil.getInstance().set(RedisKey.getKey(responseForOrganId, RedisKey.GET_TRACE_KEY), oldEdocTraces);
        }
    }

    public List<EdocTrace> getEdocTracesByOrganId(String responseForOrganId) {
        traceDaoImpl.openCurrentSession();

        List<EdocTrace> traces = traceDaoImpl.getEdocTracesByOrganId(responseForOrganId);

        traceDaoImpl.closeCurrentSession();
        return traces;
    }

    /**
     * disable traces after get traces
     *
     * @param traces
     */
    public void disableEdocTrace(List<EdocTrace> traces) {
        Session currentSession = traceDaoImpl.openCurrentSession();
        try {
            currentSession.beginTransaction();

            for (EdocTrace trace : traces) {
                trace.setEnable(false);
                traceDaoImpl.disableEdocTrace(trace);
            }

            currentSession.getTransaction().commit();
        } catch (Exception e) {
            LOGGER.error(e);
            if (currentSession != null) {
                currentSession.getTransaction().rollback();
            }
        } finally {
            traceDaoImpl.closeCurrentSession();
        }
    }

    private static final Logger LOGGER = Logger.getLogger(EdocTraceService.class);
}
