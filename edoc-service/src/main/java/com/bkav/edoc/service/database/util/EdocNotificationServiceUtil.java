package com.bkav.edoc.service.database.util;

import com.bkav.edoc.service.database.entity.EdocDocument;
import com.bkav.edoc.service.database.entity.EdocNotification;
import com.bkav.edoc.service.database.services.EdocNotificationService;
import com.bkav.edoc.service.xml.base.header.Organization;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class EdocNotificationServiceUtil {

    private final static EdocNotificationService NOTIFICATION_SERVICE = new EdocNotificationService();

    public static void addNotification(EdocNotification edocNotification) {
        NOTIFICATION_SERVICE.addNotification(edocNotification);
    }

    public static Set<EdocNotification> addNotifications(List<Organization> toOrgans, Date dueDate, EdocDocument edocDocument) {
        return NOTIFICATION_SERVICE.addNotifications(toOrgans, dueDate, edocDocument);
    }
}