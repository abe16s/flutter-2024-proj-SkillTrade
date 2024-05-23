import { CreateReviewDto } from './Create-Review.dto';
import { PartialType } from '@nestjs/mapped-types';
export class UpdateReviewDto extends PartialType(CreateReviewDto) {}
