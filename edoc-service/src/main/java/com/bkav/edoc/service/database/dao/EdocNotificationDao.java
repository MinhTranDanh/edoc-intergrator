package com.bkav.edoc.service.database.dao;

import com.bkav.edoc.service.database.entity.EdocDocument;
import com.bkav.edoc.service.database.entity.EdocNotification;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface EdocNotificationDao {

    List<Long> getDocumentIdsByOrganId(String organId);

    List<EdocDocument> getDocumentByOrganId(String organId);

    List<EdocNotification> getNotificationsByOrganId(String organId);

    boolean checkAllowWithDocument(long documentId, String organId);

    void setNotificationTaken(long documentId, String organId) throws SQLException;

    List<String> getReceiverIdNotTaken(Date fromDate, Date toDate);

    List<EdocNotification> getEdocNotificationsNotTaken(Date date);

    List<EdocDocument> getDocumentNotTakenByReceiverId(String receiverId);

    public EdocNotification getEdocNotifyByDocumentIdandReceiveId(long documentId, String ReceiveId);

    void setNotificationtaken(EdocNotification en) ;

    public List<EdocNotification> getEdocNotifyByDocumentId(long documentId);

}
