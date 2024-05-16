import {
  Controller,
  ForbiddenException,
  Get,
  Param,
  ParseIntPipe,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ReviewRateService } from './review_rate.service';
import { AuthGuard } from '@nestjs/passport';
import { IsCustomerGuard } from 'src/auth/guards';
import { Request } from 'express';

@Controller('review-rate')
export class ReviewRateController {
  constructor(private readonly reviewRate: ReviewRateService) {}

  @Get('technician/:id')
  @UseGuards(AuthGuard('jwt'), IsCustomerGuard)
  findAllTechnicianBookings(
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
}
