package com.ujiuye.crmpro.common.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConveter implements Converter<String, Date> {


    @Override
    public Date convert(String time) {

        String pattern = "";
        if (time.contains("/")) {
            pattern = "yyyy/MM/dd";
        } else {
            pattern = "yyyy-MM-dd";
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        try {
            return simpleDateFormat.parse(time);
        } catch (ParseException e) {
            return null;
        }

    }
}
