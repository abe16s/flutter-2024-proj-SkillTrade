/* eslint-disable prettier/prettier */
import { IsEmail, IsEnum, IsOptional, IsString } from 'class-validator';

enum Status {
  DECLINED = 'declined',
  ACCEPTED = 'accepted',
  PENDING = 'pending',
  SUSPENDED = 'suspended'
}
export class TechnicianDto {
  @IsString()
  @IsOptional()
  fullName: string;

  @IsString()
  @IsOptional()
  phone: string;

  @IsOptional()
  @IsString()
  role: string;

  @IsEmail()
  @IsOptional()
  email: string;

  @IsString()
  @IsOptional()
  password: string;

  @IsEnum(Status, { message: 'Status is not valid' })
  status: Status;


  @IsString()
  @IsOptional()
  skills: string;

  @IsString()
  @IsOptional()
  experience: string;

  @IsString()
  @IsOptional()
  educationLevel: string;

  @IsString()
  @IsOptional()
  availableLocation: string;

  @IsString()
  @IsOptional()
  additionalBio: string;
}
