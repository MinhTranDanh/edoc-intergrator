package com.bkav.edoc.service.database.services;

import com.bkav.edoc.service.database.cache.OrganizationCacheEntry;
import com.bkav.edoc.service.database.daoimpl.EdocDailyCounterDaoImpl;
import com.bkav.edoc.service.database.entity.*;
import com.bkav.edoc.service.database.util.EdocDynamicContactServiceUtil;
import com.bkav.edoc.service.database.util.EdocStatDailyServiceUtil;
import com.bkav.edoc.service.util.PropsUtil;
import com.bkav.edoc.service.xml.base.util.DateUtils;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.hibernate.Session;

import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import java.util.*;
import java.util.stream.Collectors;

public class EdocDailyCounterService {
    private final EdocDailyCounterDaoImpl edocDailyCounterDao = new EdocDailyCounterDaoImpl();
    private final EdocDynamicContactService edocDynamicContactService = new EdocDynamicContactService();
    private final EdocDocumentService edocDocumentService = new EdocDocumentService();


    private int vpubnd_sent = 0 , vpubnd_received = 0;

    private String vpubndName = "";

    public boolean checkExistCounter(Date date) {
        return edocDailyCounterDao.checkExistCounter(date);
    }

    public void createDailyCounter(EdocDailyCounter dailyCounter) {
        edocDailyCounterDao.createDailyCounter(dailyCounter);
    }
    //MinhTD
    //****** Using for Tay Ninh
    /*public List<EPublicStat> getStatsDetail(Date fromDate, Date toDate, String keyword, boolean isGetAllAgency) {

        vpubnd_sent = 0; vpubnd_received = 0;

        List<EPublicStat> ePublicStats = new ArrayList<>();
        vpubnd_sent = 0;
        vpubnd_received = 0;
        vpubndName = "";
        boolean hasKeyword = false;
        boolean isDomain= true;
        boolean isVPUBND= false;
        List<OrganizationCacheEntry> contacts;
        List<OrganizationCacheEntry> contactslevel2 = Collections.emptyList();
        Session session = edocDailyCounterDao.openCurrentSession();
        try {
            if (isGetAllAgency) {
                contacts = edocDynamicContactService.getDynamicContactsByAgency(true);
            } else {
                if (keyword == null) {
                    contacts = edocDynamicContactService.getLevel3Contact();
                    contactslevel2 = edocDynamicContactService.getLevel2Contact();
                } else {
                    hasKeyword = true;
                    contacts = edocDynamicContactService.getOrganByKeyword(keyword);
                    isDomain =keyword.matches(".*\\d.*");
                }
            }
            contacts = contacts.stream().filter(o -> (!((o.getDomain().charAt(10)) == 'A')) & ((o.getDomain().charAt(9)) == '.')).collect(Collectors.toList());
            contactslevel2 = contactslevel2.stream().filter(o -> (((o.getDomain().charAt(9)) == '.') & ((o.getDomain().charAt(10)) != 'A'))).collect(Collectors.toList());

            for (OrganizationCacheEntry contact : contacts) {
                String organId = contact.getDomain();
                System.out.println(organId);
                EPublicStat parentOrgan = callStatStoredProcedure(fromDate, toDate, session, contact);

                if (parentOrgan == null ) {
                    isVPUBND=true;
                    continue;
                }

                String regex = "." + organId.split("\\.")[2] +
                        "." + organId.split("\\.")[3];

                List<OrganizationCacheEntry> childOrgan = edocDynamicContactService.getOrganByKeyword(regex);

                List<EPublicStat> childOrganStatSet = new ArrayList<>();

                for (OrganizationCacheEntry child : childOrgan) {
                    if(isDomain==false || (hasKeyword==true && keyword.length()<13)){
                        continue;
                    }
                    String childDomain = child.getDomain();
                    if (!childDomain.equals(organId)) {
                        EPublicStat childOrganStat = callStatStoredProcedure(fromDate, toDate, session, child);
                        childOrganStatSet.add(childOrganStat);
                    }
                    for (int i = 0; i < contactslevel2.size(); i++) {
                        String childDomainleveltwo = contactslevel2.get(i).getDomain();

                        if (childDomainleveltwo.equals(childDomain) || childDomainleveltwo.equals(organId)) {
                            contactslevel2.remove(contactslevel2.get(i));
                        }
                    }
                }
                parentOrgan.setChildOrgan(childOrganStatSet);
                ePublicStats.add(parentOrgan);
            }
            if (!hasKeyword || isVPUBND==true    ) {
                System.out.println("abc");
                EPublicStat ePublicStat = new EPublicStat();
                ePublicStat.setLastUpdate(new Date());
                ePublicStat.setOrganDomain(PropsUtil.get("edoc.domain.vpubnd.1"));
                ePublicStat.setOrganName(vpubndName);
                ePublicStat.setSent(vpubnd_sent);
                ePublicStat.setReceived(vpubnd_received);
                long total = vpubnd_sent + vpubnd_received;
                ePublicStat.setTotal(total);
                ePublicStats.add(ePublicStat);
            }
            for (OrganizationCacheEntry contactleveltwo : contactslevel2) {
                String organIdleveltwo = contactleveltwo.getDomain();

                EPublicStat parentOrganleveltwo = callStatStoredProcedure(fromDate, toDate, session, contactleveltwo);

                if (parentOrganleveltwo == null) {

                    continue;
                }

                String regextwo = "." + organIdleveltwo.split("\\.")[1] + "." + organIdleveltwo.split("\\.")[2] +
                        "." + organIdleveltwo.split("\\.")[3];

                List<OrganizationCacheEntry> childOrganleveltwo = edocDynamicContactService.getOrganByKeyword(regextwo);

                List<EPublicStat> childOrganStatSetleveltwo = new ArrayList<>();

                for (OrganizationCacheEntry child : childOrganleveltwo) {
                    String childDomain = child.getDomain();
                    if (!childDomain.equals(organIdleveltwo)) {
                        EPublicStat childOrganStat = callStatStoredProcedure(fromDate, toDate, session, child);
                        childOrganStatSetleveltwo.add(childOrganStat);
                    }
                }
                parentOrganleveltwo.setChildOrgan(childOrganStatSetleveltwo);
                ePublicStats.add(parentOrganleveltwo);
            }

        } catch (Exception e) {
            LOGGER.error("Error get stat document detail cause " + e);
        } finally {
            edocDailyCounterDao.closeCurrentSession(session);
        }

        return ePublicStats;
    }*/
   /* public List<EPublicStat> getStatsDailyforScheduler(Date fromDate, Date toDate, String keyword, boolean isGetAllAgency) {

        List<EPublicStat> ePublicStats = new ArrayList<>();

        boolean hasKeyword = false;
        boolean isDomain= true;

        List<OrganizationCacheEntry> contacts;
        List<OrganizationCacheEntry> contactslevel2 = Collections.emptyList();
        Session session = edocDailyCounterDao.openCurrentSession();
        try {
            if (isGetAllAgency) {
                contacts = edocDynamicContactService.getDynamicContactsByAgency(true);
            } else {
                if (keyword == null) {
                    contacts = edocDynamicContactService.getLevel3Contact();
                    contactslevel2 = edocDynamicContactService.getLevel2Contact();
                } else {
                    hasKeyword = true;
                    contacts = edocDynamicContactService.getOrganByKeyword(keyword);
                    isDomain =keyword.matches(".*\\d.*");
                }
            }
            contacts = contacts.stream().filter(o -> (!((o.getDomain().charAt(10)) == 'A')) & ((o.getDomain().charAt(9)) == '.')).collect(Collectors.toList());
            contactslevel2 = contactslevel2.stream().filter(o -> (((o.getDomain().charAt(9)) == '.') & ((o.getDomain().charAt(10)) != 'A'))).collect(Collectors.toList());

            for (OrganizationCacheEntry contact : contacts) {
                String organId = contact.getDomain();
                EdocStatDaily edocStatDaily= new  EdocStatDailyServiceUtil().findById(organId);


                    EPublicStat parentOrgan = new EPublicStat();
                    parentOrgan.setLastUpdate(new Date());
                    parentOrgan.setOrganDomain(edocStatDaily.getOrganDomain());
                    parentOrgan.setOrganName(edocStatDaily.getName());
                    parentOrgan.setSent(edocStatDaily.getTotalSent());
                    parentOrgan.setReceived(edocStatDaily.getTotalReceived());
                    int total = edocStatDaily.getTotalReceived() + edocStatDaily.getTotalSent();
                    parentOrgan.setTotal(total);


                    String regex = "." + organId.split("\\.")[2] +
                            "." + organId.split("\\.")[3];

                    List<OrganizationCacheEntry> childOrgan = edocDynamicContactService.getOrganByKeyword(regex);

                    List<EPublicStat> childOrganStatSet = new ArrayList<>();

                    for (OrganizationCacheEntry child : childOrgan) {
                        if (isDomain == false || (hasKeyword == true && keyword.length() < 13)) {
                            continue;
                        }
                        String childDomain = child.getDomain();
                        if (!childDomain.equals(organId)) {

                            EdocStatDaily esd = new EdocStatDailyServiceUtil().findById(childDomain);

                            EPublicStat childOrganStat = new EPublicStat();
                            childOrganStat.setLastUpdate(new Date());
                            childOrganStat.setOrganDomain(esd.getOrganDomain());
                            childOrganStat.setOrganName(esd.getName());
                            childOrganStat.setSent(esd.getTotalSent());
                            childOrganStat.setReceived(esd.getTotalReceived());
                            int sum = esd.getTotalReceived() + esd.getTotalSent();
                            childOrganStat.setTotal(sum);
                            childOrganStatSet.add(childOrganStat);
                        }

                            for (int i = 0; i < contactslevel2.size(); i++) {
                                String childDomainleveltwo = contactslevel2.get(i).getDomain();

                                if (childDomainleveltwo.equals(childDomain) || childDomainleveltwo.equals(organId)) {
                                    contactslevel2.remove(contactslevel2.get(i));
                                }
                            }


                    }
                    parentOrgan.setChildOrgan(childOrganStatSet);
                    ePublicStats.add(parentOrgan);

            }
//            if (!hasKeyword || isVPUBND==true   ) {
//                System.out.println("abc");
//                EPublicStat ePublicStat = new EPublicStat();
//                ePublicStat.setLastUpdate(new Date());
//                ePublicStat.setOrganDomain(PropsUtil.get("edoc.domain.vpubnd.1"));
//                ePublicStat.setOrganName(vpubndName);
//                ePublicStat.setSent(vpubnd_sent);
//                ePublicStat.setReceived(vpubnd_received);
//                long total = vpubnd_sent + vpubnd_received;
//                ePublicStat.setTotal(total);
//                ePublicStats.add(ePublicStat);
//            }
            for (OrganizationCacheEntry contactleveltwo : contactslevel2) {
                String organIdleveltwo = contactleveltwo.getDomain();
                EdocStatDaily edocStat= new EdocStatDailyServiceUtil().findById(organIdleveltwo);

                    EPublicStat parentOrgan2 = new EPublicStat();
                    parentOrgan2.setLastUpdate(new Date());
                    parentOrgan2.setOrganDomain(edocStat.getOrganDomain());
                    parentOrgan2.setOrganName(edocStat.getName());
                    parentOrgan2.setSent(edocStat.getTotalSent());
                    parentOrgan2.setReceived(edocStat.getTotalReceived());
                    int total = edocStat.getTotalReceived() + edocStat.getTotalSent();
                    parentOrgan2.setTotal(total);



                    String regextwo = "." + organIdleveltwo.split("\\.")[1] + "." + organIdleveltwo.split("\\.")[2] +
                            "." + organIdleveltwo.split("\\.")[3];

                    List<OrganizationCacheEntry> childOrganleveltwo = edocDynamicContactService.getOrganByKeyword(regextwo);

                    List<EPublicStat> childOrganStatSetleveltwo = new ArrayList<>();

                    for (OrganizationCacheEntry child : childOrganleveltwo) {
                        String childDomain = child.getDomain();
                        if (!childDomain.equals(organIdleveltwo)) {
                            EdocStatDaily edocStatDaily = new EdocStatDailyServiceUtil().findById(childDomain);
                            if(edocStatDaily==null){
                                continue;
                            }
                            EPublicStat parentOrganleveltwo = new EPublicStat();
                            parentOrganleveltwo.setLastUpdate(new Date());
                            parentOrganleveltwo.setOrganDomain(edocStatDaily.getOrganDomain());
                            parentOrganleveltwo.setOrganName(edocStatDaily.getName());
                            parentOrganleveltwo.setSent(edocStatDaily.getTotalSent());
                            parentOrganleveltwo.setReceived(edocStatDaily.getTotalReceived());
                            int sum = edocStatDaily.getTotalReceived() + edocStatDaily.getTotalSent();
                            parentOrganleveltwo.setTotal(sum);
                            childOrganStatSetleveltwo.add(parentOrganleveltwo);
                        }
                    }
                    parentOrgan2.setChildOrgan(childOrganStatSetleveltwo);
                    ePublicStats.add(parentOrgan2);
                }

                System.out.println(contactslevel2.size());
        } catch (Exception e) {
            LOGGER.error("Error get stat document detail cause " + e);
        } finally {
            edocDailyCounterDao.closeCurrentSession(session);
        }

        return ePublicStats;
    }*/


