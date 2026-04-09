import { mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";

const tokensPath = resolve("packages/brand/src/tokens.json");
const outputPath = resolve(
  "apps/ios/KAYO/Shared/Design/Generated/BrandTokens.swift",
);

const tokens = JSON.parse(readFileSync(tokensPath, "utf8"));

function hexToTuple(hex) {
  const clean = hex.replace("#", "");
  const value = parseInt(clean, 16);
  const r = (value >> 16) & 255;
  const g = (value >> 8) & 255;
  const b = value & 255;
  return [r, g, b];
}

const colorLines = Object.entries(tokens.colors)
  .map(([name, hex]) => {
    const [r, g, b] = hexToTuple(hex);
    return `    static let ${name} = BrandColor(red: ${r}, green: ${g}, blue: ${b})`;
  })
  .join("\n");

const swift = `// AUTO-GENERATED FILE. DO NOT EDIT.
// Source: packages/brand/src/tokens.json

import Foundation

struct BrandColor {
    let red: Int
    let green: Int
    let blue: Int
}

enum BrandTokens {
    enum Colors {
${colorLines}
    }

    enum Typography {
        static let display = "${tokens.typography.display}"
        static let displayFallback = "${tokens.typography.displayFallback}"
        static let sans = "${tokens.typography.sans}"
    }

    enum Copy {
        static let heroHeadline = "${tokens.copy.heroHeadline}"
        static let heroSubhead = "${tokens.copy.heroSubhead}"
        static let ctaLabel = "${tokens.copy.ctaLabel}"
    }
}
`;

mkdirSync(dirname(outputPath), { recursive: true });
writeFileSync(outputPath, swift);
console.log(`Generated ${outputPath}`);
