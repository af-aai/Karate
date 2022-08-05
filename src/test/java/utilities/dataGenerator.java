package utilities;

import com.github.javafaker.Faker;
import com.github.javafaker.PhoneNumber;

import java.util.HashMap;
import java.util.Map;

public class dataGenerator {

    public static String randomPhoneNumber() {
        Faker faker = new Faker();
        String phoneNumber= faker.number().digits(10);
        return phoneNumber;
    }

    public static Map<String,Object> createRequestBodyWithRandomPhoneNumber(){
        Faker faker = new Faker();
//        {
//            "dialCode": "+49",
//                "phoneNumber": "7421234567",
//                "name": "Thies",
//                "aboveAgeRestriction": true
//        }

        String RandomphoneNumber= faker.number().digits(10);
        Map<String,Object> GeneratedrequestBody = new HashMap<>();
        GeneratedrequestBody.put("dialCode","+49");
        GeneratedrequestBody.put("phoneNumber",RandomphoneNumber);
        GeneratedrequestBody.put("name","Thies");
        GeneratedrequestBody.put("aboveAgeRestriction",true);
        return GeneratedrequestBody;

    }


    // for further reference, in mobile testing framework javaFaker class


    }


