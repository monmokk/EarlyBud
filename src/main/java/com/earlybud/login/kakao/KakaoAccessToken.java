package com.earlybud.login.kakao;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoAccessToken {
	public static JsonNode getKakaoAccessToken(String code) {
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", "e6572958e72ab54e8d05db03cfd4ac7e"));
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/earlybud/oauth"));
        postParams.add(new BasicNameValuePair("code", code));
        
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        
        JsonNode returnNode = null;
        
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
         
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
            
            System.out.println("[POST accessToken] " + RequestUrl + ", response code : " + responseCode);
            System.out.println("[POST accessToken] parameters : " + postParams);
            
            //JSON형태 반환 값 정리
            ObjectMapper mapper = new ObjectMapper();
            
            returnNode = mapper.readTree(response.getEntity().getContent());
            
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
 
        }
        return returnNode;
    }
}
