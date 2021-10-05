package com.bkav.edoc.web.util.ExcelService;

import com.bkav.edoc.service.database.entity.EdocDynamicContact;
import com.bkav.edoc.service.database.entity.User;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Base64;
import java.util.concurrent.TimeUnit;

public class PostUserToSSO {
    private static final Logger LOGGER = Logger.getLogger(PostUserToSSO.class);

    public static String getBase64Encode(String userName, String password) {
        LOGGER.info("Get Base64Encode ...");
        String str = userName + ":" + password;
        return Base64.getEncoder().encodeToString(str.getBytes());
    }

    public static int postUser(String base64Encode, String url, String json)
            throws IOException, NoSuchAlgorithmException, KeyManagementException, KeyStoreException, InterruptedException {

        //String strBase64 = PostUserToSSO.getBase64Encode(userName, password);
        int result = -1;
        SSLContextBuilder builder = new SSLContextBuilder();
        builder.loadTrustMaterial(null, new TrustSelfSignedStrategy());
        SSLConnectionSocketFactory sslConnectionSocketFactory = new SSLConnectionSocketFactory(
                builder.build());
        CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(
                sslConnectionSocketFactory).build();
        try {
            HttpPost httpPost = new HttpPost(url);
            StringEntity entity = new StringEntity(json);
            httpPost.setEntity(entity);
            httpPost.setHeader("Authorization", "Basic " + base64Encode);
            httpPost.setHeader("Content-Type", "application/scim+json");
            SSLContext ctx = SSLContext.getInstance("TLS");
            ctx.init(new KeyManager[0], new TrustManager[]{new DefaultTrustManager()}, new SecureRandom());
            SSLContext.setDefault(ctx);
            TimeUnit.MILLISECONDS.sleep(500);
            CloseableHttpResponse response = httpclient.execute(httpPost);
            try {
                result = response.getStatusLine().getStatusCode();

                LOGGER.info("Successfully post user to sso server " + result);

                /*HttpEntity httpEntity = response.getEntity();

                if (httpEntity != null) {
                    result = EntityUtils.toString(httpEntity);
                }*/
            } catch (Exception e) {
                LOGGER.error("Error post user to sso server cause " + Arrays.toString(e.getStackTrace()));
            } finally {
                response.close();
            }
        } catch (Exception e) {
            LOGGER.error("Error post user to sso server cause ", e);
        } finally {
            httpclient.close();
        }
        return result;
    }

    private static class DefaultTrustManager implements X509TrustManager {

        @Override
        public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
        }

        @Override
        public void checkServerTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }

    public static String createJson(User user) {
        LOGGER.info("Convert user to json " + user);
        JSONObject json = new JSONObject();
        JSONObject name = new JSONObject();
        name.put("givenName", user.getUsername());
        JSONArray email = new JSONArray();
        email.put(user.getEmailAddress());
        JSONObject organization = new JSONObject();
        organization.put("organization", user.getDynamicContact().getDomain());
        json.put("name",name);
        json.put("emails",email);
        json.put("userName",user.getUsername().trim());
        json.put("password",user.getPassword().trim());
        json.put("urn:ietf:params:scim:schemas:extension:enterprise:2.0:User",organization);
        return json.toString();
    }

    public static void main(String[] args) throws KeyManagementException, NoSuchAlgorithmException, KeyStoreException, IOException {
        User user = new User();
        user.setDisplayName("Văn phòng");
        user.setEmailAddress("vpubnd@lamdong.gov.vn");
        user.setPassword("123@456aA");
        user.setUsername("vpubnd");
        EdocDynamicContact dynamicContact = new EdocDynamicContact();
        dynamicContact.setDomain("000.00.01.H36");
        user.setDynamicContact(dynamicContact);
        String json = createJson(user);
        //String out = postUser("admin", "123abc@A", "https://iam.lamdong.gov.vn/scim2/Users", json);
        //System.out.println(out);
    }
}
