package com.furkancosgun.DropBox.Entites;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.boot.autoconfigure.AutoConfiguration;

@Entity
@Table(name="User")
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //otomatik artan sayı
    long id;
    String email;
    String password;
}
