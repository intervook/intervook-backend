package com.interviewhlepr.backend.repository;

import com.interviewhlepr.backend.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUid(String uid);

    Optional<User> findByNickname(String nickname);
}
