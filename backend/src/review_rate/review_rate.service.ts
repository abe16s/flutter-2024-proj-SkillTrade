import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateReviewDto } from './dto/Create-Review.dto';
import { UpdateReviewDto } from './dto/update-Review.dto';

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

  async createReview(dto: CreateReviewDto, customer, techId) {
    const newReview = await this.prisma.review.create({
      data: {
        customerId: customer.sub,
        technicianId: techId,
        review: dto.review,
        rate: dto.rate,
      },
    });
    return newReview;
  }

  async updateReview(id: number, updatedReview: UpdateReviewDto) {
    return await this.prisma.review.update({
      where: {
        id: id,
      },
      data: updatedReview,
    });
  }

  async deleteReview(id: number) {
    return await this.prisma.review.delete({
      where: {
        id: id,
      },
    });
  }
}
