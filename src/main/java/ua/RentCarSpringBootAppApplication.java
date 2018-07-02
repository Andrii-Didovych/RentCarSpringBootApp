package ua;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import ua.entity.Brand;


@SpringBootApplication
@ImportAutoConfiguration(classes = WebMvcAutoConfiguration.class)
public class RentCarSpringBootAppApplication extends WebMvcConfigurerAdapter {

	public static void main(String[] args) {
		SpringApplication.run(RentCarSpringBootAppApplication.class, args);
	}

	@Value("${file.path}")
	private String path;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/*").addResourceLocations("file:"+path+"/");
		registry.addResourceHandler("/profile/img/*").addResourceLocations("file:"+path+"/");
		super.addResourceHandlers(registry);
	}
}
