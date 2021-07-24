package com.bkav.edoc.service.database.util;

import com.bkav.edoc.service.database.entity.EdocDailyCounter;
import com.bkav.edoc.service.database.entity.EdocStatDaily;
import com.bkav.edoc.service.database.services.EdocDailyCounterService;
import com.bkav.edoc.service.database.services.EdocStatDailyService;

public class EdocStatDailyServiceUtil {
    private final static EdocStatDailyService EDOC_STAT_DAILY_SERVICE = new EdocStatDailyService();

    public static void createStatDaily(EdocStatDaily statDaily) {
        EDOC_STAT_DAILY_SERVICE.createStatDaily(statDaily);
    }

    public static void deleteAll(){
        EDOC_STAT_DAILY_SERVICE.deleteAll();
    }

    public static EdocStatDaily findById(String organDomain){
        return EDOC_STAT_DAILY_SERVICE.findById(organDomain);
    }
}
