/* eslint-disable prettier/prettier */
import { IsEmail, IsOptional, IsString } from 'class-validator';


export class AdminDto {
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
}
