// C:\dev\projects\transfer-scheduler\backend\src\main\java\com\example\backend\controller\HomeController.java
package com.example.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "✅ Backend is up and running!";
    }
}
