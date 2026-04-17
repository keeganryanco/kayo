import AppKit
import Foundation

guard CommandLine.arguments.count >= 6 else {
    fputs("Usage: render-wordmark.swift <output_path> <width> <height> <text> <hex_color>\n", stderr)
    exit(1)
}

let outputPath = CommandLine.arguments[1]
guard
    let width = Double(CommandLine.arguments[2]),
    let height = Double(CommandLine.arguments[3]),
    width > 0,
    height > 0
else {
    fputs("Invalid width/height\n", stderr)
    exit(1)
}

let text = CommandLine.arguments[4]
let hexColor = CommandLine.arguments[5]

func color(from hex: String) -> NSColor? {
    let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    guard cleaned.count == 6, let value = Int(cleaned, radix: 16) else {
        return nil
    }

    let red = CGFloat((value >> 16) & 0xFF) / 255.0
    let green = CGFloat((value >> 8) & 0xFF) / 255.0
    let blue = CGFloat(value & 0xFF) / 255.0
    return NSColor(calibratedRed: red, green: green, blue: blue, alpha: 1.0)
}

guard let textColor = color(from: hexColor) else {
    fputs("Invalid hex color: \(hexColor)\n", stderr)
    exit(1)
}

let canvasSize = NSSize(width: width, height: height)
guard let bitmap = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: Int(width),
    pixelsHigh: Int(height),
    bitsPerSample: 8,
    samplesPerPixel: 4,
    hasAlpha: true,
    isPlanar: false,
    colorSpaceName: .deviceRGB,
    bytesPerRow: 0,
    bitsPerPixel: 0
) else {
    fputs("Failed to create bitmap context\n", stderr)
    exit(1)
}

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmap)
defer { NSGraphicsContext.restoreGraphicsState() }

NSColor.clear.setFill()
NSBezierPath(rect: NSRect(origin: .zero, size: canvasSize)).fill()

let maxTextWidth = canvasSize.width * 0.94
let maxTextHeight = canvasSize.height * 0.86
var fontSize = canvasSize.height * 0.8
var measuredRect = NSRect.zero
var attributes: [NSAttributedString.Key: Any] = [:]

while fontSize > 10 {
    let font = NSFont.systemFont(ofSize: fontSize, weight: .medium)
    attributes = [
        .font: font,
        .foregroundColor: textColor,
        .kern: 0.6
    ]

    measuredRect = (text as NSString).boundingRect(
        with: NSSize(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        ),
        options: [.usesLineFragmentOrigin, .usesFontLeading],
        attributes: attributes
    )

    if measuredRect.width <= maxTextWidth && measuredRect.height <= maxTextHeight {
        break
    }
    fontSize -= 1
}

let drawRect = NSRect(
    x: 0,
    y: (canvasSize.height - measuredRect.height) / 2.0,
    width: measuredRect.width,
    height: measuredRect.height
)
(text as NSString).draw(in: drawRect, withAttributes: attributes)

guard let pngData = bitmap.representation(using: .png, properties: [:]) else {
    fputs("Failed to encode PNG\n", stderr)
    exit(1)
}

let outputURL = URL(fileURLWithPath: outputPath)
try FileManager.default.createDirectory(
    at: outputURL.deletingLastPathComponent(),
    withIntermediateDirectories: true,
    attributes: nil
)
try pngData.write(to: outputURL)
