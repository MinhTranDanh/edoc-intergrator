package com.bkav.edoc.service.commonutil;

import com.bkav.edoc.service.xml.base.header.Organization;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

public class ConvertDomainUtil {

    private static final Logger LOGGER = Logger.getLogger(ConvertDomainUtil.class);

    public List<Organization> convertToNewDomainFormat(List<Organization> organs) {
        List<Organization> newOrgans = new ArrayList<>();
        try {
            for (Organization organ : organs) {
                String[] subSpitDomain = organ.getOrganId().split("\\.");
                String newDomain = subSpitDomain[subSpitDomain.length - 1];
                for (int i = (subSpitDomain.length - 2); i >= 0; i--) {
                    int c = Integer.parseInt(subSpitDomain[i]);
                    if (c != 0) {
                        String str = Integer.toString(c);
                        newDomain += str;
                    }
                }
                organ.setOrganId(newDomain);
                newOrgans.add(organ);
            }
        } catch (Exception e) {
            LOGGER.error("Error when convert new domain send document to VPCP " + e);
        }
        return newOrgans;
    }

    public String convertToOlaDomainFormat(String newDomain) {


        return null;
    }
}
