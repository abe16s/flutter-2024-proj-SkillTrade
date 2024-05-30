import {
  Body,
  Controller,
  Delete,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Query,
  UseGuards,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthDto } from './dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('trader')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('signup')
  signup(@Body() user: AuthDto) {
    return this.authService.signup(user);
  }

  @Post('signin')
  signin(@Body() dto: any) {
    console.log(dto, 'here');
    return this.authService.signin(dto);
  }

  @Patch('update-ps')
  changePassword(@Body() dto: any) {
    return this.authService.changePassword(dto);
  }

  @Delete('delete-profile/:id')
  @UseGuards(AuthGuard('jwt'))
  deleteUser(
    @Param('id', ParseIntPipe) id: number,
    @Query('role') role: string,
  ) {
    return this.authService.deleteUser(id, role);
  }
}
