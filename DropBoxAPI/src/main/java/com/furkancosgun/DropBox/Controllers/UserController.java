package com.furkancosgun.DropBox.Controllers;

import com.furkancosgun.DropBox.Request.UserRequest;
import com.furkancosgun.DropBox.Response.UserResponse;
import com.furkancosgun.DropBox.Services.UserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/api/auth")
public class UserController {
    @Autowired
    private UserSevice userSevice;

    @PostMapping("/login")
    public ResponseEntity<?> UserResponseLogin(@RequestBody UserRequest userResponse){
        return ResponseEntity.ok(userSevice.loginUser(userResponse));
    }

    @PostMapping("/register")
    public ResponseEntity<?> UserResponseRegister(@RequestBody UserRequest userResponse){
        return ResponseEntity.ok(userSevice.registerUser(userResponse));
    }

}
