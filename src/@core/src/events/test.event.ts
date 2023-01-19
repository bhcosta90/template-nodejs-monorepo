import { Test } from "@ca/core/entity/test.entity";

export class TestEvent {
  static createTestEntity(): Test {
    return new Test();
  }
}
