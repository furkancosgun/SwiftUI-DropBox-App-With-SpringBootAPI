package com.furkancosgun.DropBox.Repositories;

import com.furkancosgun.DropBox.Entites.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepositories extends JpaRepository<User,Long> {

    User findByEmailAndPassword(String email, String password);

    User findByIdAndEmail(Long id, String email);
}
