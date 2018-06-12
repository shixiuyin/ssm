package com.hzit.dao;

import org.springframework.stereotype.Repository;

import com.hzit.bean.Users;

@Repository
public interface UserDao {

	Users findUsers(String username);

}
