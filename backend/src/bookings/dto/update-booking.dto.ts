import { CreateBookingDto } from './create-booking.dto';
import { PartialType } from '@nestjs/mapped-types';
export class UpdateBookingDto extends PartialType(CreateBookingDto) {}
