package com.bkav.edoc.web.controller;

import com.bkav.edoc.service.database.cache.DocumentCacheEntry;
import com.bkav.edoc.service.database.entity.*;
import com.bkav.edoc.service.database.util.*;
import com.bkav.edoc.service.mineutil.Mapper;
import com.bkav.edoc.service.xml.base.util.DateUtils;
import com.bkav.edoc.service.xml.status.header.MessageStatus;
import com.bkav.edoc.web.util.ExcelUtil;
import com.bkav.edoc.web.util.PropsUtil;
import com.vpcp.services.model.FullUnit;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;



import com.bkav.edoc.service.commonutil.Checker;
import com.bkav.edoc.service.commonutil.ConvertDomainUtil;
import com.bkav.edoc.service.commonutil.XmlChecker;
import com.bkav.edoc.service.database.cache.AttachmentCacheEntry;
import com.bkav.edoc.service.database.entity.EdocDocument;
import com.bkav.edoc.service.database.entity.EdocDynamicContact;
import com.bkav.edoc.service.database.entity.EdocTrace;
import com.bkav.edoc.service.database.services.*;
import com.bkav.edoc.service.kernel.util.GetterUtil;
import com.bkav.edoc.service.memcached.MemcachedKey;
import com.bkav.edoc.service.memcached.MemcachedUtil;
import com.bkav.edoc.service.mineutil.*;
import com.bkav.edoc.service.redis.RedisKey;
import com.bkav.edoc.service.redis.RedisUtil;
import com.bkav.edoc.service.resource.EdXmlConstant;
import com.bkav.edoc.service.resource.StringPool;
import com.bkav.edoc.service.util.CommonUtil;
import com.bkav.edoc.service.util.ResponseUtil;
import com.bkav.edoc.service.vpcp.ServiceVPCP;
import com.bkav.edoc.service.xml.base.attachment.Attachment;
import com.bkav.edoc.service.xml.base.header.Error;
import com.bkav.edoc.service.xml.base.header.*;
import com.bkav.edoc.service.xml.base.util.DateUtils;
import com.bkav.edoc.service.xml.ed.Ed;
import com.bkav.edoc.service.xml.ed.header.MessageHeader;
import com.bkav.edoc.service.xml.status.header.MessageStatus;
import com.vpcp.services.model.SendEdocResult;
import org.apache.axiom.soap.SOAPEnvelope;
import org.apache.axis2.AxisFault;
import org.apache.log4j.Logger;
import org.apache.synapse.ManagedLifecycle;
import org.apache.synapse.MessageContext;
import org.apache.synapse.SynapseLog;
import org.apache.synapse.core.SynapseEnvironment;
import org.apache.synapse.core.axis2.Axis2MessageContext;
import org.apache.synapse.mediators.AbstractMediator;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayInputStream;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;

@RestController
public class PublicStatRestController {

    private final Mapper mapper = new Mapper();

    @RequestMapping(value = "/public/-/stat/detail", produces = {MediaType.APPLICATION_JSON_VALUE})
    public List<EPublicStat> getStatDetail(@RequestParam(value = "fromDate", required = false) String fromDate,
                                           @RequestParam(value = "toDate", required = false) String toDate,
                                           @RequestParam(value = "keyword", required = false) String keyword) {
        boolean isGetAllAgency = false;
        if (keyword == null) {
            if (fromDate == null || toDate == null) {
                return EdocDailyCounterServiceUtil.getStatsDetail(null, null, null, isGetAllAgency);
            } else {
                Date fromDateValue = DateUtils.parse(fromDate);
                Date toDateValue = DateUtils.parse(toDate);
                return EdocDailyCounterServiceUtil.getStatsDetail(fromDateValue, toDateValue, null, isGetAllAgency);
            }
        } else {
            if (fromDate == null || toDate == null) {
                return EdocDailyCounterServiceUtil.getStatsDetail(null, null, keyword, isGetAllAgency);
            } else {
                Date fromDateValue = DateUtils.parse(fromDate);
                Date toDateValue = DateUtils.parse(toDate);
                return EdocDailyCounterServiceUtil.getStatsDetail(fromDateValue, toDateValue, keyword, isGetAllAgency);
            }
        }
    }

