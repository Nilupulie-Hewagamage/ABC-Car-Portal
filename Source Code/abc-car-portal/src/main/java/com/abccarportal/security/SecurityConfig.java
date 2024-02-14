package com.abccarportal.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	System.out.println("At Authen configure");
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	System.out.println("At Security configure");
        http
                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .failureUrl("/login_error")
                    .permitAll()
                    .defaultSuccessUrl("/cars", true)
                .and()
                .csrf()
                .and()
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    .antMatchers("/css/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                    .antMatchers(HttpMethod.GET, "/login").permitAll()
                    .antMatchers(HttpMethod.GET, "/cars").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/profile").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/car_detail").hasAnyRole("Users","Administrator")
                    .antMatchers(HttpMethod.GET, "/users").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/view").hasRole("Administrator")
                    .antMatchers(HttpMethod.POST, "/edit").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/delete").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/all_cars").hasRole("Administrator")
                    .antMatchers(HttpMethod.POST, "/edit_car").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/delete_car").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/deleteCar").hasRole("Users")
                .and()
                .logout()
                    .logoutSuccessUrl("/login")
                    .invalidateHttpSession(true);
                  
    }
}
