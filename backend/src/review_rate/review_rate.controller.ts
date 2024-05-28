import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Patch,
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
import { UpdateReviewDto } from './dto/update-Review.dto';

@Controller('review-rate')
export class ReviewRateController {
  constructor(private readonly reviewRate: ReviewRateService) {}

  @Get('technician/:id')
  @UseGuards(AuthGuard('jwt'))
  findAllTechnicianReviews(
    @Req() request: Request,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.reviewRate.findAllTechnicianReviews(id);
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

  @Patch(':id')
  @UseGuards(AuthGuard('jwt'))
  updateReview(
    @Param('id', ParseIntPipe) id: number,
    @Body(ValidationPipe) reviewUpdate: UpdateReviewDto,
  ) {
    return this.reviewRate.updateReview(id, reviewUpdate);
  }

  @Delete(':id')
  @UseGuards(AuthGuard('jwt'), IsCustomerGuard)
  deleteReview(@Param('id', ParseIntPipe) id: number) {
    return this.reviewRate.deleteReview(id);
  }
}
