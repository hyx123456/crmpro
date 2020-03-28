package com.ujiuye.crmpro.common.utils;

import java.util.UUID;

public class UUIDUtils {

    public static String getID() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replace("-", "");
    }
}
