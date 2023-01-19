import { Injectable } from '@nestjs/common';
import { TestEvent } from '@ca/core/events/test.event';

@Injectable()
export class AppService {
  getHello(): string {
    TestEvent.createTestEntity();
    return 'Hello World!';
  }
}
