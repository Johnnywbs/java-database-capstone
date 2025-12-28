package com.project.back_end.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "appointment")
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "doctor_id", nullable = false)
    @NotNull(message = "O médico é obrigatório")
    private Doctor doctor;

    @ManyToOne
    @JoinColumn(name = "patient_id", nullable = false)
    @NotNull(message = "O paciente é obrigatório")
    private Patient patient;

    @NotNull(message = "O horário do agendamento é obrigatório")
    @Future(message = "O horário do agendamento deve ser no futuro")
    private LocalDateTime appointmentTime;

    // 0 para Agendado, 1 para Concluído, 2 para Cancelado
    private int status;

    // --- Campos Extras (Bonus) ---

    @Size(max = 255, message = "O motivo da visita não pode exceder 255 caracteres")
    private String reasonForVisit;

    @Column(columnDefinition = "TEXT")
    private String notes;

    // --- Construtores ---
    public Appointment() {}

    // --- Métodos Auxiliares (@Transient) ---

    @Transient
    public LocalDateTime getEndTime() {
        if (appointmentTime == null) return null;
        return appointmentTime.plusHours(1);
    }

    @Transient
    public LocalDate getAppointmentDate() {
        if (appointmentTime == null) return null;
        return appointmentTime.toLocalDate();
    }

    @Transient
    public LocalTime getAppointmentTimeOnly() {
        if (appointmentTime == null) return null;
        return appointmentTime.toLocalTime();
    }

    // --- Getters e Setters ---

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Doctor getDoctor() { return doctor; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }

    public LocalDateTime getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(LocalDateTime appointmentTime) { this.appointmentTime = appointmentTime; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public String getReasonForVisit() { return reasonForVisit; }
    public void setReasonForVisit(String reasonForVisit) { this.reasonForVisit = reasonForVisit; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
