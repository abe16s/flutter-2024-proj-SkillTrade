import { Module } from '@nestjs/common';
import { AdminController } from './admin.controller';
import { Admin } from './admin';

@Module({
  controllers: [AdminController],
  providers: [Admin]
})
export class AdminModule {}
