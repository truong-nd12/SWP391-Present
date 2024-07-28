/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Currency;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class helper {
//    public static void main(String[] args) {
//        int amount = 123456789; // Replace with your integer value
//        String formattedAmount = convertToVietnameseDong(amount);
//        System.out.println(formattedAmount);
//    }

    public static String convertToVietnameseDong(int amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency vietnameseDong = Currency.getInstance("VND");
        currencyFormatter.setCurrency(vietnameseDong);
        return currencyFormatter.format(amount);
    }

    public static String convertVNDtoUSD(double priceVND) {
        DecimalFormat decimalFormat = new DecimalFormat("#.00");
        double priceUSD = priceVND / 23000;
        String roundedValue = decimalFormat.format(priceUSD);
        return roundedValue;
    }

    public static String convertToVietnameseDong1(double amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency vietnameseDong = Currency.getInstance("VND");
        currencyFormatter.setCurrency(vietnameseDong);
        return currencyFormatter.format(amount);
    }

    public static String convertToVietnameseDong(String amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency vietnameseDong = Currency.getInstance("VND");
        currencyFormatter.setCurrency(vietnameseDong);
        return currencyFormatter.format(amount);
    }

    public static String convertDateToString(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }

    public static String getCurrentDateAsString() {
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return currentDate.format(dateFormatter);
    }

    public static int convertToInteger(String dongString) {
        String numericString = dongString.replaceAll("[^\\d.-]", "");
        int dongAmount = Integer.parseInt(numericString);
        return dongAmount;
    }

    public static double convertVndToDouble(String vndString) {
        // Remove decimal point and currency symbol
        String cleanedString = vndString.replaceAll("\\.", "").replaceAll("đ", "");

        // Convert to double
        double result = Double.parseDouble(cleanedString);

        return result;
    }

    public static double convertToDouble(String dongString) {
        String numericString = dongString.replaceAll("[^\\d.]", "");
        double dongAmount = Double.parseDouble(numericString);
        return dongAmount * 1000;
    }


}
