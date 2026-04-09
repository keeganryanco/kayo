import AppKit
import Foundation
import CoreGraphics

let args = CommandLine.arguments

guard args.count >= 4 else {
    fputs("Usage: swift scripts/flatten-alpha.swift <input> <output> <hexWithoutHash>\n", stderr)
    exit(1)
}

let inputPath = args[1]
let outputPath = args[2]
let hex = args[3]

guard let image = NSImage(contentsOfFile: inputPath) else {
    fputs("Unable to open input image: \(inputPath)\n", stderr)
    exit(1)
}

guard let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    fputs("Unable to decode CGImage: \(inputPath)\n", stderr)
    exit(1)
}

let width = cgImage.width
let height = cgImage.height

func component(_ start: Int) -> CGFloat {
    let index = hex.index(hex.startIndex, offsetBy: start)
    let next = hex.index(index, offsetBy: 2)
    let pair = String(hex[index..<next])
    let value = Int(pair, radix: 16) ?? 0
    return CGFloat(value) / 255.0
}

guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB) else {
    fputs("Failed to create color space\n", stderr)
    exit(1)
}

guard let context = CGContext(
    data: nil,
    width: width,
    height: height,
    bitsPerComponent: 8,
    bytesPerRow: 0,
    space: colorSpace,
    bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
) else {
    fputs("Failed to create CoreGraphics context\n", stderr)
    exit(1)
}

context.setFillColor(
    red: component(0),
    green: component(2),
    blue: component(4),
    alpha: 1
)
context.fill(CGRect(x: 0, y: 0, width: width, height: height))
context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))

guard let flattened = context.makeImage() else {
    fputs("Failed to render flattened image\n", stderr)
    exit(1)
}

let rep = NSBitmapImageRep(cgImage: flattened)

guard let data = rep.representation(using: .png, properties: [:]) else {
    fputs("Failed to encode PNG\n", stderr)
    exit(1)
}

do {
    try data.write(to: URL(fileURLWithPath: outputPath))
} catch {
    fputs("Failed to write output: \(error.localizedDescription)\n", stderr)
    exit(1)
}
