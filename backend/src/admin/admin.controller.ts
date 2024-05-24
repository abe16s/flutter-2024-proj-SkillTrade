import {
  Controller,
  Param,
  Get,
  Patch,
  UseGuards,
  Body,
  ParseIntPipe,
  ValidationPipe,
  Req,
  ForbiddenException,
} from '@nestjs/common';

import { AuthGuard } from '@nestjs/passport';
import { IsAdminGuard } from 'src/auth/guards';
import { Request } from 'express';
import * as argon from 'argon2';
import { AdminService } from './admin.service';
import { AdminDto } from './dto/admin.dto';

@Controller('admin')
export class AdminController {
  constructor(private readonly adminService: AdminService) {}
  @Get(':id')
  @UseGuards(AuthGuard('jwt'))
  findAdminProfile(
    @Req() request: Request,
    @Param('id', ParseIntPipe) id: number,
  ) {
    // const user = request.user;
    // if (id === (user as { sub: number }).sub) {
    return this.adminService.findAdminProfile(id);
    // } else {
    //   throw new ForbiddenException('Access denied to Unauthorized user');
    // }
  }

  @Patch(':id')
  @UseGuards(AuthGuard('jwt'), IsAdminGuard)
  async updateAdminProfile(
    @Param('id', ParseIntPipe) id: number,
    @Req() request: Request,
    @Body(ValidationPipe) profileUpdate: AdminDto,
  ) {
    const user = request.user;
    if ('password' in profileUpdate) {
      const hash = await argon.hash(profileUpdate.password);
      profileUpdate.password = hash;
    }
    if (id === (user as { sub: number }).sub) {
      return this.adminService.updateAdminProfile(id, profileUpdate);
    } else {
      throw new ForbiddenException('Access denied to Unauthorized user');
    }
  }
}
