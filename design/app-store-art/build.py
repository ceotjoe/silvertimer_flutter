#!/usr/bin/env python3
"""Renders the App Store product page header (3840x1646) and search results (3840x2560)
artwork, EN and DE, into design/app-store-art/. Opaque RGB PNGs, as App Store Connect
requires. Same look as design/social-preview/build.py.

Usage: python3 design/app-store-art/build.py   (needs Pillow, macOS Helvetica Neue)
"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFilter, ImageFont

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
FONT = "/System/Library/Fonts/HelveticaNeue.ttc"
WHITE, SUBTLE = (255, 255, 255), (200, 212, 235)

TEXT = {
    "en": {
        "sub": ("Colloidal silver electrolysis", "timer & calculator"),
        "header_tag": ("Know exactly", "how long."),
        "search_head": ("Know exactly", "how long."),
        "search_sub": ("Electrolysis time from volume,", "current & PPM."),
        "shots": "en-US",
    },
    "de": {
        "sub": ("Timer & Rechner für die", "Kolloidal-Silber-Elektrolyse"),
        "header_tag": ("Genau wissen,", "wie lange."),
        "search_head": ("Genau wissen,", "wie lange."),
        "search_sub": ("Elektrolysezeit aus Volumen,", "Strom & PPM."),
        "shots": "de-DE",
    },
}


def font(size, bold=False):
    return ImageFont.truetype(FONT, size, index=1 if bold else 0)


def rounded_mask(size, radius):
    m = Image.new("L", size, 0)
    ImageDraw.Draw(m).rounded_rectangle((0, 0, *size), radius, fill=255)
    return m


def background(w, h, icon):
    bg = Image.new("RGB", (w, h))
    px = ImageDraw.Draw(bg)
    for x in range(w):
        t = x / w
        px.line((x, 0, x, h), fill=(int(14 + 14 * t), int(22 + 22 * t), int(38 + 40 * t)))
    side = h
    glow = icon.resize((256, 256)).filter(ImageFilter.GaussianBlur(20)).resize((side, side))
    glow = Image.eval(glow.convert("RGB"), lambda v: int(v * 0.45))
    glow_full = Image.new("RGB", (w, h), (0, 0, 0))
    glow_full.paste(glow, (w - side, 0))
    fade = Image.new("L", (w, h), 0)
    fd = ImageDraw.Draw(fade)
    for x in range(w - side, w):
        fd.line((x, 0, x, h), fill=int(255 * 0.9 * ((x - (w - side)) / side) ** 1.5))
    return Image.composite(glow_full, bg, fade).convert("RGBA")


def paste_icon(canvas, icon, x, y, size):
    ic = icon.resize((size, size), Image.LANCZOS)
    shadow = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    ImageDraw.Draw(shadow).rounded_rectangle(
        (x, y + size // 15, x + size, y + size + size // 15), size * 0.225, fill=(0, 0, 0, 150)
    )
    canvas = Image.alpha_composite(canvas, shadow.filter(ImageFilter.GaussianBlur(size // 10)))
    canvas.paste(ic, (x, y), rounded_mask((size, size), int(size * 0.225)))
    return canvas


def header(lang, icon):
    w, h = 3840, 1646
    t = TEXT[lang]
    canvas = background(w, h, icon)
    # Lockup centred so crops on narrow devices cannot clip it.
    isz = 640
    ix, iy = 640, (h - isz) // 2
    canvas = paste_icon(canvas, icon, ix, iy, isz)
    d = ImageDraw.Draw(canvas)
    tx = ix + isz + 140
    d.text((tx, 400), "SilverTimer", font=font(250, True), fill=WHITE)
    d.text((tx + 8, 710), t["sub"][0], font=font(84), fill=SUBTLE)
    d.text((tx + 8, 810), t["sub"][1], font=font(84), fill=SUBTLE)
    d.text((tx + 8, 1010), t["header_tag"][0], font=font(120, True), fill=WHITE)
    d.text((tx + 8, 1150), t["header_tag"][1], font=font(120, True), fill=(120, 190, 255))
    return canvas


def search(lang, icon):
    w, h = 3840, 2560
    t = TEXT[lang]
    canvas = background(w, h, icon)
    canvas = paste_icon(canvas, icon, 390, 330, 380)
    d = ImageDraw.Draw(canvas)
    d.text((390, 960), t["search_head"][0], font=font(250, True), fill=WHITE)
    d.text((390, 1230), t["search_head"][1], font=font(250, True), fill=(120, 190, 255))
    d.text((396, 1600), t["search_sub"][0], font=font(92), fill=SUBTLE)
    d.text((396, 1720), t["search_sub"][1], font=font(92), fill=SUBTLE)

    shot = Image.open(
        ROOT / "fastlane/screenshots" / t["shots"] / "iPhone_17_Pro_Max/01_calculator.png"
    ).convert("RGBA")
    pw = 1000
    shot = shot.resize((pw, round(shot.height * pw / shot.width)), Image.LANCZOS)
    x, y, r = 2330, (h - shot.height) // 2, 96
    m = rounded_mask(shot.size, r)
    sh = Image.new("RGBA", canvas.size, (0, 0, 0, 0))
    sh.paste((0, 0, 0, 170), (x, y + 30), m)
    canvas = Image.alpha_composite(canvas, sh.filter(ImageFilter.GaussianBlur(40)))
    frame = Image.new("RGBA", (pw + 36, shot.height + 36), (0, 0, 0, 0))
    ImageDraw.Draw(frame).rounded_rectangle((0, 0, *frame.size), r + 18, fill=(8, 10, 16, 255))
    canvas.alpha_composite(frame, (x - 18, y - 18))
    canvas.paste(shot, (x, y), m)
    return canvas


def main():
    icon = Image.open(ROOT / "assets/images/icon.png").convert("RGBA")
    for lang in TEXT:
        for name, fn in (("header", header), ("search", search)):
            path = OUT / f"{name}-{lang}.png"
            fn(lang, icon).convert("RGB").save(path, optimize=True)
            print(path.relative_to(ROOT), path.stat().st_size // 1024, "KiB")


if __name__ == "__main__":
    main()
