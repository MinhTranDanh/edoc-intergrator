package com.bkav.edoc.service.util;

import org.apache.log4j.Logger;
import org.apache.neethi.All;
import sun.invoke.empty.Empty;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropsUtil {

    private static final Logger LOGGER = Logger.getLogger(PropsUtil.class);
    private static Properties prop = new Properties();

    public static Properties readPropertyFile() throws Exception {
        if (prop.isEmpty()) {
            InputStream input = PropsUtil.class.getClassLoader().getResourceAsStream("config.properties");
            try {
                prop.load(input);
            } catch (IOException ex) {
                LOGGER.error(ex);
                throw ex;
            } finally {
                if (input != null) {
                    input.close();
                }
            }
        }
        return prop;
    }

    public static Properties removeProperty() {
        prop= new Properties();

        return prop;
    }

    public static String get(String key) {
        if (prop.isEmpty()) {
            try {
                prop = readPropertyFile();
            } catch (Exception e) {
                LOGGER.error(e);
            }
        }
        return prop.getProperty(key);
    }
}
