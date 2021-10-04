package com.bkav.edoc.service.database.util;

import com.bkav.edoc.service.database.entity.*;
import com.bkav.edoc.service.database.entity.pagination.PaginationCriteria;
import com.bkav.edoc.service.database.services.EdocNotificationService;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class EdocNotificationServiceUtil {

    private final static EdocNotificationService NOTIFICATION_SERVICE = new EdocNotificationService();

    public static void addNotification(EdocNotification edocNotification) {
        NOTIFICATION_SERVICE.addNotification(edocNotification);
    }

    public static List<EmailRequest> emailScheduleSend(Date fromDate, Date toDate) {
        return NOTIFICATION_SERVICE.getEmailRequestScheduleSend(fromDate, toDate);
    }

    //MinhTDb
    public static EdocNotification getNotifyBydocumentIdandReceiveId(long documentId, String ReceiveId) {
        return NOTIFICATION_SERVICE.getNotifiByIdandReceiveId(documentId, ReceiveId);

    }
    public static List<TelegramMessage> telegramScheduleSend() {
        return NOTIFICATION_SERVICE.getTelegramMessages();
    }

    public static List<TelegramMessage> telegramScheduleDocumentNotSendVPCP() {
        return NOTIFICATION_SERVICE.getTelegramMessagesForDocumentNotSendVPCP();
    }

    public static boolean checkExistNotification(String organ, long docId) {
        return NOTIFICATION_SERVICE.checkExistNotification(organ, docId);
    }

    public static List<Long> getDocumentIdsByOrganId(String organId) {
        return NOTIFICATION_SERVICE.getDocumentIdsByOrganId(organId);
    }

    public static List<EdocNotification> getNotificationsByOrganId(String organId) {
        return NOTIFICATION_SERVICE.getNotificationsByOrganId(organId);
    }

    public static List<EdocDocument> getDocumentByOrganId(String organId) {
        return NOTIFICATION_SERVICE.getDocumentByOrganId(organId);
    }

    public static void removePendingDocId(String organId, long docId) {
        NOTIFICATION_SERVICE.removePendingDocId(organId, docId);
    }

    /*public static Map<String, Object> getAllDocumentNotTaken(PaginationCriteria paginationCriteria, Date fromDate, Date toDate) {
        return NOTIFICATION_SERVICE.getAllDocumentNotTaken(paginationCriteria, fromDate, toDate);
    }*/

    public static Map<String, Object> getAllDocumentNotTaken(PaginationCriteria paginationCriteria) {
        return NOTIFICATION_SERVICE.getAllDocumentNotTaken(paginationCriteria);
    }
    //MinhTDb
    public static void comfirmReceive(EdocNotification en) throws SQLException {
        NOTIFICATION_SERVICE.comfirmReceive(en);

    }
    public static List<EdocNotification> getNotifyBydocumentId(long documentId) {
        return NOTIFICATION_SERVICE.getNotifiById(documentId);

    }
    //MinhTDb
    public static void resend(EdocNotification en) throws SQLException {
        NOTIFICATION_SERVICE.resendDocument(en);

    }
}
