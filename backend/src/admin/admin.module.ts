import { Module } from '@nestjs/common';
import { AdminController } from './admin.controller';
import { Admin } from './admin';
import { AdminService } from './admin.service';

@Module({
  controllers: [AdminController],
  providers: [Admin, AdminService]
})
export class AdminModule {}
