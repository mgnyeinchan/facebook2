package com.fb.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fb.demo.entity.Users;

public interface UsersRepository extends JpaRepository<Users, Integer> {

}
