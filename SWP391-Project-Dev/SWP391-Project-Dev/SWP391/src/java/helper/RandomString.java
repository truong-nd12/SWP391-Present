/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.util.Random;

/**
 *
 * @author Dell
 */
public class RandomString {
    public static String generateRandomString() {
        String symbols = "!@#$%^&*";
        String numbers = "0123456789";
        String uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowercaseLetters = "abcdefghijklmnopqrstuvwxyz";
        StringBuilder randomString = new StringBuilder();
        Random random = new Random();
        randomString.append(symbols.charAt(random.nextInt(symbols.length())));
        randomString.append(numbers.charAt(random.nextInt(numbers.length())));
        randomString.append(uppercaseLetters.charAt(random.nextInt(uppercaseLetters.length())));
        for (int i = 0; i < 3; i++) {
            randomString.append(lowercaseLetters.charAt(random.nextInt(lowercaseLetters.length())));
        }
        char[] charArray = randomString.toString().toCharArray();
        for (int i = charArray.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            char temp = charArray[i];
            charArray[i] = charArray[j];
            charArray[j] = temp;
        }
        return new String(charArray);
    }
}
