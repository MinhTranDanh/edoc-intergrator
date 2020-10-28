package com.bkav.edoc.service.database.services;

import com.bkav.edoc.service.database.daoimpl.EdocPriorityDaoImpl;
import com.bkav.edoc.service.database.entity.EdocPriority;
import com.bkav.edoc.service.memcached.MemcachedKey;
import com.bkav.edoc.service.memcached.MemcachedUtil;

import java.util.List;

public class EdocPriorityService {
    private final static EdocPriorityDaoImpl EDOC_PRIORITY_DAO = new EdocPriorityDaoImpl();

    public EdocPriority findById(int priorityId) {
        String cacheKey = MemcachedKey.getKey(String.valueOf(priorityId), MemcachedKey.PRIORITY_KEY);
        EdocPriority priority = (EdocPriority) MemcachedUtil.getInstance().read(cacheKey);
        if (priority == null) {
            EDOC_PRIORITY_DAO.openCurrentSession();
            EdocPriority edocPriority = EDOC_PRIORITY_DAO.findById(priorityId);
            EDOC_PRIORITY_DAO.closeCurrentSession();
            if (edocPriority != null) {
                priority = edocPriority;
                MemcachedUtil.getInstance().create(cacheKey, MemcachedKey.SEND_DOCUMENT_TIME_LIFE, priority);
            } else {
                priority = new EdocPriority();
            }
        }
        return priority;
    }

    public List<EdocPriority> getAllPriorities() {
        EDOC_PRIORITY_DAO.openCurrentSession();
        List<EdocPriority> edocPriorities = EDOC_PRIORITY_DAO.findAll();
        EDOC_PRIORITY_DAO.closeCurrentSession();
        return edocPriorities;
    }
}