    // Service using for Lam Dong.
    public List<EPublicStat> getStatsDetail(Date fromDate, Date toDate, String keyword, boolean isGetAllAgency) {
        List<EPublicStat> ePublicStats = new ArrayList<>();
        vpubnd_sent = 0;
        vpubnd_received = 0;
        vpubndName = "";
        boolean hasKeyword = false;
        boolean isDomain=true ;
        List<OrganizationCacheEntry> contacts;
        List<OrganizationCacheEntry> contactslevel2 = Collections.emptyList();

        Session session = edocDailyCounterDao.openCurrentSession();
        try {
            if (isGetAllAgency) {
                contacts = edocDynamicContactService.getDynamicContactsByAgency(true);
            } else {
                if (keyword == null) {
                    contacts = edocDynamicContactService.getLevel3Contact();
                    contactslevel2 = edocDynamicContactService.getAllContact();
                } else {
                    hasKeyword = true;
                    contacts = edocDynamicContactService.getOrganByKeyword(keyword);
                    isDomain =keyword.matches(".*\\d.*");
                }
            }

            Set<OrganizationCacheEntry> contactss=  contacts.stream().collect(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(OrganizationCacheEntry::getDomain))));
            //have many OrganizationCacheEntry.getDomain have be duplicated !!
            contactslevel2 = contactslevel2.stream().filter(o -> (((o.getDomain().charAt(9)) == '.')  )).collect(Collectors.toList());
            //have Domain wrong format !!!!
            System.out.println(contactss.size());
            for (OrganizationCacheEntry contact : contactss) {
                String organId = contact.getDomain();
                EPublicStat parentOrgan = callStatStoredProcedure(fromDate, toDate, session, contact);

                String regex = "." + organId.split("\\.")[2] +
                        "." + organId.split("\\.")[3];

                List<OrganizationCacheEntry> childOrgan = edocDynamicContactService.getOrganByKeyword(regex);

                List<EPublicStat> childOrganStatSet = new ArrayList<>();

                for (OrganizationCacheEntry child : childOrgan) {
                    if(isDomain==false || (hasKeyword==true && keyword.length()<13)){
                        continue;
                    }
                    String childDomain = child.getDomain();
                    if (!childDomain.equals(organId)) {
                        EPublicStat childOrganStat = callStatStoredProcedure(fromDate, toDate, session, child);
                        childOrganStatSet.add(childOrganStat);
                    }
                    for (int i = 0; i < contactslevel2.size(); i++) {
                        String childDomainleveltwo = contactslevel2.get(i).getDomain();

                        if (childDomainleveltwo.equals(childDomain) || childDomainleveltwo.equals(organId)) {
                            contactslevel2.remove(contactslevel2.get(i));
                        }
                    }
                }
                parentOrgan.setChildOrgan(childOrganStatSet);
                ePublicStats.add(parentOrgan);
            }

