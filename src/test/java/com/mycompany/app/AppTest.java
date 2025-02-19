package com.mycompany.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class AppTest {
    @Test
    public void testAppConstructor() {
        App app = new App();
        assertNotNull(app);
    }

    @Test
    public void testAppMessage() {
        App app = new App();
        String message = app.getMessage();
        assertNotNull(message);
        assertEquals("Hello World!\nSubmission Proyek Membangun CI/CD Pipeline dengan Jenkins\nardi_supriyadi",
                message);
    }
}
