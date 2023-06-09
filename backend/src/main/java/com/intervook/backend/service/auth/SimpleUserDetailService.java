package com.intervook.backend.service.auth;

import com.intervook.backend.exception.CommonException;
import com.intervook.backend.util.EmailValidationUtil;
import com.intervook.mysql.entity.auth.Auth;
import com.intervook.mysql.repository.auth.AuthRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class SimpleUserDetailService implements UserDetailsService {
    private final AuthRepository authRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        if (!EmailValidationUtil.validateEmail(email)) {
            throw CommonException.WRONG_EMAIL_FORMAT;
        }

        Auth auth = authRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Email is not existed. " + email));
        return new User(auth.getUid(), auth.getEncryptedPassword(), Collections.emptyList());
    }
}
