import {
  Body,
  Controller,
  ForbiddenException,
  Get,
  Param,
  ParseIntPipe,
  Post,
  Req,
  UseGuards,
  ValidationPipe,
} from '@nestjs/common';
import { ReviewRateService } from './review_rate.service';
import { AuthGuard } from '@nestjs/passport';
import { IsCustomerGuard } from 'src/auth/guards';
import { Request } from 'express';
import { CreateReviewDto } from './dto/Create-Review.dto';

@Controller('review-rate')
export class ReviewRateController {
  constructor(private readonly reviewRate: ReviewRateService) {}

  @Get('technician/:id')
  @UseGuards(AuthGuard('jwt'), IsCustomerGuard)
  findAllTechnicianReviews(
    @Req() request: Request,
    @Param('id', ParseIntPipe) id: number,
  ) {
    const user = request.user;
    if (id === (user as { sub: number }).sub) {
      return this.reviewRate.findAllTechnicianReviews(id);
    } else {
      throw new ForbiddenException('Access denied to Unauthorized user');
    }
  }

  @Post('technician/:id')
  @UseGuards(AuthGuard('jwt'), IsCustomerGuard)
  createReview(
    @Body(ValidationPipe) review: CreateReviewDto,
    @Req() request: Request,
    @Param('id', ParseIntPipe) id: number,
  ) {
    const user = request.user;
    return this.reviewRate.createReview(review, user, id);
  }
}
