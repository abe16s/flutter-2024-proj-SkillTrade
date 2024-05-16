import { IsNumber, IsString, IsNotEmpty } from 'class-validator';

export class CreateReviewDto {
  @IsNumber()
  customerId: number;

  @IsNumber()
  technicianId: number;

  @IsString()
  @IsNotEmpty({ message: 'Cannot be empty' })
  review: string;

  @IsNumber()
  @IsNotEmpty({ message: 'Cannot be empty' })
  rate: number;
}
