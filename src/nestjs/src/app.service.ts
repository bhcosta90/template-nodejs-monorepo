import { Injectable } from '@nestjs/common';
import { Test } from '@ca/core/entity/test.entity';

@Injectable()
export class AppService {
  getHello(): string {
    new Test();
    return 'Hello World!';
  }
}
