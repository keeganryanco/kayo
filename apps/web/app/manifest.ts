import type { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "KAYO",
    short_name: "KAYO",
    description: "Knock out your screen time.",
    start_url: "/",
    display: "standalone",
    background_color: "#F3C95E",
    theme_color: "#F3C95E",
    icons: [
      {
        src: "/generated/icons/icon-192.png",
        sizes: "192x192",
        type: "image/png",
      },
      {
        src: "/generated/icons/icon-512.png",
        sizes: "512x512",
        type: "image/png",
      },
    ],
  };
}
