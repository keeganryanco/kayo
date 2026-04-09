import React from "react";
import { brandTokens } from "@kayo/brand";
import SiteLogo from "./components/SiteLogo";

const appStoreUrl = process.env.NEXT_PUBLIC_APP_STORE_URL ?? "#";

export default function HomePage() {
  return (
    <main className="landing">
      <section className="hero" aria-labelledby="hero-title">
        <div className="hero-inner">
          <SiteLogo className="hero-logo" priority />
          <h1 id="hero-title">{brandTokens.copy.heroHeadline}</h1>
          <p className="subhead">{brandTokens.copy.heroSubhead}</p>
          <a className="cta" href={appStoreUrl}>
            {brandTokens.copy.ctaLabel}
          </a>
        </div>
      </section>
    </main>
  );
}
