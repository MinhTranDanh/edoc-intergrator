package com.bkav.edoc.service.commonutil;

import com.bkav.edoc.service.xml.base.header.Organization;
import org.apache.log4j.Logger;
import sun.invoke.empty.Empty;

import java.util.ArrayList;
import java.util.Arrays;
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

    static String convertToOlaDomainFormat(String newDomain) {
        String[] split = newDomain.split("\\.");
        String[] subNewDomain = {"0", "0", "0", "0"};

        for (int i = 0; i < split.length; i++) {
            subNewDomain[i] = split[i];
        }
        for (int i = subNewDomain.length - 1; i >= 1; i--) {
            if (i == 3) {
                while (subNewDomain[i].length() < 3) {
                    subNewDomain[i] = "0" + subNewDomain[i];
                }
            } else {
                while (subNewDomain[i].length() < 2) {
                    subNewDomain[i] = "0" + subNewDomain[i];
                }
            }
        }
        String OldDomain = "";
        for (int i = subNewDomain.length - 1; i >= 0; i--) {
            OldDomain = OldDomain + subNewDomain[i];
            if (i > 0) {
                OldDomain = OldDomain + ".";
            }
        }
        return OldDomain;
    }

    public static void main(String[] args) {
        String newDomain = "G01.11.1.111";
        System.out.println(convertToOlaDomainFormat(newDomain));
    }
}
