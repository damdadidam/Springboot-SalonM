package com.m.salonM.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.m.salonM.model.Board;

public interface BoardRepository extends JpaRepository<Board,Integer> {

}
