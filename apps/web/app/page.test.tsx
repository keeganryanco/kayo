import React from "react";
import { render, screen } from "@testing-library/react";
import HomePage from "./page";

describe("HomePage", () => {
  it("renders headline and CTA", () => {
    render(<HomePage />);

    expect(
      screen.getByRole("heading", { name: /knock out your screen time/i }),
    ).toBeInTheDocument();
    expect(
      screen.getByRole("link", { name: /get on the app store/i }),
    ).toBeInTheDocument();
  });
});
