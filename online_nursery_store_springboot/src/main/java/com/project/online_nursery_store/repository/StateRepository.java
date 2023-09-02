package com.project.online_nursery_store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.online_nursery_store.model.State;

@Repository
public interface StateRepository extends JpaRepository<State, Long> {

}
