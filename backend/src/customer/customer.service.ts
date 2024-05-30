import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CustomerDto } from './dto/customer.dto';

@Injectable()
export class CustomerService {
  constructor(private readonly prisma: PrismaService) {}
  async findCustomerProfile(customerId: number) {
    const result = await this.prisma.user.findUnique({
      where: {
        id: customerId,
      },
    });
    return result;
  }

  async findAllCustomersProfiles() {
    const result = await this.prisma.user.findMany({
      select: {
        id: true,
        fullName: true,
        phone: true,
        email: true,
      },
    });
    return result;
  }

  async updateCustomerProfile(customerId: number, profileUpdate: CustomerDto) {
    try {
      return await this.prisma.user.update({
        where: {
          id: customerId,
        },
        data: profileUpdate,
      });
    } catch {
      throw new NotFoundException('No user With the Specified Data');
    }
  }

  async deleteCustomerProfile(customerId: number) {
    try {
      return await this.prisma.user.delete({
        where: {
          id: customerId,
        },
      });
    } catch (error) {
      throw new BadRequestException('Something Went wrong');
    }
  }
}
