package admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = {"admin", "user", "wardrobeManager"})
@EntityScan(basePackages = {"user", "wardrobeManager"})
@EnableJpaRepositories(basePackages = {"user", "wardrobeManager"})
@EnableJpaAuditing
public class ProjectClosetApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectClosetApplication.class, args);
	}

}
