package com.bkav.edoc.web.scheduler.bean;

import com.bkav.edoc.service.database.entity.*;
import com.bkav.edoc.service.database.util.EdocDailyCounterServiceUtil;
import com.bkav.edoc.service.database.util.EdocDocumentServiceUtil;
import com.bkav.edoc.service.database.util.EdocDynamicContactServiceUtil;
import com.bkav.edoc.service.database.util.EdocStatDailyServiceUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

@Component("statSumDocumentBean")
public class StatSumDocumentBean {

    public void runSchedulerStatSumDocument() {
        boolean isGetAllAgency = false;
        try {


            new EdocStatDailyServiceUtil().deleteAll();

            //yesterday.add(Calendar.HOUR, 7);
            LOGGER.info("Counter date prepare stat " + _counterDate);
            List<EPublicStat> list = EdocDailyCounterServiceUtil.getStatsDetail(null, null, null, isGetAllAgency);
            for (EPublicStat ep : list) {
                EdocStatDaily sd = new EdocStatDaily();
                sd.setOrganDomain(ep.getOrganDomain());
                sd.setName(ep.getOrganName());
                sd.setTotalSent((int) ep.getSent());
                sd.setTotalReceived((int) ep.getReceived());
                EdocStatDailyServiceUtil.createStatDaily(sd);
                List<EPublicStat> listchildren = ep.getChildOrgan();
                if (listchildren == null) {
                    continue;
                }

                for (EPublicStat es : listchildren) {
                    EdocStatDaily sdchildren = new EdocStatDaily();
                    sdchildren.setOrganDomain(es.getOrganDomain());
                    sdchildren.setName(es.getOrganName());
                    sdchildren.setTotalSent((int) es.getSent());
                    sdchildren.setTotalReceived((int) es.getReceived());
                    EdocStatDailyServiceUtil.createStatDaily(sdchildren);
                }

            }


        } catch (Exception e) {
            LOGGER.error("Error when run Scheduler Stat Document " + e);
        }
    }


    private Date _counterDate;
    private final static Logger LOGGER = Logger.getLogger(StatDocumentBean.class);
}
