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