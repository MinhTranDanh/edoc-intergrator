package com.bkav.edoc.web.controller;


import com.bkav.edoc.service.database.services.EdocPriorityService;
import com.bkav.edoc.service.database.util.HibernateUtil;
import com.bkav.edoc.service.util.PropsUtil;
import com.bkav.edoc.web.payload.Response;
import com.bkav.edoc.web.util.MessageSourceUtil;
import org.apache.http.client.methods.HttpGet;
import org.hibernate.Cache;
import org.hibernate.Hibernate;
import org.hibernate.cache.ehcache.internal.util.HibernateEhcacheUtils;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.apache.log4j.Logger;
import org.hibernate.cfg.Environment;


import java.io.FileReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

@RestController
public class DynamicConfigController {
    private final MessageSourceUtil messageSourceUtil;

    public DynamicConfigController(MessageSourceUtil messageSourceUtil) {
        this.messageSourceUtil = messageSourceUtil;
    }
    private final static EdocPriorityService EDOC_PRIORITY_SERVICE = new EdocPriorityService();
    @RequestMapping(value = "/config/dynamic",
    method = RequestMethod.POST, //
    produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<Response> config(@RequestParam("url") String url) {

        List<String> errors = new ArrayList<>();
        Response response;
        Properties properties=new Properties();
        System.out.println(url);
            try {
                PropertiesConfiguration config = new PropertiesConfiguration("/home/huynq/edoc_/edoc-integrator/edoc-service/src/main/resources/config.properties");
                config.setAutoSave(true);
                config.setProperty("hibernate.connection.url",url);

                response = new Response(200, errors, messageSourceUtil.getMessage("edoc.config.success", null));
                return new ResponseEntity<>(response, HttpStatus.OK);

            } catch (Exception e) {
                    LOGGER.error("Not re-send document cause " + e);
                response = new Response(500, errors, messageSourceUtil.getMessage("edoc.config.fail", null));
                return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
            }finally {
                PropsUtil.removeProperty();
                HibernateUtil.removeSessionFactory();
                com.bkav.edoc.web.util.PropsUtil.removeProperty();
            }

    }
    private static final Logger LOGGER = Logger.getLogger(DocumentRestController.class);
}
