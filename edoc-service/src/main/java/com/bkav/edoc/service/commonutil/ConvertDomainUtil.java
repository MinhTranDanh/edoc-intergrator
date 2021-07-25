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
                        newDomain += "." + str;
                    }
                }
                organ.setOrganId(newDomain);
                newOrgans.add(organ);
            }
        } catch (Exception e) {
            LOGGER.error("Lenght of domain is 0 !!!");
        }
        return newOrgans;
    }

    public static void main(String[] args) {
        String oldDomain = "G11.07.05";
        String[] spiltDomain = oldDomain.split("\\.");
        //System.out.println(rvereseArray(spiltDomain, 0 , spiltDomain.length - 1));
        //System.out.println(convertToOlaDomainFormat(oldDomain));
    }

    public String convertToOlaDomainFormat(String newDomain) {
        String[] splitDomain = newDomain.split("\\.");
        revereseArray(splitDomain, 0, splitDomain.length - 1);
        String oldDomain = "";
        int l = splitDomain.length;

        switch (l) {
            case 1:
                oldDomain += "000.00.00." + splitDomain[0];
                break;
            case 2:
                oldDomain += "000.00";
                for (int i = 0; i < l; i++) {
                    if (i == l - 1) {
                        oldDomain += "." + splitDomain[i];
                        break;
                    }
                    if (Integer.parseInt(splitDomain[i]) > 99) {
                        LOGGER.error("-----> Invalid domain format " + newDomain);
                        break;
                    }
                    if (Integer.parseInt(splitDomain[i]) > 10) {
                        oldDomain += "." + splitDomain[i];
                    } else {
                        oldDomain += ".0" + splitDomain[i];
                    }
                }
                break;
            case 3:
                oldDomain += "000";
                for (int i = 0; i < l; i++) {
                    if (i == l - 1) {
                        oldDomain += "." + splitDomain[i];
                        break;
                    }
                    if (Integer.parseInt(splitDomain[i]) > 99) {
                        LOGGER.error("-----> Invalid domain format " + newDomain);
                        break;
                    }
                    if (Integer.parseInt(splitDomain[i]) > 10) {
                        oldDomain += "." + splitDomain[i];
                    } else {
                        oldDomain += ".0" + splitDomain[i];
                    }
                }
                break;
            case 4:
                for (int i = 0; i < l; i++) {
                    if (i == l - 1) {
                        oldDomain += "." + splitDomain[i];
                        break;
                    }
                    if (i == 0) {
                        if (Integer.parseInt(splitDomain[i]) > 999) {
                            LOGGER.error("-----> Invalid domain format " + newDomain);
                            break;
                        }
                        if (Integer.parseInt(splitDomain[i]) > 100) {
                            oldDomain += splitDomain[i];
                        } else if (Integer.parseInt(splitDomain[i]) > 10) {
                            oldDomain += "0" + splitDomain[i];
                        } else {
                            oldDomain += "00" + splitDomain[i];
                        }
                    } else {
                        if (Integer.parseInt(splitDomain[i]) > 99) {
                            LOGGER.error("-----> Invalid domain format " + newDomain);
                            break;
                        }
                        if (Integer.parseInt(splitDomain[i]) > 10) {
                            oldDomain += "." + splitDomain[i];
                        } else {
                            oldDomain += ".0" + splitDomain[i];
                        }
                    }
                }
                break;
            default:
                LOGGER.error("----> Invalid domain format with " + newDomain);
                oldDomain = newDomain;
                break;
        }

        return oldDomain;
    }

    private void revereseArray(String arr[], int start, int end) {
        String temp = "";

        while (start < end) {
            temp = arr[start];
            arr[start] = arr[end];
            arr[end] = temp;
            start++;
            end--;
        }
    }
}
