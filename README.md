# Supercharged

A collection of open source forks with custom features tailored to my workflows.

Each fork lives on a `supercharged` branch in its own repo, keeping upstream changes easy to merge while maintaining custom functionality on top.

Forks are rebranded (custom names, icons, colors) so they can be installed side-by-side with the upstream app. This makes it easy to test new upstream features without losing the supercharged version — and vice versa.

## Projects

### <img src="assets/supercapture.png" width="32" align="top" /> [SuperCapture](https://github.com/ahoendgen/BetterCapture/tree/supercharged)

Fork of [BetterCapture](https://github.com/jsattler/BetterCapture) — a native macOS screen recording app built with SwiftUI and ScreenCaptureKit.

**Changes:**
- Rebranded to SuperCapture (custom name, icons, update feed)
- [Post-recording transcription via Parakeet V3](https://github.com/ahoendgen/BetterCapture/tree/supercharged/supercapture-transcribe)
- Audio-only recording mode with optional video toggle
- Dual-audio WAV output
- Post-recording hooks for custom automation
- Configurable global shortcut with conflict detection
- Discreet mode, output subdirectories, minimum duration filter
- Audio codec conversion (multi-format support via symphonia)
- Start on login toggle
- Stability fixes (menu bar hang, race conditions, audio path handling)

### <img src="assets/handy-supercharged.png" width="32" align="top" /> [Handy Supercharged](https://github.com/ahoendgen/Handy/tree/supercharged)

Fork of [Handy](https://github.com/cjpais/Handy) — a free, offline speech-to-text desktop app.

**Changes:**
- Rebranded to Handy-Supercharged (custom name, app icons, electric blue theme, lightning bolt tray icon)
- Trigger words — define words/phrases that execute actions during transcription (e.g. saying "enter" presses Enter), with reliable multi-trigger support
- Disabled upstream update checker (independent release cycle)

## How it works

All forks follow the same pattern:

1. Fork the upstream repo
2. Create a `supercharged` branch
3. Add custom features on top
4. Periodically merge upstream changes to stay current
