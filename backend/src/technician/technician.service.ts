import { Injectable } from '@nestjs/common';
import { TechnicianDto } from './dto/technician.dto';
import { PrismaService } from 'src/prisma/prisma.service';

// import { Request } from 'express';

@Injectable()
export class TechnicianService {
  constructor(private readonly prisma: PrismaService) {}
  async findAllTechnicianProfiles() {
    const result = await this.prisma.technician.findMany({
      select: {
        id: true,
        fullName: true,
        skills: true,
        phone: true,
        experience: true,
        educationLevel: true,
        availableLocation: true,
        additionalBio: true,
        email: true,
        status: true,
      },
    });
    return result;
  }
  async findSuspendedTechnicianProfiles() {
    const result = await this.prisma.technician.findMany({
      where: {
        status: 'suspended',
      },
      select: {
        id: true,
        fullName: true,
        skills: true,
        phone: true,
        experience: true,
        educationLevel: true,
        availableLocation: true,
        additionalBio: true,
        email: true,
        status: true,
      },
    });
    return result;
  }
  async findPendingTechnicianProfiles() {
    const result = await this.prisma.technician.findMany({
      where: {
        status: 'pending',
      },
      select: {
        id: true,
        fullName: true,
        skills: true,
        phone: true,
        experience: true,
        educationLevel: true,
        availableLocation: true,
        additionalBio: true,
        email: true,
        status: true,
      },
    });
    return result;
  }
  async findTechnicianProfile(technicianId: number) {
    const result = await this.prisma.technician.findUnique({
      where: {
        id: technicianId,
      },
      select: {
        id: true,
        fullName: true,
        skills: true,
        phone: true,
        experience: true,
        educationLevel: true,
        availableLocation: true,
        additionalBio: true,
        email: true,
        status: true,
      },
    });
    return result;
  }

  async updateTechnicianProfile(
    technicianId: number,
    profileUpdate: TechnicianDto,
  ) {
    return await this.prisma.technician.update({
      where: {
        id: technicianId,
      },
      data: profileUpdate,
    });
  }
}
