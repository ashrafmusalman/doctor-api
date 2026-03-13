# app/main.py
from fastapi import FastAPI
from app.database import engine, Base

# import models so SQLAlchemy registers them
from app.models.doctor_model import Doctor
from app.models.hospital_model import Hospital

from app.routers import auth_router, patient_router
from app.routers.admin import doctor_router

app = FastAPI(title="Hospital API")

Base.metadata.create_all(bind=engine)

app.include_router(auth_router.router)
app.include_router(patient_router.router)
app.include_router(doctor_router.router)