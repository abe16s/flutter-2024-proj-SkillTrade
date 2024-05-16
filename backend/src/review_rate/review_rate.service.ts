import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateReviewDto } from './dto/Create-Review.dto';

@Injectable()
export class ReviewRateService {
  constructor(private readonly prisma: PrismaService) {}

  async findAllTechnicianReviews(technicianId: number) {
    const result = await this.prisma.review.findMany({
      where: {
        technicianId: technicianId,
      },
      select: {
        rate: true,
        review: true,
        user: true,
      },
    });
    return result;
  }
  async findAllCustomerReviews(customerId: number) {
    const result = await this.prisma.review.findMany({
      where: {
        customerId: customerId,
      },
      select: {
        technician: true,
        rate: true,
        review: true,
      },
    });
    return result;
  }

  async createReview(dto: CreateReviewDto) {
    const newBooking = await this.prisma.review.create({
      data: {
        customerId: dto.customerId,
        technicianId: dto.technicianId,
        review: dto.review,
        rate: dto.rate,
      },
    });
    return newBooking;
  }

  //   async updateBooking(id: number, updatedBooking: UpdateBookingDto) {
  //     if ('serviceDate' in updatedBooking) {
  //       updatedBooking.serviceDate = new Date(updatedBooking.serviceDate);
  //     }
  //     return await this.prisma.booking.update({
  //       where: {
  //         id: id,
  //       },
  //       data: updatedBooking,
  //     });
  //   }

  async deleteBooking(id: number) {
    return await this.prisma.review.delete({
      where: {
        id: id,
      },
    });
  }
}
