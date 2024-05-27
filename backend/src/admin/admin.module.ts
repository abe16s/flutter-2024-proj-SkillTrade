import { Module } from '@nestjs/common';
import { AdminController } from './admin.controller';
import { Admin } from './admin';
import { AdminService } from './admin.service';
import { AuthService } from 'src/auth/auth.service';
import { JwtService } from '@nestjs/jwt';

@Module({
  controllers: [AdminController],
  providers: [Admin, AdminService, AuthService, JwtService],
})
export class AdminModule {}
