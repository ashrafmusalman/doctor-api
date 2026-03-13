# app/schemas/appointment_schema.py

from pydantic import BaseModel, Field, field_validator
from datetime import datetime
from enum import Enum


class AppointmentStatus(str, Enum):
    booked = "booked"
    cancelled = "cancelled"
    completed = "completed"


class AppointmentCreate(BaseModel):
    doctor_id: int = Field(gt=0)
    appointment_time: datetime

    @field_validator("appointment_time")
    def validate_appointment_time(cls, value):
        if value <= datetime.now():
            raise ValueError("Appointment time must be in the future")
        return value


class AppointmentResponse(BaseModel):
    id: int
    patient_id: int
    doctor_id: int
    appointment_time: datetime
    status: AppointmentStatus

    class Config:
        from_attributes = True