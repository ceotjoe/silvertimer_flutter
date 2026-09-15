# App icon source — Liquid Glass redesign

Source layers for `AppIcon.icon` (Icon Composer), replacing the flat
`AppIcon.appiconset` PNG previously baked with a rainbow gradient background,
an "Ag" text label, and a fake metallic bevel on the clock — all of which
fight with Liquid Glass's own system-applied specular/blur/refraction.

Per Apple's Icon Composer prep guidance, each layer here is flat, single-fill,
transparent elsewhere, with no gradient/shadow/bevel baked in — those are
applied in Icon Composer instead, where they can be tuned per platform and
per appearance (Default / Dark / Mono).

| File | Content |
|---|---|
| `01-drop.svg` / `.png` | Water droplet silhouette, flat blue fill |
| `02-clock.svg` / `.png` | Clock/timer glyph — ring + hands + center dot, flat fill |

Both are 1024×1024, laid out on the same coordinate grid so they compose
correctly when stacked (drop lower-left, clock upper-right, slight overlap) —
see `preview_composite.png` if regenerated locally for a rough (non-Liquid-Glass)
gut check; it's not committed since it's not real Icon Composer output.

PNGs are pre-rendered (via `rsvg-convert`) as a fallback in case SVG import
into Icon Composer has issues with a particular shape; prefer the SVGs when
importing since they stay crisp at every icon size Icon Composer generates.

## Assembling `AppIcon.icon`

1. Open Icon Composer — `Xcode > Open Developer Tool > Icon Composer`.
2. New icon, drag in `01-drop.svg` and `02-clock.svg` (or the whole folder,
   which auto-groups them).
3. Two groups: **Background** (`01-drop`), **Foreground** (`02-clock`).
4. On the icon's root Fill (Color inspector, not a layer): Gradient, blue
   family (e.g. `#2E8FF2` → a darker/lighter blue of your choice) — this
   replaces the old flat rainbow with a Liquid-Glass-native background.
5. Leave Specular on Automatic for both groups to start; adjust
   Blur/Refraction/Shadow only if something looks off in preview.
6. Check Default, Dark, and Mono (Clear + Tinted) previews at the bottom of
   the canvas. For Mono, map one layer to solid white and let Icon Composer
   auto-convert the rest to grayscale, then touch up by eye.
7. `File > Save`, name it `AppIcon`, save as `ios/Runner/AppIcon.icon` (and/or
   `macos/Runner/AppIcon.icon` — Icon Composer supports iOS + macOS in one
   file, so you can point both projects at the same saved file if you'd
   rather maintain one source of truth).

## Web / PWA fallback

Icon Composer's `.icon` bundle (with its Liquid Glass specular/blur/translucency)
has no equivalent on the web, so `web-fallback/icon-flat.svg` and
`icon-maskable.svg` recreate the same two layers as a flat, static gradient
using the exact stop colors from `AppIcon.icon/icon.json` (root fill,
`01-drop`, `02-clock`). `icon-maskable.svg` additionally scales the content
to 72% so it survives an OS-applied circle/squircle mask.

Regenerate the web assets after editing either SVG:

```bash
cd design/app-icon/web-fallback
rsvg-convert -w 512 -h 512 icon-flat.svg -o ../../../web/icons/Icon-512.png
rsvg-convert -w 192 -h 192 icon-flat.svg -o ../../../web/icons/Icon-192.png
rsvg-convert -w 32  -h 32  icon-flat.svg -o ../../../web/favicon.png
rsvg-convert -w 512 -h 512 icon-maskable.svg -o ../../../web/icons/Icon-maskable-512.png
rsvg-convert -w 192 -h 192 icon-maskable.svg -o ../../../web/icons/Icon-maskable-192.png
```
