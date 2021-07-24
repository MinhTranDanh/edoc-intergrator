package com.bkav.edoc.service.database.entity;

import java.io.Serializable;
import java.util.Date;

public class EdocStatDaily implements Serializable {
    private Long statDailyId;
    private String organDomain;
    private String name;
    private int totalSent;
    private int totalReceived;

    public EdocStatDaily() {
    }

    public Long getStatDailyId() {
        return statDailyId;
    }

    public void setStatDailyId(Long statDailyId) {
        this.statDailyId = statDailyId;
    }

    public String getOrganDomain() {
        return organDomain;
    }

    public void setOrganDomain(String organDomain) {
        this.organDomain = organDomain;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalSent() {
        return totalSent;
    }

    public void setTotalSent(int totalSent) {
        this.totalSent = totalSent;
    }

    public int getTotalReceived() {
        return totalReceived;
    }

    public void setTotalReceived(int totalReceived) {
        this.totalReceived = totalReceived;
    }
}
