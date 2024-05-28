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
import { TechnicianService } from './technician.service';
import { TechnicianDto } from './dto/technician.dto';
import { AuthGuard } from '@nestjs/passport';
import { IsAdminGuard, IsTechnicianGuard } from 'src/auth/guards';
import { Request } from 'express';
import * as argon from 'argon2';

@Controller('technician')
export class TechnicianController {
  constructor(private readonly technicianService: TechnicianService) {}
  @Get(':id')
  @UseGuards(AuthGuard('jwt'))
  findTechnicianProfile(
    @Req() request: Request,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.technicianService.findTechnicianProfile(id);
  }

  @Get()
  @UseGuards(AuthGuard('jwt'))
  findAllTechnicianProfiles() {
    return this.technicianService.findAllTechnicianProfiles();
  }

  @Get('suspended/all')
  @UseGuards(AuthGuard('jwt'), IsAdminGuard)
  findSuspendedTechnicianProfiles() {
    return this.technicianService.findSuspendedTechnicianProfiles();
  }

  @Get('pending/all')
  @UseGuards(AuthGuard('jwt'), IsAdminGuard)
  findPendingTechnicianProfiles() {
    return this.technicianService.findPendingTechnicianProfiles();
  }

  @Patch(':id')
  @UseGuards(AuthGuard('jwt'), IsTechnicianGuard)
  async updateTechnicianProfile(
    @Param('id', ParseIntPipe) id: number,
    @Req() request: Request,
    @Body(ValidationPipe) profileUpdate: TechnicianDto,
  ) {
    const user = request.user;
    if ('password' in profileUpdate) {
      const hash = await argon.hash(profileUpdate.password);
      profileUpdate.password = hash;
    }
    if (id === (user as { sub: number }).sub) {
      return this.technicianService.updateTechnicianProfile(id, profileUpdate);
    } else {
      throw new ForbiddenException('Access denied to Unauthorized user');
    }
  }
}
