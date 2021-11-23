package com.bkav.edoc.web.util;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SendMessageTelegramUtil {
    private static final Logger LOGGER = Logger.getLogger(SendMessageTelegramUtil.class);

    public static void sendMessage(boolean logMode, String msg) throws IOException {
        String urlString = "https://api.telegram.org/bot%s/sendMessage";

        String result, chatId, token;

        if (logMode) {
            chatId = PropsUtil.get("telegram.message.chatid.log");
            token = PropsUtil.get("telegram.message.token.log");
        } else {
            chatId = PropsUtil.get("telegram.message.chatid");
            token = PropsUtil.get("telegram.message.token");
        }

        urlString = String.format(urlString, token);

        CloseableHttpClient httpclient = HttpClients.custom().build();

        try {
            HttpPost httpPost = new HttpPost(urlString);
            httpPost.addHeader("Content-type", "application/x-www-form-urlencoded");
            httpPost.addHeader("Accept-Charset", "UTF-8");

            /// Create list of parameters
            List<NameValuePair> nameValuePairs = new ArrayList<>();
            /// Add chatid to the list
            nameValuePairs.add(new BasicNameValuePair("chat_id", "-" + chatId));
            /// Add text to the list
            nameValuePairs.add(new BasicNameValuePair("text", msg));
            /// Set list of parameters as entity of the Http POST method
            httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "UTF-8"));

            CloseableHttpResponse response = httpclient.execute(httpPost);
            try {
                HttpEntity httpEntity = response.getEntity();
                if (httpEntity != null) {
                    result = EntityUtils.toString(httpEntity);
                    LOGGER.info(result);
                }
            } catch (Exception e) {
                LOGGER.error(Arrays.toString(e.getStackTrace()));
            } finally {
                response.close();
            }
        } catch (Exception e) {
            LOGGER.error(e);
        } finally {
            httpclient.close();
        }
    }
}
