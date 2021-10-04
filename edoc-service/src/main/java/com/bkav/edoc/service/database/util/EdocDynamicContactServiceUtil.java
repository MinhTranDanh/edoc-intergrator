package com.bkav.edoc.service.database.util;

import com.bkav.edoc.service.database.cache.OrganizationCacheEntry;
import com.bkav.edoc.service.database.entity.EdocDynamicContact;
import com.bkav.edoc.service.database.entity.EdocNotification;
import com.bkav.edoc.service.database.entity.pagination.PaginationCriteria;
import com.bkav.edoc.service.database.services.EdocDynamicContactService;

import java.util.List;
import java.util.Map;

public class EdocDynamicContactServiceUtil {

    private final static EdocDynamicContactService DYNAMIC_CONTACT_SERVICE = new EdocDynamicContactService();

    public static List<OrganizationCacheEntry> getAllContacts() {
        return DYNAMIC_CONTACT_SERVICE.getAllContacts();
    }

    public static String getNameByOrganId(String organId) {
        return DYNAMIC_CONTACT_SERVICE.getNameByOrganId(organId);
    }

    public static Map<String, Object> getContacts(PaginationCriteria paginationCriteria) {
        return DYNAMIC_CONTACT_SERVICE.getContacts(paginationCriteria);
    }

    public static void createContact(EdocDynamicContact edocDynamicContact) {
        DYNAMIC_CONTACT_SERVICE.createContact(edocDynamicContact);
    }

    //MinhTDb
    public static EdocDynamicContact findByName(String name) {
        return DYNAMIC_CONTACT_SERVICE.findContactName(name);
    }

    public static List<OrganizationCacheEntry> searchByName(String name) {
        return DYNAMIC_CONTACT_SERVICE.searchContactName(name);
    }

    public static OrganizationCacheEntry findByDomain(String organDomain) {
        return DYNAMIC_CONTACT_SERVICE.findByDomain(organDomain);
    }

    public static EdocDynamicContact findContactByDomain(String organDomain) {
        return DYNAMIC_CONTACT_SERVICE.findContactByDomain(organDomain);
    }

    public static List<EdocDynamicContact> getAllDynamicContacts() {
        return DYNAMIC_CONTACT_SERVICE.getAllDynamicContact();
    }

    public static List<EdocDynamicContact> getAllChildOrgan(String parentDomain) {
        return DYNAMIC_CONTACT_SERVICE.getAllChildOrgan(parentDomain);
    }

    public static OrganizationCacheEntry findById(long organId) {
        return DYNAMIC_CONTACT_SERVICE.findById(organId);
    }

    public static List<OrganizationCacheEntry> getDyCacheEntriesByAgency(boolean agency) {
        return DYNAMIC_CONTACT_SERVICE.getDynamicContactsByAgency(agency);
    }

    public static List<EdocDynamicContact> getDynamicContactByAgency(boolean agency) {
        return DYNAMIC_CONTACT_SERVICE.getDynamicContactByAgency(agency);
    }

    public static EdocDynamicContact findDynamicContactById(long contactId) {
        return DYNAMIC_CONTACT_SERVICE.findEdocDynamicContactById(contactId);
    }

    public static void updateContact(OrganizationCacheEntry organizationCacheEntry, EdocDynamicContact contact) {
        DYNAMIC_CONTACT_SERVICE.updateContact(organizationCacheEntry, contact);
    }

    public static void updateContact(EdocDynamicContact contact) {
        DYNAMIC_CONTACT_SERVICE.updateContact(contact);
    }

    public static boolean deleteContact(long organId) {
        return DYNAMIC_CONTACT_SERVICE.deleteOrgan(organId);
    }

    public static List<EdocDynamicContact> getContactsByMultipleDomains(List<String> domains) {
        return DYNAMIC_CONTACT_SERVICE.getContactsByMultipleDomains(domains);
    }

    public static List<OrganizationCacheEntry> filterReportSearch(String search_content, List<OrganizationCacheEntry> organ) {
        return DYNAMIC_CONTACT_SERVICE.filterForReportSearch(search_content, organ);
    }

    ;
}
