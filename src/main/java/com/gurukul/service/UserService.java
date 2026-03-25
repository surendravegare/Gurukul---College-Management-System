package com.gurukul.service;

import com.gurukul.model.User;
import java.util.Optional;

public interface UserService {
    Optional<User> findByEmail(String email);
    void saveUser(User user);
	void deleteUser(Long id);
}