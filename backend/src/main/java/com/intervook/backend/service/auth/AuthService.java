package com.intervook.backend.service.auth;

import com.intervook.backend.exception.CommonException;
import com.intervook.backend.model.dto.AuthDTO;
import com.intervook.backend.util.EmailValidationUtil;
import com.intervook.backend.util.HashUtil;
import com.intervook.core.enums.AuthProvider;
import com.intervook.mysql.entity.auth.Auth;
import com.intervook.mysql.repository.auth.AuthRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthService {
    private final PasswordEncoder passwordEncoder;
    private final AuthRepository authRepository;

    public Optional<Auth> getAuthByUid(String uid) {
        return authRepository.findByUid(uid);
    }

    public AuthDTO saveAuth(Authentication authentication) {
        OAuth2AuthenticationToken authToken = (OAuth2AuthenticationToken) authentication;

        AuthProvider provider = AuthProvider.valueOf(authToken.getAuthorizedClientRegistrationId().toUpperCase());
        AuthDTO authDTO = parseAuthResult(authToken.getPrincipal(), provider);

        Auth auth = authRepository.findByUid(authDTO.uid())
                .orElseGet(() -> {
                    authRepository.findByEmail(authDTO.email())
                            .ifPresent(ignored -> {
                                throw CommonException.ALREADY_REGISTERED_EMAIL;
                            });

                    return new Auth(authDTO.uid(), authDTO.email(), provider);
                });
        authRepository.save(auth);

        return authDTO;
    }

    public AuthDTO joinAuth(String email, String password, String nickname) {
        if (!EmailValidationUtil.validateEmail(email)) {
            throw CommonException.WRONG_EMAIL_FORMAT;
        }

        // hashing uid
        String hashedUid = hashingUid(AuthProvider.DEFAULT.getProviderName() + email);

        Auth auth = authRepository.findByUid(hashedUid)
                .orElseGet(() -> {
                    // password encrypt
                    String encryptedPassword = passwordEncoder.encode(password);

                    Auth newAuth = new Auth();
                    newAuth.setUid(hashedUid);
                    newAuth.setEmail(email);
                    newAuth.setProvider(AuthProvider.DEFAULT);
                    newAuth.setEncryptedPassword(encryptedPassword);

                    return newAuth;
                });

        // save auth
        authRepository.save(auth);

        return new AuthDTO(auth.getUid(), nickname, auth.getUid());
    }

    @SuppressWarnings("unchecked")
    private AuthDTO parseAuthResult(OAuth2User oAuth2User, AuthProvider authProvider) {
        try {
            String uid, email, nickname;
            switch (authProvider) {
                case NAVER -> {
                    Map<String, Object> responseMap = (Map<String, Object>) oAuth2User.getAttributes().get("response");

                    uid = authProvider.getProviderName() + responseMap.get("id").toString();
                    email = responseMap.get("email").toString();
                    nickname = responseMap.get("name").toString();
                }
                case KAKAO -> {
                    uid = authProvider.getProviderName() + oAuth2User.getAttributes().get("id").toString();
                    email = ((Map<String, Object>) oAuth2User.getAttributes().get("kakao_account")).get("email").toString();
                    nickname = ((Map<String, Object>) oAuth2User.getAttributes().get("properties")).get("nickname").toString();
                }
                default -> throw CommonException.SERVER_ERROR;
            }
            return new AuthDTO(hashingUid(uid), nickname, email);
        } catch (Exception e) {
            log.warn("[AuthService] Fail to login.", e);
            throw CommonException.SERVER_ERROR;
        }
    }

    private String hashingUid(String rawUid) {
        return HashUtil.sha256(rawUid);
    }
}