            for (OrganizationCacheEntry contactlevel2 : contactslevel2) {
                String organIdlevel2 = contactlevel2.getDomain();
                EPublicStat parentOrganlevel2 = callStatStoredProcedure(fromDate, toDate, session, contactlevel2);
                parentOrganlevel2.setChildOrgan(null);
                ePublicStats.add(parentOrganlevel2);
            }

            System.out.println(contactslevel2.size());
        } catch (Exception e) {
            LOGGER.error("Error get stat document detail cause " + e);
        } finally {
            edocDailyCounterDao.closeCurrentSession(session);
        }
        return ePublicStats;
    }


    public List<EPublicStat> getStatsDailyforScheduler(Date fromDate, Date toDate, String keyword, boolean isGetAllAgency) {

        List<EPublicStat> ePublicStats = new ArrayList<>();

        boolean hasKeyword = false;
        boolean isDomain= true;

        List<OrganizationCacheEntry> contacts;
        List<OrganizationCacheEntry> contactslevel2 = Collections.emptyList();
        Session session = edocDailyCounterDao.openCurrentSession();
        try {
            if (isGetAllAgency) {
                contacts = edocDynamicContactService.getDynamicContactsByAgency(true);
            } else {
                if (keyword == null) {
                    contacts = edocDynamicContactService.getLevel3Contact();
                    contactslevel2 = edocDynamicContactService.getAllContact();
                } else {
                    hasKeyword = true;
                    contacts = edocDynamicContactService.getOrganByKeyword(keyword);
                    isDomain =keyword.matches(".*\\d.*");
                }
            }
            Set<OrganizationCacheEntry> contactss=  contacts.stream().collect(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(OrganizationCacheEntry::getDomain))));
            //have many OrganizationCacheEntry.getDomain have be duplicated !!
            contactslevel2 = contactslevel2.stream().filter(o -> (((o.getDomain().charAt(9)) == '.')  )).collect(Collectors.toList());

            for (OrganizationCacheEntry contact : contactss) {
                String organId = contact.getDomain();
                EdocStatDaily edocStatDaily= new  EdocStatDailyServiceUtil().findById(organId);


                EPublicStat parentOrgan = new EPublicStat();
                parentOrgan.setLastUpdate(new Date());
                parentOrgan.setOrganDomain(edocStatDaily.getOrganDomain());
                parentOrgan.setOrganName(edocStatDaily.getName());
                parentOrgan.setSent(edocStatDaily.getTotalSent());
                parentOrgan.setReceived(edocStatDaily.getTotalReceived());
                int total = edocStatDaily.getTotalReceived() + edocStatDaily.getTotalSent();
                parentOrgan.setTotal(total);


                String regex = "." + organId.split("\\.")[2] +
                        "." + organId.split("\\.")[3];

                List<OrganizationCacheEntry> childOrgan = edocDynamicContactService.getOrganByKeyword(regex);

                List<EPublicStat> childOrganStatSet = new ArrayList<>();

                for (OrganizationCacheEntry child : childOrgan) {
                    if (isDomain == false || (hasKeyword == true && keyword.length() < 13)) {
                        continue;
                    }
                    String childDomain = child.getDomain();
                    if (!childDomain.equals(organId)) {

                        EdocStatDaily esd = new EdocStatDailyServiceUtil().findById(childDomain);

                        EPublicStat childOrganStat = new EPublicStat();
                        childOrganStat.setLastUpdate(new Date());
                        childOrganStat.setOrganDomain(esd.getOrganDomain());
                        childOrganStat.setOrganName(esd.getName());
                        childOrganStat.setSent(esd.getTotalSent());
                        childOrganStat.setReceived(esd.getTotalReceived());
                        int sum = esd.getTotalReceived() + esd.getTotalSent();
                        childOrganStat.setTotal(sum);
                        childOrganStatSet.add(childOrganStat);
                    }

                    for (int i = 0; i < contactslevel2.size(); i++) {
                        String childDomainleveltwo = contactslevel2.get(i).getDomain();

                        if (childDomainleveltwo.equals(childDomain) || childDomainleveltwo.equals(organId)) {
                            contactslevel2.remove(contactslevel2.get(i));
                        }
                    }

                }
                parentOrgan.setChildOrgan(childOrganStatSet);
                ePublicStats.add(parentOrgan);

            }

            for (OrganizationCacheEntry contactleveltwo : contactslevel2) {
                String organIdleveltwo = contactleveltwo.getDomain();
                EdocStatDaily edocStat= new EdocStatDailyServiceUtil().findById(organIdleveltwo);

                EPublicStat parentOrgan2 = new EPublicStat();
                parentOrgan2.setLastUpdate(new Date());
                parentOrgan2.setOrganDomain(edocStat.getOrganDomain());
                parentOrgan2.setOrganName(edocStat.getName());
                parentOrgan2.setSent(edocStat.getTotalSent());
                parentOrgan2.setReceived(edocStat.getTotalReceived());
                int total = edocStat.getTotalReceived() + edocStat.getTotalSent();
                parentOrgan2.setTotal(total);

                ePublicStats.add(parentOrgan2);
            }

            System.out.println(contactslevel2.size());
        } catch (Exception e) {
            LOGGER.error("Error get stat document detail cause " + e);
        } finally {
            edocDailyCounterDao.closeCurrentSession(session);
        }

        return ePublicStats;
    }

    private EPublicStat callStatStoredProcedure(Date fromDate, Date toDate, Session session, OrganizationCacheEntry contact) {

        StoredProcedureQuery storedProcedureQuery = session.createStoredProcedureQuery("GetStat");
        storedProcedureQuery.registerStoredProcedureParameter("fromDate", java.sql.Date.class, ParameterMode.IN);
        storedProcedureQuery.registerStoredProcedureParameter("toDate", java.sql.Date.class, ParameterMode.IN);
        storedProcedureQuery.registerStoredProcedureParameter("organId", String.class, ParameterMode.IN);
        storedProcedureQuery.registerStoredProcedureParameter("totalSent", Integer.class, ParameterMode.OUT);
        storedProcedureQuery.registerStoredProcedureParameter("totalReceived", Integer.class, ParameterMode.OUT);
        if (fromDate == null || toDate == null) {
            java.sql.Date date = null;
            storedProcedureQuery.setParameter("fromDate", date);
            storedProcedureQuery.setParameter("toDate", date);
        } else {
            storedProcedureQuery.setParameter("fromDate", fromDate);
            storedProcedureQuery.setParameter("toDate", toDate);
        }

        storedProcedureQuery.setParameter("organId", contact.getDomain());
        int sent = 0;
        int received = 0;
        if (storedProcedureQuery.getOutputParameterValue("totalSent") != null) {
            sent = (Integer) storedProcedureQuery.getOutputParameterValue("totalSent");
        }
        if (storedProcedureQuery.getOutputParameterValue("totalReceived") != null) {
            received = (Integer) storedProcedureQuery.getOutputParameterValue("totalReceived");
        }
        if (contact.getDomain().equals(PropsUtil.get("edoc.domain.vpubnd.0")) ||
                contact.getDomain().equals(PropsUtil.get("edoc.domain.vpubnd.1"))) {
            vpubnd_sent += sent;
            vpubnd_received += received;
            System.out.println("ddsfdishfjdhfkjgdfkljg");
            if (contact.getDomain().equals(PropsUtil.get("edoc.domain.vpubnd.1"))) {
                vpubndName = contact.getName();
            }
            if (contact.getDomain().equals(PropsUtil.get("edoc.domain.vpubnd.0"))) {
                if(vpubndName=="") {
                    vpubndName = contact.getName();
                }
            }

            return null;
        } else {
            EPublicStat ePublicStat = new EPublicStat();
            ePublicStat.setLastUpdate(new Date());
            ePublicStat.setOrganDomain(contact.getDomain());
            ePublicStat.setOrganName(contact.getName());
            ePublicStat.setSent(sent);
            ePublicStat.setReceived(received);
            int total = sent + received;
            ePublicStat.setTotal(total);
            return ePublicStat;
        }
    }


    public List<EPublicStat> getStatDetailForExcel() {
        vpubnd_sent = 0; vpubnd_received = 0;
        List<EPublicStat> ePublicStats = new ArrayList<>();
        List<OrganizationCacheEntry> contacts;
        Session session = edocDailyCounterDao.openCurrentSession();
        try {
            contacts = edocDynamicContactService.getDynamicContactsByAgency(true);

            // Except organ contain "A" in domain
            contacts = contacts.stream().filter(o -> (!((o.getDomain().charAt(10)) == 'A') & ((o.getDomain().charAt(9)) == '.'))).collect(Collectors.toList());

            contacts.forEach(contact -> {
                EPublicStat parentOrgan = callStatStoredProcedure(null, null, session, contact);

                if (parentOrgan != null)
                    ePublicStats.add(parentOrgan);
            });

            EPublicStat ePublicStat = new EPublicStat();
            ePublicStat.setLastUpdate(new Date());
            ePublicStat.setOrganDomain(PropsUtil.get("edoc.domain.vpubnd.1"));
            ePublicStat.setOrganName(vpubndName);
            ePublicStat.setSent(vpubnd_sent);
            ePublicStat.setReceived(vpubnd_received);
            long total = vpubnd_sent + vpubnd_received;
            ePublicStat.setTotal(total);
            ePublicStat.setChildOrgan(null);
            ePublicStats.add(ePublicStat);
        } catch (Exception e) {
            LOGGER.error("Error get stat document detail cause " + e);
        } finally {
            edocDailyCounterDao.closeCurrentSession(session);
        }
        return ePublicStats;
    }


    public List<EdocStatisticDetail> getStatisticSentReceivedExtDetail(String fromDate, String toDate, String organDomain) {
        Map<String, EdocStatisticDetail> dailyCounterMap = new HashMap<>();
        List<EdocStatisticDetail> edocStatDetails = new ArrayList<>();

        if (organDomain != null) {
            EdocDynamicContact contact = EdocDynamicContactServiceUtil.findContactByDomain(organDomain);
            if (contact.getAgency()) {
                LOGGER.info("Start count with organ " + organDomain + "!!!!!!!!!!");
                EdocStatisticDetail edocStatisticDetail = new EdocStatisticDetail();
                int receivedExt = edocDocumentService.countReceivedExtDocument(fromDate, toDate, true, organDomain);
                edocStatisticDetail.setOrganDomain(organDomain);
                edocStatisticDetail.setReceived_ext(receivedExt);

                int receivedInt = edocDocumentService.countReceivedExtDocument(fromDate, toDate, false, organDomain);
                edocStatisticDetail.setReceived_int(receivedInt);
                int totalRecived = receivedExt + receivedInt;
                edocStatisticDetail.setTotal_received(totalRecived);
                LOGGER.info("Total received: " + totalRecived);

                List<Long> listDocCode = edocDocumentService.getDocCodeByOrganDomain(fromDate, toDate, organDomain);
                LOGGER.info("Has " + listDocCode.size() + " documents!!!!");
                edocStatDetails.add(edocStatisticDetail);
            }
        } else {
            List<EdocDynamicContact> organs = EdocDynamicContactServiceUtil.getDynamicContactByAgency(true);

            for (EdocDynamicContact organ : organs) {
                String domain = organ.getDomain();
                LOGGER.info("Start count with organ " + domain + "!!!!");
                EdocStatisticDetail edocStatDetail = new EdocStatisticDetail();

                int receivedExt = edocDocumentService.countReceivedExtDocument(fromDate, toDate, true, domain);
                edocStatDetail.setOrganDomain(domain);
                edocStatDetail.setReceived_ext(receivedExt);

                int receivedInt = edocDocumentService.countReceivedExtDocument(fromDate, toDate, false, domain);
                edocStatDetail.setReceived_int(receivedInt);
                int totalRecived = receivedExt + receivedInt;
                edocStatDetail.setTotal_received(totalRecived);
                LOGGER.info("Total received: " + totalRecived);

                List<Long> listDocCode = edocDocumentService.getDocCodeByOrganDomain(fromDate, toDate, domain);
                LOGGER.info("Has " + listDocCode.size() + " documents!!!!");
                dailyCounterMap.put(domain, edocStatDetail);
                LOGGER.info("End count organ domain " + domain);
            }
            for (Map.Entry<String, EdocStatisticDetail> entry : dailyCounterMap.entrySet()) {
                EdocStatisticDetail dailyStat = entry.getValue();
                edocStatDetails.add(dailyStat);
            }
        }

        return edocStatDetails;
    }

    public static void main(String[] args) {
        EdocDailyCounterService edocDailyCounterService = new EdocDailyCounterService();
        Date fromDateValue = DateUtils.parse("01-03-2021");
        Date toDateValue = DateUtils.parse("13-03-2021");
        //System.out.println(new Gson().toJson(edocDailyCounterService.getStatisticSentReceivedExtDetail("2020-12-01", "2020-12-31", null)));
        System.out.println(new Gson().toJson(edocDailyCounterService.getStatsDetail(fromDateValue, toDateValue, null, false)));
    }

    public EPublic getStat() {
        EPublic ePublic = new EPublic();
        int year = Calendar.getInstance().get(Calendar.YEAR);
        Long total = edocDailyCounterDao.getStat(year);
        ePublic.setTotal(total);
        ePublic.setTotalOrgan(edocDynamicContactService.countOrgan(true));
        ePublic.setDateTime(DateUtils.format(new Date(), DateUtils.VN_DATETIME_FORMAT_NEW));
        return ePublic;
    }

    public String getSentReceivedForChart(int year, String organDomain) {
        Map<String, List<Long>> map = new HashMap<>();
        List<Long> sent, moreSent;
        List<Long> received, moreReceived;
        sent = edocDailyCounterDao.getSentByMonth(year, organDomain);
        received = edocDailyCounterDao.getReceivedByMonth(year, organDomain);
        map.put("sent", sent);
        map.put("received", received);
        return new Gson().toJson(map);
    }

    private final static Logger LOGGER = Logger.getLogger(EdocDocumentService.class);
}
