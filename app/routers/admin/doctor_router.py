from fastapi import APIRouter, Depends

from app.dependencies.role_dependency import admin_required
from app.dependencies.doctor_dependency import get_doctor_service

from app.services.doctor_service import DoctorService
from app.schemas.doctor_schema import DoctorCreate, DoctorResponse


router = APIRouter(prefix="/admin/doctors", tags=["Admin - Doctors"])


@router.post("/", response_model=DoctorResponse)
def create_doctor(
    data: DoctorCreate,
    admin = Depends(admin_required),
    doctor_service: DoctorService = Depends(get_doctor_service)
):

    return doctor_service.create_doctor(data)


@router.get("/{doctor_id}", response_model=DoctorResponse)
def get_doctor(
    doctor_id: int,
    admin = Depends(admin_required),
    doctor_service: DoctorService = Depends(get_doctor_service)
):

    return doctor_service.get_doctor(doctor_id)


@router.put("/{doctor_id}", response_model=DoctorResponse)
def update_doctor(
    doctor_id: int,
    data: DoctorCreate,
    admin = Depends(admin_required),
    doctor_service: DoctorService = Depends(get_doctor_service)
):

    return doctor_service.update_doctor(doctor_id, data)


@router.delete("/{doctor_id}")
def delete_doctor(
    doctor_id: int,
    admin = Depends(admin_required),
    doctor_service: DoctorService = Depends(get_doctor_service)
):

    doctor_service.delete_doctor(doctor_id)

    return {"detail": "deleted"}