    @GetMapping(value = "/public/-/document/stat", produces = {MediaType.APPLICATION_JSON_VALUE})
    public EPublic getStat() {
        return EdocDailyCounterServiceUtil.getStat();
    }

    @RequestMapping(value = "/public/-/statistic/chart", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> getSentReceivedForChart(@RequestParam(value = "year", required = false) String year_str,
                                                          @RequestParam(value = "userId", required = false) String userId) {
        String results = "";
        int year = Integer.parseInt(year_str);
        Long id = new Long(userId);
        User user = UserServiceUtil.findUserById(id);
        if (user == null) {
            LOGGER.error("Not found user with id " + id + " !!!!!!!!!!!!!");
            //results = EdocDailyCounterServiceUtil.getSentReceivedForChart(year, "");
        } else {
            if (user.getUsername().equals(PropsUtil.get("user.admin.username"))) {
                results = EdocDailyCounterServiceUtil.getSentReceivedForChart(year, "");
            } else if (user.getDynamicContact().getDomain().equals(com.bkav.edoc.service.util.PropsUtil.get("edoc.domain.vpubnd.0"))) {
                results = EdocDailyCounterServiceUtil.getSentReceivedForChart(year, user.getDynamicContact().getDomain());
                //moreResults = EdocDailyCounterServiceUtil.getSentReceivedForChart(year, GetterUtil.getString(com.bkav.edoc.service.util.PropsUtil.get("edoc.domain.vpubnd.1")));
            } else {
                results = EdocDailyCounterServiceUtil.getSentReceivedForChart(year, user.getDynamicContact().getDomain());
            }
        }
        if (results.length() > 0)
            return new ResponseEntity<>(results, HttpStatus.OK);
        return new ResponseEntity<>(results, HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/public/-/statistic/detail", produces = {MediaType.APPLICATION_JSON_VALUE})
    public List<EdocStatisticDetail> getStatisticDetail(@RequestParam(value = "fromDate", required = false) String fromDate,
                                                        @RequestParam(value = "toDate", required = false) String toDate,
                                                        @RequestParam(value = "userId") String userId) {

        Long id = new Long(userId);
        User user = UserServiceUtil.findUserById(id);
        if (user == null) {
            LOGGER.error("Not found user with id " + id + " !!!!!!!!!!!!!");
        } else {
            if (user.getUsername().equals(PropsUtil.get("user.admin.username"))) {
                // get all data in range of date.
            } else {
                // get data of organ in range of date
            }
        }
        return null;
    }

    @GetMapping(value = "/public/-/document/attachments")
    public ResponseEntity<List<Long>> getAttachmentIds(@RequestParam("docCode") String docCode) {
        if (docCode == null || docCode.equals("")) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        } else {
            EdocDocument document = EdocDocumentServiceUtil.getDocumentByCode(docCode);
            if (document == null) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            } else {
                Set<EdocAttachment> attachments = document.getAttachments();
                if (attachments.size() > 0) {
                    List<Long> attachmentIds = attachments.stream().map(EdocAttachment::getAttachmentId).collect(Collectors.toList());
                    return new ResponseEntity<>(attachmentIds, HttpStatus.OK);
                } else {
                    return new ResponseEntity<>(HttpStatus.ACCEPTED);
                }
            }
        }
    }

    @RequestMapping(value = "/public/-/document/attachment/{attachmentId}", method = RequestMethod.GET)
    public ResponseEntity<InputStreamResource> downloadAttachment(@PathVariable Long attachmentId, HttpServletRequest request) throws IOException {
        HttpHeaders responseHeader = new HttpHeaders();
        try {
            if (attachmentId == null) {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            } else {
                EdocAttachment attachment = EdocAttachmentServiceUtil.findById(attachmentId);

                if (attachment == null) {
                    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
                }

                String specPath = attachment.getFullPath();
                LOGGER.info("Spec Path " + specPath);

                String fullPath = PropsUtil.get("edxml.attachment.dir");

                String filePath = fullPath + "/attachment/" + specPath;

                LOGGER.info("File Path " + filePath);

                File file = new File(filePath);

                byte[] data = FileUtils.readFileToByteArray(file);

                String filename = URLEncoder.encode(attachment.getName(),
                        StandardCharsets.UTF_8.toString()).replaceAll("\\+", "%20");
                // Set mimeType response
                responseHeader.setContentType(MediaType.APPLICATION_OCTET_STREAM);

                // Config information file response
                responseHeader.set("Content-disposition", "attachment; filename=" + filename);
                responseHeader.setContentLength(data.length);
                InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));
                InputStreamResource inputStreamResource = new InputStreamResource(inputStream);
                return new ResponseEntity<>(inputStreamResource, responseHeader, HttpStatus.OK);
            }
        } catch (
                Exception e) {
            LOGGER.error("Error process download file with attachmentId " + attachmentId + " cause " + e.getMessage());
            return new ResponseEntity<>(null, responseHeader, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @RequestMapping(value = "/public/-/document/trace",
            method = RequestMethod.GET, //
            produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public ResponseEntity<DocumentCacheEntry> getDocument(@RequestParam String docCode, @RequestParam String organ,  @RequestParam(value = "Date", required = false) String Date) {
        try {
            DocumentCacheEntry document = EdocDocumentServiceUtil.getDocumentByCodeAndDomain(docCode, organ);
            if (document != null) {
                return new ResponseEntity<>(document, HttpStatus.OK);
            }
        } catch (Exception e) {
            LOGGER.error(e);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }

    @RequestMapping(value = "/public/-/dailycounter/converter", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public HttpStatus dailycounterConvert(@RequestParam(value = "fromDate", required = false) String fromDate,
                                          @RequestParam(value = "toDate", required = false) String toDate) {
        if (fromDate != null && toDate != null) {
            Date fromDateValue = DateUtils.parse(fromDate);
            Date toDateValue = DateUtils.parse(toDate);
            EdocDocumentServiceUtil.getDailyCounterDocument(fromDateValue, toDateValue);
            return HttpStatus.OK;
        }
        return HttpStatus.BAD_REQUEST;
    }

    @RequestMapping(value = "/public/-/stat/export/excel", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public void exportToExcel(HttpServletResponse response,
                              @RequestParam(value = "fromDate", required = false) String fromDate,
                              @RequestParam(value = "toDate", required = false) String toDate,
                              @RequestParam(value = "keyword", required = false) String keyword,
                              @RequestParam(value = "arr", required = false) List<Integer> arr
    ) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";

        if (fromDate == null || toDate == null) {
            String headerValue = "attachment; filename=ThongKeVanBan.xlsx";
            response.setHeader(headerKey, headerValue);
            ExcelUtil.exportExcelDailyCounter(response, null, null, null, arr);
        } else {
            Date fromDateValue = DateUtils.parse(fromDate);
            Date toDateValue = DateUtils.parse(toDate);
            String headerValue = "attachment; filename=ThongKeVanBan_" + DateUtils.format(fromDateValue, DateUtils.VN_DATE_FORMAT_D)
                    + "-" + DateUtils.format(toDateValue, DateUtils.VN_DATE_FORMAT_D) + ".xlsx";
            response.setHeader(headerKey, headerValue);
            ExcelUtil.exportExcelDailyCounter(response, fromDateValue, toDateValue, keyword, arr);
        }
    }


    private static final Logger LOGGER = Logger.getLogger(PublicStatRestController.class);
}
