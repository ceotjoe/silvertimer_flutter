#!/usr/bin/env python3
"""Renders design/social-preview/social-preview.png (1280x640, GitHub social preview).

Usage: python3 design/social-preview/build.py   (needs Pillow, macOS Helvetica Neue)
"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFilter, ImageFont

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).with_name("social-preview.png")
S = 2  # supersampling factor
W, H = 1280 * S, 640 * S
FONT = "/System/Library/Fonts/HelveticaNeue.ttc"


def font(size, bold=False):
    return ImageFont.truetype(FONT, size * S, index=1 if bold else 0)


def rounded_mask(size, radius):
    m = Image.new("L", size, 0)
    ImageDraw.Draw(m).rounded_rectangle((0, 0, *size), radius, fill=255)
    return m


icon = Image.open(ROOT / "assets/images/icon.png").convert("RGBA")

# Background: dark slate gradient plus a blurred, darkened copy of the icon as glow.
bg = Image.new("RGB", (W, H))
px = ImageDraw.Draw(bg)
for x in range(W):
    t = x / W
    px.line((x, 0, x, H), fill=(int(14 + 14 * t), int(22 + 22 * t), int(38 + 40 * t)))
glow = icon.resize((H, H)).filter(ImageFilter.GaussianBlur(90 * S)).convert("RGB")
glow = Image.eval(glow, lambda v: int(v * 0.45))
glow_full = Image.new("RGB", (W, H), (0, 0, 0))
glow_full.paste(glow, (W - H, 0))
fade = Image.new("L", (W, H), 0)
fd = ImageDraw.Draw(fade)
for x in range(W - H, W):
    fd.line((x, 0, x, H), fill=int(255 * 0.9 * ((x - (W - H)) / H) ** 1.5))
bg = Image.composite(glow_full, bg, fade)
canvas = bg.convert("RGBA")

# Icon.
isz = 190 * S
ix, iy = 72 * S, 84 * S
icon_r = icon.resize((isz, isz), Image.LANCZOS)
shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
ImageDraw.Draw(shadow).rounded_rectangle(
    (ix, iy + 12 * S, ix + isz, iy + isz + 12 * S), isz * 0.225, fill=(0, 0, 0, 150)
)
canvas = Image.alpha_composite(canvas, shadow.filter(ImageFilter.GaussianBlur(18 * S)))
canvas.paste(icon_r, (ix, iy), rounded_mask((isz, isz), int(isz * 0.225)))

# Text.
d = ImageDraw.Draw(canvas)
d.text((72 * S, 306 * S), "SilverTimer", font=font(86, True), fill="white")
sub = font(32)
d.text((72 * S, 412 * S), "Colloidal silver electrolysis", font=sub, fill=(200, 212, 235))
d.text((72 * S, 454 * S), "timer & calculator", font=sub, fill=(200, 212, 235))

# Platform chips.
chips = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
d = ImageDraw.Draw(chips)
cx = 72 * S
for label in ("iOS", "Android", "Web", "macOS"):
    f = font(22)
    tw = d.textlength(label, font=f)
    pw = int(tw + 36 * S)
    d.rounded_rectangle((cx, 530 * S, cx + pw, 530 * S + 44 * S), 22 * S,
                        fill=(255, 255, 255, 28), outline=(255, 255, 255, 70), width=S)
    d.text((cx + 18 * S, 530 * S + 22 * S), label, font=f, fill="white", anchor="lm")
    cx += pw + 12 * S
canvas = Image.alpha_composite(canvas, chips)

# Phones (bleed off the bottom edge).
shots = ROOT / "fastlane/screenshots/en-US/iPhone_17_Pro_Max"
for name, x, y in (("01_calculator.png", 716, 112), ("02_timer.png", 1000, 76)):
    pw = 262 * S
    shot = Image.open(shots / name).convert("RGBA")
    shot = shot.resize((pw, int(shot.height * pw / shot.width)), Image.LANCZOS)
    m = rounded_mask(shot.size, 34 * S)
    sh = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    sh.paste((0, 0, 0, 170), (x * S, (y + 14) * S), m)
    canvas = Image.alpha_composite(canvas, sh.filter(ImageFilter.GaussianBlur(20 * S)))
    frame = Image.new("RGBA", (shot.width + 8 * S, shot.height + 8 * S), (0, 0, 0, 0))
    ImageDraw.Draw(frame).rounded_rectangle((0, 0, *frame.size), 38 * S, fill=(8, 10, 16, 255))
    canvas.alpha_composite(frame, (x * S - 4 * S, y * S - 4 * S))
    canvas.paste(shot, (x * S, y * S), m)

canvas.convert("RGB").resize((1280, 640), Image.LANCZOS).save(OUT, optimize=True)
print(OUT, OUT.stat().st_size // 1024, "KiB")
