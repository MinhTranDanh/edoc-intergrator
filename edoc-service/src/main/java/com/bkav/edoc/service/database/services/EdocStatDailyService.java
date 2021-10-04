package com.bkav.edoc.service.database.services;

import com.bkav.edoc.service.database.daoimpl.EdocStatDailyDaoImpl;
import com.bkav.edoc.service.database.entity.EdocStatDaily;

public class EdocStatDailyService {
    private final EdocStatDailyDaoImpl edocStatDailyDao = new EdocStatDailyDaoImpl();

    public void createStatDaily(EdocStatDaily statDaily) {
        edocStatDailyDao.createStatDaily(statDaily);
    }

    public void deleteAll() {
        edocStatDailyDao.deleteAll();
    }

    public EdocStatDaily findById(String organDomain) {
        EdocStatDaily edocStatDaily = edocStatDailyDao.findById(organDomain);
        return edocStatDaily;
    }
}
