import type { Metadata } from "next";
import localFont from "next/font/local";
import { brandTokens } from "@kayo/brand";
import "./globals.css";

const gillKayo = localFont({
  src: "../public/generated/fonts/GillKayoCondensedPlain.woff",
  variable: "--font-kayo-display",
  display: "swap",
});

const appUrl = process.env.NEXT_PUBLIC_SITE_URL ?? "https://kayo.app";

export const metadata: Metadata = {
  title: "KAYO",
  description: brandTokens.copy.heroSubhead,
  metadataBase: new URL(appUrl),
  openGraph: {
    title: "KAYO",
    description: brandTokens.copy.heroSubhead,
    images: ["/generated/og-1200x630.png"],
  },
  icons: {
    icon: [
      { url: "/generated/favicon-32.png", sizes: "32x32", type: "image/png" },
    ],
    apple: [
      {
        url: "/generated/apple-touch-icon.png",
        sizes: "180x180",
        type: "image/png",
      },
    ],
  },
};

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en" className={gillKayo.variable}>
      <body>{children}</body>
    </html>
  );
}
