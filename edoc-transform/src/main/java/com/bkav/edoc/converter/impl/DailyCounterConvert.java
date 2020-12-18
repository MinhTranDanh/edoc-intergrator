package com.bkav.edoc.converter.impl;

import com.bkav.edoc.converter.util.DBConnectionUtil;
import com.bkav.edoc.converter.util.DatabaseUtil;
import com.bkav.edoc.converter.util.StringQuery;
import com.bkav.edoc.service.database.entity.EdocDailyCounter;
import com.bkav.edoc.service.database.entity.EdocDocument;
import com.bkav.edoc.service.database.util.EdocDailyCounterServiceUtil;
import com.bkav.edoc.service.util.PropsUtil;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DailyCounterConvert {
    private static final Logger LOGGER = Logger.getLogger(DailyCounterConvert.class);
    private Date _counterDate;

    public void runCounterStatDocument() throws SQLException {
        try (Connection connection = DBConnectionUtil.initConvertDBConnection()) {
            Statement stm;
            stm = connection.createStatement();
            ResultSet rs = stm.executeQuery(StringQuery.GET_DATE_COUNTER);

            while (rs.next()) {
                Map<String, EdocDailyCounter> dailyCounterMap = new HashMap<>();
                _counterDate = rs.getDate(1);
                LOGGER.info("Starting counter document in data: " + _counterDate);
                List<EdocDocument> documents = DatabaseUtil.getDocumentByCounterDate(connection, _counterDate);
                for (EdocDocument document : documents) {
                    String fromOrgan = document.getFromOrganDomain();
                    if (checkCurrentOrgan(fromOrgan)) {
                        countSent(fromOrgan, dailyCounterMap);
                    }

                    String toOrgans = document.getToOrganDomain();
                    String[] toOrgansList = toOrgans.split("#");
                    for (String toOrgan : toOrgansList) {
                        if (checkCurrentOrgan(toOrgan)) {
                            countReceived(toOrgan, dailyCounterMap);
                        }
                    }
                }
                submitDatabase(dailyCounterMap);
                LOGGER.info("Counter document in date " + _counterDate + " successfully!!");
            }
        } catch (SQLException throwable) {
            LOGGER.error(throwable);
        }
    }

    public boolean checkCurrentOrgan(String organDomain) {
        boolean result = false;
        try {
            String organIdExcept = PropsUtil.get("edoc.except.organId");
            List<String> stringList = Arrays.asList(organIdExcept.split("#"));
            String[] arr = organDomain.split("\\.");
            if (arr.length > 0) {
                String organId = arr[arr.length - 1];
                if (stringList.contains(organId)) {
                    result = true;
                }
            }
        } catch (Exception e) {
            LOGGER.error("Error when check send document to VPCP " + e);
        }
        return result;
    }

    private void submitDatabase(Map<String, EdocDailyCounter> dailyCounterMap) {
        for (Map.Entry<String, EdocDailyCounter> entry : dailyCounterMap.entrySet()) {
            EdocDailyCounter dailyCounter = entry.getValue();
            EdocDailyCounterServiceUtil.createDailyCounter(dailyCounter);
        }
    }

    private void countSent(String organDomain, Map<String, EdocDailyCounter> dailyCounterMap) {
        EdocDailyCounter dailyCounter;
        if (dailyCounterMap.containsKey(organDomain)) {
            dailyCounter = dailyCounterMap.get(organDomain);
            dailyCounterMap.remove(organDomain);
            int sent = dailyCounter.getSent() + 1;
            dailyCounter.setSent(sent);
        } else {
            dailyCounter = new EdocDailyCounter();
            dailyCounter.setSent(1);
            dailyCounter.setDateTime(_counterDate);
            dailyCounter.setReceived(0);
            dailyCounter.setOrganDomain(organDomain);
        }
        dailyCounterMap.put(organDomain, dailyCounter);
    }

    private void countReceived(String organDomain, Map<String, EdocDailyCounter> dailyCounterMap) {
        EdocDailyCounter dailyCounter;
        if (dailyCounterMap.containsKey(organDomain)) {
            dailyCounter = dailyCounterMap.get(organDomain);
            dailyCounterMap.remove(organDomain);
            int received = dailyCounter.getReceived() + 1;
            dailyCounter.setReceived(received);
        } else {
            dailyCounter = new EdocDailyCounter();
            dailyCounter.setSent(0);
            dailyCounter.setDateTime(_counterDate);
            dailyCounter.setReceived(1);
            dailyCounter.setOrganDomain(organDomain);
        }
        dailyCounterMap.put(organDomain, dailyCounter);
    }

    public static void main(String[] args) throws SQLException {
        System.out.println("Processing...");
        DailyCounterConvert dailyCounterConverter = new DailyCounterConvert();
        dailyCounterConverter.runCounterStatDocument();
        System.out.println("Done!!!!");
    }
}