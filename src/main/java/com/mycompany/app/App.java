package com.mycompany.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {

    @GetMapping("/")
    public String home() {
        return "Hello World!<br>Submission Proyek Membangun CI/CD Pipeline dengan Jenkins<br>ardi_supriyadi";
    }

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
