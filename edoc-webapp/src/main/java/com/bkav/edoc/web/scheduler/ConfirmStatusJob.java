package com.bkav.edoc.web.scheduler;

import com.bkav.edoc.service.kernel.util.GetterUtil;
import com.bkav.edoc.service.xml.base.util.DateUtils;
import com.bkav.edoc.web.scheduler.bean.ConfirmStatusBean;
import com.bkav.edoc.web.util.PropsUtil;
import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.util.Date;

public class ConfirmStatusJob extends QuartzJobBean {

    private ConfirmStatusBean confirmStatusBean;

    public void setConfirmStatusBean(ConfirmStatusBean confirmStatusBean) {
        this.confirmStatusBean = confirmStatusBean;
    }

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        LOGGER.info("Start confirm status document to vpcp at " + DateUtils.format(new Date(), DateUtils.DEFAULT_DATETIME_FORMAT));
        boolean isRunSchedule = GetterUtil.getBoolean(PropsUtil.get("edoc.app.schedule.run.ConfirmStatusJob"), false);
        if (isRunSchedule) {
            confirmStatusBean.runSchedulerUpdateSuccessTrace();
        }
    }

    private static final Logger LOGGER = Logger.getLogger(ConfirmStatusJob.class);
}
