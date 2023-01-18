import { Test } from "./test.entity";

describe("TestEntity Unit Test", () => {
  beforeAll(
    () =>
      (global.console = {
        ...console,
        log: jest.fn(),
      })
  );

  it("Constructor", () => {
    const entity = new Test();
    expect(entity).toBeInstanceOf(Test);
    expect(console.log).toBeCalledTimes(1);
  });
});
