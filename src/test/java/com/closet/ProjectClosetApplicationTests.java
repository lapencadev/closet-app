package com.closet;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.hamcrest.Matchers.contains;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
class ProjectClosetApplicationTests {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void obtenerListaColores() throws Exception{

		String[] expectedColours = {
				"Aguamarina", "Amarillo", "Azul claro", "Azul oscuro", "Blanco",
				"Dorado", "Fucsia", "Lila oscuro", "Marrón", "Mostaza",
				"Multicolor", "Naranja", "Negro", "Plateado", "Rojo",
				"Rosa palo", "Teja", "Transparente", "Verde claro", "Verde oscuro", "Violeta claro"
		};

		mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/colours")
				.contentType(MediaType.APPLICATION_JSON))
				.andExpect(content().contentType(MediaType.APPLICATION_JSON))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$").isArray())
				.andExpect(jsonPath("$.length()").value(expectedColours.length))
				.andExpect(jsonPath("$[*].nombre").value(contains(expectedColours)));
	}

	@Test
	void contextLoads() {
	}

}
