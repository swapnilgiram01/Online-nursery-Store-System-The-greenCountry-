package com.project.online_nursery_store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.online_nursery_store.model.Status;

@Repository
public interface StatusRepository extends JpaRepository<Status, Long> {

}
