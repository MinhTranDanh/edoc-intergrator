package com.bkav.edoc.web.scheduler.bean;

import com.bkav.edoc.service.vpcp.ServiceVPCP;
import com.bkav.edoc.service.xml.base.util.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component("confirmStatusBean")
public class ConfirmStatusBean {
    public void runSchedulerUpdateSuccessTrace() {
        LOGGER.info("Prepare confirm documents to vpcp at " + DateUtils.format(new Date()));
        ServiceVPCP.getInstance().UpdateSuccessTrace();
        LOGGER.info("Prepare confirm documents to vpcp at " + DateUtils.format(new Date()) + " done !!!!!!!!!");
    }

    private static final Logger LOGGER = Logger.getLogger(ConfirmStatusBean.class);
}

