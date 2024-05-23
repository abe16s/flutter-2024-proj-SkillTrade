import { Module } from '@nestjs/common';
import { ReviewRateService } from './review_rate.service';
import { ReviewRate } from './review_rate';
import { ReviewRateController } from './review_rate.controller';
import { AuthService } from 'src/auth/auth.service';
import { JwtService } from '@nestjs/jwt';

@Module({
  providers: [ReviewRateService, ReviewRate, AuthService, JwtService],
  controllers: [ReviewRateController],
})
export class ReviewRateModule {}
