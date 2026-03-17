from sqlalchemy.orm import Session
from app.models.appointment_model import Appointment


class AppointmentRepository:

    def __init__(self, db: Session):
        self.db = db


    def create_appointment(self, patient_id: int, doctor_id: int, appointment_time):

        appt = Appointment(
            patient_id=patient_id,
            doctor_id=doctor_id,
            appointment_time=appointment_time,
            status="booked"
        )

        self.db.add(appt)
        self.db.commit()
        self.db.refresh(appt)

        return appt


#     INSERT INTO appointments (patient_id, doctor_id, appointment_time, status)
# VALUES (2, 7, '2026-03-25 14:00:00', 'booked');


    def get_by_patient(self, patient_id: int):
        return self.db.query(Appointment).filter(Appointment.patient_id == patient_id).all()


# SELECT *
# FROM appointments
# WHERE patient_id = 1;


    def get_by_doctor_and_time(self, doctor_id: int, time):

        return self.db.query(Appointment).filter(
            Appointment.doctor_id == doctor_id,
            Appointment.appointment_time == time,
            Appointment.status == "booked"
        ).first()


#         SELECT *
# FROM appointments
# WHERE doctor_id = 5
# AND appointment_time = '2026-03-20 10:00:00'
# AND status = 'booked'
# LIMIT 1;


    def cancel_appointment_by_id(self, appointment_id: int):
        appointment = self.db.query(Appointment).filter(Appointment.id == appointment_id).first()

        if not appointment:
            return None

        appointment.status = "cancelled"
        self.db.commit()
        self.db.refresh(appointment)

        return appointment
    
    
    def get_by_id(self, appointment_id: int):
     return self.db.query(Appointment).filter(Appointment.id == appointment_id).first()