package com.bkav.edoc.service.xml;

import com.bkav.edoc.service.xml.base.Content;
import com.bkav.edoc.service.xml.base.attachment.Attachment;
import com.bkav.edoc.service.xml.base.builder.BuildException;
import com.bkav.edoc.service.xml.base.header.*;
import com.bkav.edoc.service.xml.base.util.DateUtils;
import com.bkav.edoc.service.xml.ed.Ed;
import com.bkav.edoc.service.xml.ed.builder.EdXmlBuilder;
import com.bkav.edoc.service.xml.ed.header.*;
import com.bkav.edoc.service.xml.status.builder.StatusXmlBuilder;
import com.bkav.edoc.service.xml.status.header.MessageStatus;
import com.google.common.collect.Lists;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EdXmlBuild {
    public static void main(String[] args) throws Exception {

        int run = 1;
        switch (run) {
            case 1:
                // tao van ban moi
                Content content = createEdoc_new();
                System.out.println("Path build: " + content.getContent().getPath());
                break;
            case 2:
                // tao van ban thay the
                content = createEdoc_replace();
                System.out.println("Path build: " + content.getContent().getPath());
                break;
            case 3:
                // tao van ban thu hoi
                content = createEdoc_revocation();
                System.out.println("Path build: " + content.getContent().getPath());
                break;
            case 4:
                // tao van ban cap nhat
                content = createEdoc_update();
                System.out.println("Path build: " + content.getContent().getPath());
                break;
            case 5:
                // tao van ban trang thai
                content = create_status();
                System.out.println("Path build: " + content.getContent().getPath());
                break;
            case 6:
                // doc thong tin tu file co san
                content = getContentFormFile();
                System.out.println("Path build: " + content.getContent().getPath());
                break;
            default:
                break;
        }
    }

    public static Content getContentFormFile() {
        Content content = null;
        try {
            content = new Content(new File("./resources/edoc.edxml"), "f499922ec2a3e1f1f79ebf1bfc091f502d33703d9201c18d49ff67e1de7419de");
            System.out.println("Content: " + content.toString());
            System.out.println("contentSha256: " + content.getHashCode());
            System.out.println("Key: " + content.getContent().getName());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return content;
    }

    public static Content createEdoc_new() throws Exception {
        Ed ed = new Ed();
        // khoi tao code cho van ban
        Code code = new Code("7816", "VPCP-TT??T");

        // khoi tao cac don vi gui va nhan
        Organization org1 = new Organization("000.00.00.G22", "V??n ph??ng Ch??nh ph???", "V??n ph??ng Ch??nh ph???",
                "S??? 1 Ho??ng Hoa Th??m, Qu???n Ba ????nh, H?? N???i", "vpcp@gov.vn", "8043100", "048989898789", "vpcp.vn");

        Organization org5 = new Organization("000.00.00.H41", "UBND T???nh Ngh??? An", "UBND T???nh Ngh??? An", "S??? 03, ???????ng Tr?????ng Thi, Th??nh ph??? Vinh, T???nh Ngh??? An, Vi???t Nam",
                "nghean@gov.vn", "0383 840418", "0383 843049", "www.nghean.vn");

        Organization org6 = new Organization("000.00.00.H14", "UBND T???nh Cao B???ng", "UBND T???nh Cao B???ng", "S??? 011 - ???????ng Ho??ng ????nh Giong - Th??nh Ph??? Cao B???ng, T???nh Cao B???ng",
                "caobang@gov.vn", "02063852139", "0202183239", "www.caobang.gov.vn");

        Organization org7 = new Organization("000.00.00.G17", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "s??? 62 - V?? Th??? S??u - Ng?? Quy???n - H???i Ph??ng",
                "bxd@moc.gov.vn", "(84-4) 3821 5137", "(023)37366617", "www.haiphong.gov.vn");
        // khoi tao don vi gui
        Organization from = org1;

        // khoi tao danh sach don vi nhan
        List<Organization> toes = Lists.newArrayList(org5, org6, org7);

        // khoi tao thong tin ban hanh
        PromulgationInfo promulgationInfo = new PromulgationInfo("H?? N???i", DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));

        // khoi tao loai van ban
        DocumentType docType = new DocumentType(1, "C??ng v??n");

        // khoi tao thong tin nguoi ky
        SignerInfo signerInfo = new SignerInfo("TL. BO TRUONG", "Cuc truong cuc ung dung cong nghe thong tin", "Nguyen Thanh Phuc");

        // khai bao tieu de
        String subject = "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n";
        // khai bao noi dung
        String context = "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n";

        // khoi tao header
        MessageHeader header = new MessageHeader(from, toes, code, promulgationInfo, docType, subject,
                context, null, signerInfo, new Date(), null, null);

        // dia diem noi nhan va luu van ban
        header.addToPlace("Cac bo va co quan ngang bo");
        header.addToPlace("Uy ban nhan dan cac tinh, TP");

        // khoi tao loai chi dao
        header.setSteeringType(1);

        // khoi tao cac thong tin khac cua van ban
        OtherInfo otherInfo = new OtherInfo();
        otherInfo.setPriority(0);
        otherInfo.setPromulgationAmount(2);
        otherInfo.setPageAmount(22);
        otherInfo.setSphereOfPromulgation("Li??n th??ng v??n b???n qu???c gia");
        List<String> paramList = new ArrayList<String>();
        paramList.add("C??ng v??n v??? vi???c k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n");
        otherInfo.setTyperNotation("TVC");
        otherInfo.setAppendixes(paramList);
        header.setOtherInfo(otherInfo);

        // khoi tao thong tin ma dinh danh cua van ban
        header.setDocumentId("000.00.00.G22,2015/09/30,7816/VPCP-TT??T");

        // khoi tao thong tin van ban phan hoi va phuc dap
        ResponseFor responseFor = new ResponseFor("000.00.00.H41", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");
        ResponseFor responseFor2 = new ResponseFor("000.00.00.H14", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");

        // add responseFor
        //header.setResponseFor(responseFor);
        //header.setResponseFor(responseFor2);

        // khoi tao cac thong tin traceHeader
        TraceHeaderList trList = new TraceHeaderList();
        TraceHeader trace1 = new TraceHeader();
        trace1.setOrganId("000.00.00.G22");
        trace1.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        trList.addTraceHeader(trace1);
        //TraceHeader trace2 = new TraceHeader();
        //trace2.setOrganId("000.00.00.H41");
        //trace2.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        //trList.addTraceHeader(trace2);

        // khoi tao danh sach cac truong thong tin duoc van ban cap nhat
        BusinessDocumentInfo businessDocumentInfo = new BusinessDocumentInfo();
        businessDocumentInfo.setDocumentInfo("1");
        businessDocumentInfo.setDocumentReceiver("1");

        // khoi tao danh sach cac don vi nhan bi thay doi khi cap nhat van ban
        ReceiverList receiverList = new ReceiverList();
        Receiver receiver = new Receiver("000.00.00.H41", "0");
        Receiver receiver2 = new Receiver("000.00.00.H14", "1");
        receiverList.addReceiver(receiver);
        receiverList.addReceiver(receiver2);

        // khoi tao thong tin ve nguoi xu ly
        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setDepartment("V??n th?? v??n ph??ng");
        staffInfo.setStaff("Nguy???n Th??? Ng???c Tr??m");
        staffInfo.setEmail("vanthuvanphong@gov.vn");
        staffInfo.setMobile("84912000001");

        // khoi tao thong tin danh sach van ban bi thay the
        ReplacementInfoList replacementInfoList = new ReplacementInfoList();
        ReplacementInfo replacementInfo = new ReplacementInfo();
        OrganIdList organIdList = new OrganIdList();
        organIdList.addOrganId("000.00.00.H41");
        organIdList.addOrganId("000.00.00.H14");
        replacementInfo.setOrganIdList(organIdList);
        replacementInfo.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");
        replacementInfoList.addReplacementInfo(replacementInfo);
        replacementInfoList.addReplacementInfo(replacementInfo);


        // khoi tao cac thong tin danh dau loai nghiep vu van ban
        Business business = new Business();
        business.setBusinessDocReason("V??n b???n ??i???n t??? m???i");
        business.setBusinessDocType(0);
        business.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");
        business.setPaper(0);
        // add addreceiverList
        businessDocumentInfo.setReceiverList(receiverList);
        // add staffInfo
        business.setStaffInfo(staffInfo);
        // add BussinessDocumentInfo
        //bussiness.addBussinessDocumentInfo(bussinessDocumentInfo);
        // add ReplacementInfoList
        //bussiness.addReplacementInfoList(replacementInfoList);

        // add TraceHeaderList
        trList.setBusiness(business);

        // khoi tao thong tin chu ky
        SignReference signReference = new SignReference("", "http://www.w3.org/2000/09/xmldsig#sha1",
                "FwgIqsSYJshUS2+wlOM61L+q7Aw=");
        signReference.addToTransform("http://www.w3.org/2000/09/xmldsig#enveloped-signature");
        signReference.addToTransform("http://www.w3.org/TR/xml-exc-c14n#");
        List<SignReference> listSignReference = new ArrayList<SignReference>();
        listSignReference.add(signReference);
        SignedInfo signedInfo = new SignedInfo("http://www.w3.org/TR/2001/REC-xml-c14n-20010315", "http://www.w3.org/2000/09/xmldsig#rsa-sha1", listSignReference);
        String SignatureValue = "GbVb8n9+qFxz466Ag0sbpVdLPs2R0+9JBekp12UyarAZjoG0W/kPZZJ1auRZDcNcrSwzgkQMpqrjwxcy3ejzbY/ON5USUPgoYNYM8p4wsgQpEAeQaZ+EWLkkEBxYjb+iWEiAjYuJI7gtJoOyENcOK4fO050SXp2ctOc32LJMA5eEI6Hw7sxhc2LAgcPiynJHdDW2Z+eut6QZiUsbIF9+S3T6u/tfLImw39dgSlCxupwLPHepxuiLOqyd08HeJGCZufg9WqRBVyLFM76uCIaPRP5wwAdx72GVjPcG2kh+2jjrt7fqtJOufJzCObtQgPgBqIvDiZCGoOM41OQMiqtF3w==";
        KeyInfo keyInfo = new KeyInfo(new X509Data("CN=user05", "MIIFqTCCBJG"));
        Signature signature = new Signature(signedInfo, SignatureValue, keyInfo);

        // khoi tao header van ban
        ed.setHeader(new Header(header, trList, signature));

        // khoi tao file dinh kem
        ed.addAttachment(new Attachment("202", "JavaScriptNotesForProfessionals.pdf", "JavaScriptNotesForProfessionals.pdf", new File("D:\\JavaScriptNotesForProfessionals.pdf")));

        // ghi file ra thu muc
        Content content = EdXmlBuilder.build(ed, "SendDocument" + "." + header.getFrom().getOrganId(), "D:\\");

        return content;
    }

    public static Content createEdoc_replace() throws Exception {
        Ed ed = new Ed();
        Code code = new Code("7816", "VPCP-TT??T");

        Organization org1 = new Organization("000.00.00.G22", "V??n ph??ng Ch??nh ph???", "V??n ph??ng Ch??nh ph???",
                "S??? 1 Ho??ng Hoa Th??m, Qu???n Ba ????nh, H?? N???i", "vpcp@gov.vn", "8043100", "048989898789", "vpcp.vn");

        Organization org5 = new Organization("000.00.00.H41", "UBND T???nh Ngh??? An", "UBND T???nh Ngh??? An", "S??? 03, ???????ng Tr?????ng Thi, Th??nh ph??? Vinh, T???nh Ngh??? An, Vi???t Nam",
                "nghean@gov.vn", "0383 840418", "0383 843049", "www.nghean.vn");

        Organization org6 = new Organization("000.00.00.H14", "UBND T???nh Cao B???ng", "UBND T???nh Cao B???ng", "S??? 011 - ???????ng Ho??ng ????nh Giong - Th??nh Ph??? Cao B???ng, T???nh Cao B???ng",
                "caobang@gov.vn", "02063852139", "0202183239", "www.caobang.gov.vn");

        Organization org7 = new Organization("000.00.00.G17", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "s??? 62 - V?? Th??? S??u - Ng?? Quy???n - H???i Ph??ng",
                "bxd@moc.gov.vn", "(84-4) 3821 5137", "(023)37366617", "www.haiphong.gov.vn");

        Organization from = org1;
        List<Organization> toes = Lists.newArrayList(org5, org6, org7);

        PromulgationInfo promulgationInfo = new PromulgationInfo("H?? N???i", DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        DocumentType docType = new DocumentType(1, "C??ng v??n");

        SignerInfo signerInfo = new SignerInfo("TL. BO TRUONG", "Cuc truong cuc ung dung cong nghe thong tin", "Nguyen Thanh Phuc");

        MessageHeader header = new MessageHeader(from, toes, code, promulgationInfo, docType, "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n",
                "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n", null, signerInfo, new Date(), null, null);

        header.addToPlace("Cac bo va co quan ngang bo");
        header.addToPlace("Uy ban nhan dan cac tinh, TP");

        header.setSteeringType(1);

        OtherInfo otherInfo = new OtherInfo();
        otherInfo.setPriority(0);
        otherInfo.setPromulgationAmount(2);
        otherInfo.setPageAmount(22);
        otherInfo.setSphereOfPromulgation("Li??n th??ng v??n b???n qu???c gia");
        List<String> paramList = new ArrayList<String>();
        paramList.add("C??ng v??n v??? vi???c k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n");
        otherInfo.setTyperNotation("TVC");
        otherInfo.setAppendixes(paramList);

        header.setOtherInfo(otherInfo);
        header.setDocumentId("000.00.00.G22,2015/09/30,7816/VPCP-TT??T");
        ResponseFor responseFor = new ResponseFor("000.00.00.H41", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");
        ResponseFor responseFor2 = new ResponseFor("000.00.00.H14", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");

        // add responseFor
        //header.setResponseFor(responseFor);
        //header.setResponseFor(responseFor2);

        TraceHeaderList trList = new TraceHeaderList();
        TraceHeader trace1 = new TraceHeader();
        trace1.setOrganId("000.00.00.G22");
        trace1.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        trList.addTraceHeader(trace1);

        //TraceHeader trace2 = new TraceHeader();
        //trace2.setOrganId("000.00.00.H41");
        //trace2.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        //trList.addTraceHeader(trace2);

        Business business = new Business();
        business.setBusinessDocReason("V??n b???n thay th???");
        business.setBusinessDocType(3);
        //bussiness.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");
        business.setPaper(0);

        BusinessDocumentInfo businessDocumentInfo = new BusinessDocumentInfo();
        businessDocumentInfo.setDocumentInfo("1");
        businessDocumentInfo.setDocumentReceiver("1");

        ReceiverList receiverList = new ReceiverList();

        Receiver receiver = new Receiver("000.00.00.H41", "0");
        Receiver receiver2 = new Receiver("000.00.00.H14", "1");
        receiverList.addReceiver(receiver);
        receiverList.addReceiver(receiver2);

        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setDepartment("V??n th?? v??n ph??ng");
        staffInfo.setStaff("Nguy???n Th??? Ng???c Tr??m");
        staffInfo.setEmail("vanthuvanphong@gov.vn");
        staffInfo.setMobile("84912000001");


        ReplacementInfoList replacementInfoList = new ReplacementInfoList();
        ReplacementInfo replacementInfo = new ReplacementInfo();
        OrganIdList organIdList = new OrganIdList();
        organIdList.addOrganId("000.00.00.H41");
        organIdList.addOrganId("000.00.00.H14");

        replacementInfo.setOrganIdList(organIdList);
        replacementInfo.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");
        replacementInfoList.addReplacementInfo(replacementInfo);
        replacementInfo.setDocumentId("000.00.00.G22,2014/01/30,7806/VPCP-TT??T");
        replacementInfoList.addReplacementInfo(replacementInfo);


        businessDocumentInfo.setReceiverList(receiverList);
        // add staffInfo
        business.setStaffInfo(staffInfo);
        // add BussinessDocumentInfo
        //bussiness.addBussinessDocumentInfo(bussinessDocumentInfo);
        // add ReplacementInfoList
        business.setReplacementInfoList(replacementInfoList);

        trList.setBusiness(business);

        SignReference signReference = new SignReference("", "http://www.w3.org/2000/09/xmldsig#sha1",
                "FwgIqsSYJshUS2+wlOM61L+q7Aw=");
        signReference.addToTransform("http://www.w3.org/2000/09/xmldsig#enveloped-signature");
        signReference.addToTransform("http://www.w3.org/TR/xml-exc-c14n#");
        List<SignReference> listSignReference = new ArrayList<SignReference>();
        listSignReference.add(signReference);
        SignedInfo signedInfo = new SignedInfo("http://www.w3.org/TR/2001/REC-xml-c14n-20010315", "http://www.w3.org/2000/09/xmldsig#rsa-sha1", listSignReference);
        String SignatureValue = "GbVb8n9+qFxz466Ag0sbpVdLPs2R0+9JBekp12UyarAZjoG0W/kPZZJ1auRZDcNcrSwzgkQMpqrjwxcy3ejzbY/ON5USUPgoYNYM8p4wsgQpEAeQaZ+EWLkkEBxYjb+iWEiAjYuJI7gtJoOyENcOK4fO050SXp2ctOc32LJMA5eEI6Hw7sxhc2LAgcPiynJHdDW2Z+eut6QZiUsbIF9+S3T6u/tfLImw39dgSlCxupwLPHepxuiLOqyd08HeJGCZufg9WqRBVyLFM76uCIaPRP5wwAdx72GVjPcG2kh+2jjrt7fqtJOufJzCObtQgPgBqIvDiZCGoOM41OQMiqtF3w==";
        KeyInfo keyInfo = new KeyInfo(new X509Data("CN=user05", "MIIFqTCCBJG"));
        Signature signature = new Signature(signedInfo, SignatureValue, keyInfo);

        ed.setHeader(new Header(header, trList, signature));

        ed.addAttachment(new Attachment("209", "1896_QD-TTg_m_294779.doc", "1896_QD-TTg_m_294779.doc", new File("./resources/edoc.edxml")));
        Content content = EdXmlBuilder.build(ed, "SendDocument" + "." + header.getFrom().getOrganId(), "D:\\");

        return content;
    }

    public static Content createEdoc_revocation() throws Exception {
        Ed ed = new Ed();
        Code code = new Code("7816", "VPCP-TT??T");

        Organization org1 = new Organization("000.00.00.G22", "V??n ph??ng Ch??nh ph???", "V??n ph??ng Ch??nh ph???",
                "S??? 1 Ho??ng Hoa Th??m, Qu???n Ba ????nh, H?? N???i", "vpcp@gov.vn", "8043100", "048989898789", "vpcp.vn");

        Organization org5 = new Organization("000.00.00.H41", "UBND T???nh Ngh??? An", "UBND T???nh Ngh??? An", "S??? 03, ???????ng Tr?????ng Thi, Th??nh ph??? Vinh, T???nh Ngh??? An, Vi???t Nam",
                "nghean@gov.vn", "0383 840418", "0383 843049", "www.nghean.vn");

        Organization org6 = new Organization("000.00.00.H14", "UBND T???nh Cao B???ng", "UBND T???nh Cao B???ng", "S??? 011 - ???????ng Ho??ng ????nh Giong - Th??nh Ph??? Cao B???ng, T???nh Cao B???ng",
                "caobang@gov.vn", "02063852139", "0202183239", "www.caobang.gov.vn");

        Organization org7 = new Organization("000.00.00.G17", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "s??? 62 - V?? Th??? S??u - Ng?? Quy???n - H???i Ph??ng",
                "bxd@moc.gov.vn", "(84-4) 3821 5137", "(023)37366617", "www.haiphong.gov.vn");

        Organization from = org1;
        List<Organization> toes = Lists.newArrayList(org5, org6, org7);

        PromulgationInfo promulgationInfo = new PromulgationInfo("H?? N???i", DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        DocumentType docType = new DocumentType(1, "C??ng v??n");

        SignerInfo signerInfo = new SignerInfo("TL. BO TRUONG", "Cuc truong cuc ung dung cong nghe thong tin", "Nguyen Thanh Phuc");

        MessageHeader header = new MessageHeader(from, toes, code, promulgationInfo, docType, "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n",
                "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n", null, signerInfo, new Date(), null, null);

        header.addToPlace("Cac bo va co quan ngang bo");
        header.addToPlace("Uy ban nhan dan cac tinh, TP");

        header.setSteeringType(1);

        OtherInfo otherInfo = new OtherInfo();
        otherInfo.setPriority(0);
        otherInfo.setPromulgationAmount(2);
        otherInfo.setPageAmount(22);
        otherInfo.setSphereOfPromulgation("Li??n th??ng v??n b???n qu???c gia");
        List<String> paramList = new ArrayList<String>();
        paramList.add("C??ng v??n v??? vi???c k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n");
        otherInfo.setTyperNotation("TVC");
        otherInfo.setAppendixes(paramList);

        header.setOtherInfo(otherInfo);
        header.setDocumentId("000.00.00.G22,2015/09/30,7816/VPCP-TT??T");
        ResponseFor responseFor = new ResponseFor("000.00.00.H41", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");
        ResponseFor responseFor2 = new ResponseFor("000.00.00.H14", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");

        // add responseFor
        header.addResponseFor(responseFor);
        header.addResponseFor(responseFor2);

        TraceHeaderList trList = new TraceHeaderList();
        TraceHeader trace1 = new TraceHeader();
        trace1.setOrganId("000.00.00.G22");
        trace1.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        trList.addTraceHeader(trace1);

        //TraceHeader trace2 = new TraceHeader();
        //trace2.setOrganId("00.00.008.K99");
        //trace2.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        //trList.addTraceHeader(trace2);

        Business business = new Business();
        business.setBusinessDocReason("Thu h???i v??n b???n ??i???n t???");
        business.setBusinessDocType(1);
        //bussiness.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");
        business.setPaper(0);

        BusinessDocumentInfo businessDocumentInfo = new BusinessDocumentInfo();
        businessDocumentInfo.setDocumentInfo("1");
        businessDocumentInfo.setDocumentReceiver("1");

        ReceiverList receiverList = new ReceiverList();

        Receiver receiver = new Receiver("000.00.00.H41", "0");
        Receiver receiver2 = new Receiver("000.00.00.H14", "1");
        receiverList.addReceiver(receiver);
        receiverList.addReceiver(receiver2);

        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setDepartment("V??n th?? v??n ph??ng");
        staffInfo.setStaff("Nguy???n Th??? Ng???c Tr??m");
        staffInfo.setEmail("vanthuvanphong@gov.vn");
        staffInfo.setMobile("84912000001");


        ReplacementInfoList replacementInfoList = new ReplacementInfoList();
        ReplacementInfo replacementInfo = new ReplacementInfo();
        OrganIdList organIdList = new OrganIdList();
        organIdList.addOrganId("000.00.00.H41");
        organIdList.addOrganId("000.00.00.H14");

        replacementInfo.setOrganIdList(organIdList);
        replacementInfo.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");

        replacementInfoList.addReplacementInfo(replacementInfo);
        replacementInfoList.addReplacementInfo(replacementInfo);


        businessDocumentInfo.setReceiverList(receiverList);
        // add staffInfo
        business.setStaffInfo(staffInfo);
        // add BussinessDocumentInfo
        //bussiness.addBussinessDocumentInfo(bussinessDocumentInfo);
        // add ReplacementInfoList
        //bussiness.addReplacementInfoList(replacementInfoList);

        trList.setBusiness(business);

        SignReference signReference = new SignReference("", "http://www.w3.org/2000/09/xmldsig#sha1",
                "FwgIqsSYJshUS2+wlOM61L+q7Aw=");
        signReference.addToTransform("http://www.w3.org/2000/09/xmldsig#enveloped-signature");
        signReference.addToTransform("http://www.w3.org/TR/xml-exc-c14n#");
        List<SignReference> listSignReference = new ArrayList<SignReference>();
        listSignReference.add(signReference);
        SignedInfo signedInfo = new SignedInfo("http://www.w3.org/TR/2001/REC-xml-c14n-20010315", "http://www.w3.org/2000/09/xmldsig#rsa-sha1", listSignReference);
        String SignatureValue = "GbVb8n9+qFxz466Ag0sbpVdLPs2R0+9JBekp12UyarAZjoG0W/kPZZJ1auRZDcNcrSwzgkQMpqrjwxcy3ejzbY/ON5USUPgoYNYM8p4wsgQpEAeQaZ+EWLkkEBxYjb+iWEiAjYuJI7gtJoOyENcOK4fO050SXp2ctOc32LJMA5eEI6Hw7sxhc2LAgcPiynJHdDW2Z+eut6QZiUsbIF9+S3T6u/tfLImw39dgSlCxupwLPHepxuiLOqyd08HeJGCZufg9WqRBVyLFM76uCIaPRP5wwAdx72GVjPcG2kh+2jjrt7fqtJOufJzCObtQgPgBqIvDiZCGoOM41OQMiqtF3w==";
        KeyInfo keyInfo = new KeyInfo(new X509Data("CN=user05", "MIIFqTCCBJG"));
        Signature signature = new Signature(signedInfo, SignatureValue, keyInfo);

        ed.setHeader(new Header(header, trList, signature));

        ed.addAttachment(new Attachment("209", "1896_QD-TTg_m_294779.doc", "1896_QD-TTg_m_294779.doc", new File("./resources/edoc.edxml")));
        Content content = EdXmlBuilder.build(ed, "SendDocument" + "." + header.getFrom().getOrganId(), "D:\\");

        return content;
    }

    public static Content createEdoc_update() throws Exception {
        Ed ed = new Ed();
        Code code = new Code("7816", "VPCP-TT??T");

        Organization org1 = new Organization("000.00.00.G22", "V??n ph??ng Ch??nh ph???", "V??n ph??ng Ch??nh ph???",
                "S??? 1 Ho??ng Hoa Th??m, Qu???n Ba ????nh, H?? N???i", "vpcp@gov.vn", "8043100", "048989898789", "vpcp.vn");

        Organization org5 = new Organization("000.00.00.H41", "UBND T???nh Ngh??? An", "UBND T???nh Ngh??? An", "S??? 03, ???????ng Tr?????ng Thi, Th??nh ph??? Vinh, T???nh Ngh??? An, Vi???t Nam",
                "nghean@gov.vn", "0383 840418", "0383 843049", "www.nghean.vn");

        Organization org6 = new Organization("000.00.00.H14", "UBND T???nh Cao B???ng", "UBND T???nh Cao B???ng", "S??? 011 - ???????ng Ho??ng ????nh Giong - Th??nh Ph??? Cao B???ng, T???nh Cao B???ng",
                "caobang@gov.vn", "02063852139", "0202183239", "www.caobang.gov.vn");

        Organization org7 = new Organization("000.00.00.G17", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "S??? Th??ng tin truy???n th??ng H???i Ph??ng", "s??? 62 - V?? Th??? S??u - Ng?? Quy???n - H???i Ph??ng",
                "bxd@moc.gov.vn", "(84-4) 3821 5137", "(023)37366617", "www.haiphong.gov.vn");

        Organization from = org1;
        List<Organization> toes = Lists.newArrayList(org5, org6, org7);

        PromulgationInfo promulgationInfo = new PromulgationInfo("H?? N???i", DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        DocumentType docType = new DocumentType(1, "C??ng v??n");

        SignerInfo signerInfo = new SignerInfo("TL. BO TRUONG", "Cuc truong cuc ung dung cong nghe thong tin", "Nguyen Thanh Phuc");

        MessageHeader header = new MessageHeader(from, toes, code, promulgationInfo, docType, "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n",
                "V/v k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n", null, signerInfo, new Date(), null, null);

        header.addToPlace("Cac bo va co quan ngang bo");
        header.addToPlace("Uy ban nhan dan cac tinh, TP");

        header.setSteeringType(1);

        OtherInfo otherInfo = new OtherInfo();
        otherInfo.setPriority(0);
        otherInfo.setPromulgationAmount(2);
        otherInfo.setPageAmount(22);
        otherInfo.setSphereOfPromulgation("Li??n th??ng v??n b???n qu???c gia");
        List<String> paramList = new ArrayList<String>();
        paramList.add("C??ng v??n v??? vi???c k???t n???i, li??n th??ng ph???n m???m qu???n l?? v??n b???n");
        otherInfo.setTyperNotation("TVC");
        otherInfo.setAppendixes(paramList);

        header.setOtherInfo(otherInfo);
        header.setDocumentId("000.00.00.G22,2015/09/30,7816/VPCP-TT??T");
        ResponseFor responseFor = new ResponseFor("000.00.00.H41", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");
        ResponseFor responseFor2 = new ResponseFor("000.00.00.H14", "267/VPCP-TT??T", new Date(), "000.00.04.G14,2012/08/06,267/VPCP-TT??T");

        // add responseFor
        //header.setResponseFor(responseFor);
        //header.setResponseFor(responseFor2);

        TraceHeaderList trList = new TraceHeaderList();
        TraceHeader trace1 = new TraceHeader();
        trace1.setOrganId("000.00.00.G22");
        trace1.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        trList.addTraceHeader(trace1);
        //TraceHeader trace2 = new TraceHeader();
        //trace2.setOrganId("00.00.008.K99");
        //trace2.setTimestamp(DateUtils.parse(new SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date())));
        //trList.addTraceHeader(trace2);

        Business business = new Business();
        business.setBusinessDocReason("C???p nh???t v??n b???n ??i???n t???");
        business.setBusinessDocType(2);
        business.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");
        business.setPaper(0);

        BusinessDocumentInfo businessDocumentInfo = new BusinessDocumentInfo();
        businessDocumentInfo.setDocumentInfo("1");
        businessDocumentInfo.setDocumentReceiver("1");

        ReceiverList receiverList = new ReceiverList();

        Receiver receiver = new Receiver("000.00.00.H41", "0");
        Receiver receiver2 = new Receiver("000.00.00.H14", "1");
        receiverList.addReceiver(receiver);
        receiverList.addReceiver(receiver2);

        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setDepartment("V??n th?? v??n ph??ng");
        staffInfo.setStaff("Nguy???n Th??? Ng???c Tr??m");
        staffInfo.setEmail("vanthuvanphong@gov.vn");
        staffInfo.setMobile("84912000001");


        ReplacementInfoList replacementInfoList = new ReplacementInfoList();
        ReplacementInfo replacementInfo = new ReplacementInfo();
        OrganIdList organIdList = new OrganIdList();
        organIdList.addOrganId("000.00.00.H41");
        organIdList.addOrganId("000.00.00.H14");

        replacementInfo.setOrganIdList(organIdList);
        replacementInfo.setDocumentId("000.00.00.G22,2014/02/30,7806/VPCP-TT??T");

        replacementInfoList.addReplacementInfo(replacementInfo);
        replacementInfoList.addReplacementInfo(replacementInfo);


        businessDocumentInfo.setReceiverList(receiverList);
        // add staffInfo
        business.setStaffInfo(staffInfo);
        // add BussinessDocumentInfo
        business.setBusinessDocumentInfo(businessDocumentInfo);
        // add ReplacementInfoList
        //bussiness.addReplacementInfoList(replacementInfoList);

        trList.setBusiness(business);

        SignReference signReference = new SignReference("", "http://www.w3.org/2000/09/xmldsig#sha1",
                "FwgIqsSYJshUS2+wlOM61L+q7Aw=");
        signReference.addToTransform("http://www.w3.org/2000/09/xmldsig#enveloped-signature");
        signReference.addToTransform("http://www.w3.org/TR/xml-exc-c14n#");
        List<SignReference> listSignReference = new ArrayList<SignReference>();
        listSignReference.add(signReference);
        SignedInfo signedInfo = new SignedInfo("http://www.w3.org/TR/2001/REC-xml-c14n-20010315", "http://www.w3.org/2000/09/xmldsig#rsa-sha1", listSignReference);
        String SignatureValue = "GbVb8n9+qFxz466Ag0sbpVdLPs2R0+9JBekp12UyarAZjoG0W/kPZZJ1auRZDcNcrSwzgkQMpqrjwxcy3ejzbY/ON5USUPgoYNYM8p4wsgQpEAeQaZ+EWLkkEBxYjb+iWEiAjYuJI7gtJoOyENcOK4fO050SXp2ctOc32LJMA5eEI6Hw7sxhc2LAgcPiynJHdDW2Z+eut6QZiUsbIF9+S3T6u/tfLImw39dgSlCxupwLPHepxuiLOqyd08HeJGCZufg9WqRBVyLFM76uCIaPRP5wwAdx72GVjPcG2kh+2jjrt7fqtJOufJzCObtQgPgBqIvDiZCGoOM41OQMiqtF3w==";
        KeyInfo keyInfo = new KeyInfo(new X509Data("CN=user05", "MIIFqTCCBJG"));
        Signature signature = new Signature(signedInfo, SignatureValue, keyInfo);

        ed.setHeader(new Header(header, trList, signature));

        ed.addAttachment(new Attachment("209", "1896_QD-TTg_m_294779.doc", "1896_QD-TTg_m_294779.doc", new File("./resources/edoc.edxml")));
        Content content = EdXmlBuilder.build(ed, "SendDocument" + "." + header.getFrom().getOrganId(), "D:\\");

        return content;
    }

    public static Content create_status() {
        // create header
        Header header = new Header();
        MessageStatus msgStatus = new MessageStatus();

        //set ResponseFor Tag
        msgStatus.setResponseFor(new ResponseFor("000.00.00.G22", "7816/VPCP-TT??T", new Date(), "000.00.00.G22,2015/09/30,7816/VPCP-TT??T"));
        //set from information (organization)
        msgStatus.setFrom(new Organization(
                "000.00.00.H41",
                "UBND T???nh Ngh??? An",
                "UBND T???nh Ngh??? An",
                "S??? 03, ???????ng Tr?????ng Thi, Th??nh ph??? Vinh, T???nh Ngh??? An, Vi???t Nam", "nghean@gov.vn", "0383 840418", "0383 843049", "www.nghean.vn"
        ));

        //set status code info
        msgStatus.setStatusCode("01");
        msgStatus.setDescription("V??n th?? - Ph??ng V??n th?? - L??u tr???: ???? ?????n - Ph???n m???m QLVB ???? nh???n nh??ng v??n th?? ch??a x??? l??");
        msgStatus.setTimestamp(new Date());

        //set staff details
        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setDepartment("V??n th?? v??n ph??ng");
        staffInfo.setStaff("Nguy???n Th??? Ng???c Tr??m");
        staffInfo.setEmail("vanthuvanphong@gov.vn");
        staffInfo.setMobile("84912000001");
        msgStatus.setStaffInfo(staffInfo);

        // build status edxml

        Content content = null;
        try {
            content = StatusXmlBuilder.build(msgStatus, "");
        } catch (BuildException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return content;
    }
}
