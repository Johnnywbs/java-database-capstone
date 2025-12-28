package com.project.back_end.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "patients")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "O nome é obrigatório")
    @Size(min = 3, max = 100, message = "O nome deve ter entre 3 e 100 caracteres")
    private String name;

    @NotNull(message = "O email é obrigatório")
    @Email(message = "Forneça um endereço de email válido")
    private String email;

    @NotNull(message = "A senha é obrigatória")
    @Size(min = 6, message = "A senha deve ter pelo menos 6 caracteres")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY) // Segurança: esconde a senha no JSON de resposta
    private String password;

    @NotNull(message = "O telefone é obrigatório")
    @Pattern(regexp = "\\d{10}", message = "O número de telefone deve ter exatamente 10 dígitos")
    private String phone;

    @NotNull(message = "O endereço é obrigatório")
    @Size(max = 255, message = "O endereço não pode exceder 255 caracteres")
    private String address;

    // Construtor Padrão (Obrigatório para JPA)
    public Patient() {
    }

    // --- Getters e Setters ---

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
