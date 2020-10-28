package com.bkav.edoc.service.database.util;

import com.bkav.edoc.service.database.cache.UserCacheEntry;
import com.bkav.edoc.service.database.entity.User;
import com.bkav.edoc.service.database.services.UserService;

import java.util.List;

public class UserServiceUtil {
    private final static UserService USER_SERVICE = new UserService();

    public static UserCacheEntry getUserById(long userId) {
        return USER_SERVICE.getUserById(userId);
    }

    public static List<UserCacheEntry> getAllUsers() {
        return USER_SERVICE.getAllUsers();
    }

    public static List<UserCacheEntry> getUsers(boolean onSSO) {
        return USER_SERVICE.getUsers(onSSO);
    }

    public static User findUserById(long userId) {
        return USER_SERVICE.findUserById(userId);
    }

    public static void updateUser(User user) {
        USER_SERVICE.updateUser(user);
    }
}