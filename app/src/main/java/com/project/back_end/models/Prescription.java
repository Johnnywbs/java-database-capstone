package com.project.back_end.models;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Min;

@Document(collection = "prescriptions")
public class Prescription {

    @Id
    private String id;

    @NotNull(message = "O nome do paciente é obrigatório")
    @Size(min = 3, max = 100, message = "O nome deve ter entre 3 e 100 caracteres")
    private String patientName;

    @NotNull(message = "O ID da consulta é obrigatório")
    private Long appointmentId;

    @NotNull(message = "O medicamento é obrigatório")
    @Size(min = 3, max = 100, message = "O nome do medicamento deve ter entre 3 e 100 caracteres")
    private String medication;

    @NotNull(message = "A dosagem é obrigatória")
    @Size(min = 3, max = 20, message = "A dosagem deve ter entre 3 e 20 caracteres")
    private String dosage;

    @Size(max = 200, message = "As notas do médico não podem exceder 200 caracteres")
    private String doctorNotes;

    // --- Campos Extras (Bonus) ---

    @Min(value = 0, message = "O número de refis não pode ser negativo")
    private Integer refillCount;

    private String pharmacyName;

    // --- Construtores ---
    public Prescription() {}

    public Prescription(String patientName, Long appointmentId, String medication, String dosage) {
        this.patientName = patientName;
        this.appointmentId = appointmentId;
        this.medication = medication;
        this.dosage = dosage;
    }

    // --- Getters e Setters ---

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public Long getAppointmentId() { return appointmentId; }
    public void setAppointmentId(Long appointmentId) { this.appointmentId = appointmentId; }

    public String getMedication() { return medication; }
    public void setMedication(String medication) { this.medication = medication; }

    public String getDosage() { return dosage; }
    public void setDosage(String dosage) { this.dosage = dosage; }

    public String getDoctorNotes() { return doctorNotes; }
    public void setDoctorNotes(String doctorNotes) { this.doctorNotes = doctorNotes; }

    public Integer getRefillCount() { return refillCount; }
    public void setRefillCount(Integer refillCount) { this.refillCount = refillCount; }

    public String getPharmacyName() { return pharmacyName; }
    public void setPharmacyName(String pharmacyName) { this.pharmacyName = pharmacyName; }
}
