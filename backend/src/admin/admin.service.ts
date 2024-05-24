import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AdminDto } from './dto/admin.dto';

@Injectable()
export class AdminService {
  constructor(private readonly prisma: PrismaService) {}
  async findAdminProfile(adminId: number) {
    const result = await this.prisma.admin.findUnique({
      where: {
        id: adminId,
      },
      select: {
        fullName: true,
        phone: true,
        email: true,
      },
    });
    return result;
  }

  async updateAdminProfile(adminId: number, profileUpdate: AdminDto) {
    return await this.prisma.technician.update({
      where: {
        id: adminId,
      },
      data: profileUpdate,
    });
  }
}
