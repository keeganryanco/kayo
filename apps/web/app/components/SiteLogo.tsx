import React from "react";
import Image from "next/image";
import Link from "next/link";

type SiteLogoProps = {
  className?: string;
  priority?: boolean;
};

export default function SiteLogo({ className, priority = false }: SiteLogoProps) {
  const classes = ["site-logo-link", className].filter(Boolean).join(" ");

  return (
    <Link href="/" className={classes} aria-label="Go to KAYO homepage">
      <Image
        src="/generated/icons/logo-1552.png"
        alt="KAYO logo"
        width={96}
        height={96}
        priority={priority}
        className="site-logo-image"
      />
    </Link>
  );
}
