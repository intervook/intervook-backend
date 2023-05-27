package com.interviewhlepr.backend.service.auth;


import com.interviewhlepr.backend.model.dto.AuthDTO;
import com.interviewhlepr.backend.model.entity.User;
import com.interviewhlepr.backend.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component
@RequiredArgsConstructor
public class SimpleAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    private final UserService userService;
    private final AuthService authService;
    private final ManageAuthService manageAuthService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        String targetUrl;
        try {
            AuthDTO authDTO = authService.saveAuth(authentication);
            User user = userService.syncUser(authDTO.uid(), authDTO.nickname());

            if (!user.isBlock()) {
                targetUrl = manageAuthService.getAuthUrl();
                manageAuthService.transferAuth(request, response, authDTO.uid());
            } else {
                targetUrl = manageAuthService.getAuthFailureUrl(Map.of("error", "block_user"));
                manageAuthService.clearAuth(request, response);
            }
        } catch (Exception e) {
            logger.warn("fail to oauth login.", e);
            targetUrl = manageAuthService.getAuthFailureUrl(Map.of("error", e.getMessage()));
        }

        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
}

