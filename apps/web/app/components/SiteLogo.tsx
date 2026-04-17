import React from "react";
import Link from "next/link";

type SiteLogoProps = {
  className?: string;
  priority?: boolean;
};

export default function SiteLogo({ className, priority = false }: SiteLogoProps) {
  const classes = ["site-logo-link", className].filter(Boolean).join(" ");

  return (
    <Link href="/" className={classes} aria-label="Go to KAYO homepage">
      <span className="site-logo-wordmark" data-priority={priority ? "true" : "false"}>
        KAYO
      </span>
    </Link>
  );
}
