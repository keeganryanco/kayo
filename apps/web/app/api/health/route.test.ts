import { GET } from "./route";

describe("GET /api/health", () => {
  it("returns healthy status payload", async () => {
    const res = await GET();
    expect(res.status).toBe(200);

    const payload = await res.json();
    expect(payload).toEqual({ status: "ok", service: "kayo-web" });
  });
});
