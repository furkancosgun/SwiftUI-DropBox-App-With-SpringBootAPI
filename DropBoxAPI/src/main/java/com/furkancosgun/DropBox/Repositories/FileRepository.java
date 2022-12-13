package com.furkancosgun.DropBox.Repositories;

import com.furkancosgun.DropBox.Entites.File;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface FileRepository  extends JpaRepository<File, Long> {
    Optional<File> findByName(String name);

    List<File> findByUserId(long id);

}