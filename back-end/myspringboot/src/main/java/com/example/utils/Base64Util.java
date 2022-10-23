package com.example.utils;

/**
 * @Author
 * @Date2022/10/7 10:06
 * @PackageName: ${PACKAGE.NAME}
 * @Description:
 * @Version 1.0
 */
import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class Base64Util {
    // encrypt


    public static String encode(byte[] bytes) {
        try {
            return new String(Base64.getEncoder().encode(bytes), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String encode(String str) {
        try {
            byte[] b = null;
            String s = null;
            b = str.getBytes("utf-8");

            if (b != null) {
                s = new String(Base64.getEncoder().encode(b), "utf-8");
            }
            return s;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    // decrypt
    public static String decode(String s) {
        byte[] b = null;
        String result = null;
        if (s != null) {
            try {
                b = Base64.getDecoder().decode(s);
                result = new String(b, "utf-8");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
