from fastapi import HTTPException
from app.repositories.appointment_repository import AppointmentRepository


class AppointmentService:

    def __init__(self, appointment_repo: AppointmentRepository):
        self.appointment_repo = appointment_repo


    def book_appointment(self, patient_id: int, data):

        conflict = self.appointment_repo.get_by_doctor_and_time(
            data.doctor_id,
            data.appointment_time
        )

        if conflict:
            raise HTTPException(status_code=400, detail="Slot already booked")

        return self.appointment_repo.create_appointment(
            patient_id=patient_id,
            doctor_id=data.doctor_id,
            appointment_time=data.appointment_time
        )


    def get_my_appointments(self, patient_id: int):

        return self.appointment_repo.get_by_patient(patient_id)
    
    

    def cancel_appointment_by_patient_id(self, appointment_id: int, patient_id: int):

        appointment = self.appointment_repo.get_by_id(appointment_id)

        if not appointment:
            raise HTTPException(status_code=404, detail="Appointment not found")

        #  Ownership check
        if appointment.patient_id != patient_id:
            raise HTTPException(status_code=403, detail="Not authorized")

        #  Business rules
        if appointment.status == "cancelled":
            raise HTTPException(status_code=400, detail="Already cancelled")

        if appointment.status == "completed":
            raise HTTPException(status_code=400, detail="Cannot cancel completed appointment")

        return self.appointment_repo.cancel_appointment_by_id(appointment_id)