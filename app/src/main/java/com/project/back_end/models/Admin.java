package com.project.back_end.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "admin") // Define explicitamente o nome da tabela
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "username não pode ser nulo")
    private String username;

    @NotNull(message = "password não pode ser nulo")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) // Oculta a senha nas respostas da API
    private String password;

    // Construtor Padrão (Obrigatório para o JPA)
    public Admin() {
    }

    // Construtor com argumentos (Opcional, mas útil)
    public Admin(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // --- Getters e Setters ---

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
