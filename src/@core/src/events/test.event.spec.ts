import { TestEvent } from "@ca/core/events/test.event";

describe("TestEvent Unit Test", () => {
  beforeAll(
    () =>
      (global.console = {
        ...console,
        log: jest.fn(),
      })
  );

  it("Starter a new TestEntity", () => {
    TestEvent.createTestEntity();
    expect(console.log).toBeCalledTimes(1);
  });
});
