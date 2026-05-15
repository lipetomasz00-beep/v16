# 💰 CashMaker Master Truth V16 - ABSOLUTE

[![Status](https://img.shields.io/badge/status-production%20ready-brightgreen)](https://github.com/lipetomasz00-beep/v16)
[![Make.com](https://img.shields.io/badge/platform-Make.com-blue)](https://make.com)
[![Veo 3.1](https://img.shields.io/badge/video-Veo%203.1-orange)](https://developers.generativeai.google/)
[![Python](https://img.shields.io/badge/backend-Python%203.11-blue)](https://python.org)

## 🎯 Cel Projektu

**Automatyzacja przychodów: 10 000€/miesiąc** poprzez:
- ✅ Autonomiczną generację treści (3-4 wideo dziennie)
- ✅ AI-driven content optimization (Gemini 3.1)
- ✅ Professional video generation (Veo 3.1 Lite)
- ✅ Multi-platform distribution (Telegram, Facebook, Instagram)
- ✅ Real-time performance tracking (Google Sheets)

---

## 🏗️ Architektura Systemu

```
┌─────────────────────────────────────────────────────────────┐
│                    CashMaker V16 Pipeline                   │
└─────────────────────────────────────────────────────────────┘

1. RSS TRIGGER
   └─→ Bankier.pl news feed
      ↓
2. GEMINI AI (Module 99)
   └─→ Content Analysis & JSON Generation
      ├─ Audio script (18s, 40 words)
      ├─ Description (25 words + hashtags)
      └─ Broll prompt (Veo 3.1 optimized)
      ↓
3. JSON PARSER (Module 307)
   └─→ Clean data extraction
      ↓
4. VEO 3.1 VIDEO GENERATION (Module 443) ⭐
   └─→ cashmaker-veo-worker on Railway.app
      └─ Input: Video prompt (English)
      └─ Output: 9:16 vertical video (8 seconds)
      ↓
5. AUDIO GENERATION (Module 401)
   └─→ ElevenLabs Text-to-Speech
      ├─ Language: Polish
      ├─ Model: Eleven Multilingual v2
      └─ Format: MP3 (128 kbps)
      ↓
6. MULTI-PLATFORM PUBLISHING
   ├─→ Telegram (@Finansowyoddech) ✓
   ├─→ Facebook Page (Finansowy Oddech) ✓
   ├─→ Instagram Reels (Reels Feed) ✓
   └─→ Google Sheets (Logging & Analytics) ✓
```

---

## 📁 Zawartość Repozytorium

```
v16/
├── README.md                    # 👈 Ten plik
├── SETUP_GUIDE.md              # Instrukcja konfiguracji (CZYTAJ NAJPIERW!)
├── cashmaker_make_scenario.json # Make.com blueprint
├── .gitignore                  # Security (exclude keys)
└── docs/
    ├── ARCHITECTURE.md         # Deep dive techniczny
    ├── API_INTEGRATION.md       # Integracja z Veo 3.1
    └── TROUBLESHOOTING.md      # Rozwiązywanie problemów
```

---

## 🚀 Quick Start (5 minut)

### 1. Clone Repo
```bash
git clone https://github.com/lipetomasz00-beep/v16.git
cd v16
```

### 2. Import to Make.com
```
1. Otwórz https://make.com
2. New Scenario → Import Blueprint
3. Wklej JSON z cashmaker_make_scenario.json
4. Kliknij Import
```

### 3. Configure API Keys
```bash
# Skopiuj .env.example na .env
cp .env.example .env

# Uzupełnij klucze:
GEMINI_API_KEY=your_key_here
ELEVENLABS_API_KEY=your_key_here
TELEGRAM_BOT_TOKEN=your_token_here
FACEBOOK_ACCESS_TOKEN=your_token_here
```

### 4. Test
```
Make.com → Run once
Sprawdź czy:
✓ RSS trigger zadziałał
✓ Gemini AI zwrócił JSON
✓ Veo 3.1 wygenerował video
✓ Audio zostało wygenerowane
✓ Telegram otrzymał wiadomość
```

---

## 📊 Flow Diagram

```
                    ┌─────────────────┐
                    │  Bankier.pl RSS │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Gemini AI (99) │ ◄─── Analyzes news
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ JSON Parser(307)│ ◄─── Extracts audio/broll
                    └────────┬────────┘
                             │
         ┌───────────────────┼───────────────────┐
         │                   │                   │
         ▼                   ▼                   ▼
    ┌────────────┐    ┌──────────────┐   ┌──────────────┐
    │Veo 3.1(443)│    │ElevenLabs(401)  │Google Sheets │
    │Video Gen  │    │Audio Gen    │   │  Logging   │
    └─────┬──────┘    └──────┬──────┘   └──────┬──────┘
          │                   │                  │
          └───────────────────┼──────────────────┘
                              │
              ┌───────────────┼───────────────┐
              │               │               │
              ▼               ▼               ▼
          ┌────────┐   ┌──────────┐   ┌───────────┐
          │Telegram│   │ Facebook │   │ Instagram │
          │ (274)  │   │  (407)   │   │  (412)    │
          └────────┘   └──────────┘   └───────────┘
```

---

## ⚙️ Konfiguracja

### Wymagane klucze API:

| Serwis | Czemu | Link |
|--------|-------|------|
| **Gemini AI** | Content analysis | [aistudio.google.com](https://aistudio.google.com) |
| **Veo 3.1** | Video generation | [developers.generativeai.google](https://developers.generativeai.google/) |
| **ElevenLabs** | Text-to-speech | [elevenlabs.io](https://elevenlabs.io) |
| **Make.com** | Automation platform | [make.com](https://make.com) |
| **Telegram** | Bot & channel | [@BotFather](https://t.me/BotFather) |
| **Facebook** | Pages & Reels | [developers.facebook.com](https://developers.facebook.com) |

**👉 Pełna instrukcja: zobacz [SETUP_GUIDE.md](./SETUP_GUIDE.md)**

---

## 📈 Monitoring & Analytics

### Real-time Metrics
```
Make.com Dashboard:
- Execution logs (co 30 min)
- Error handling (automatic retry)
- Performance metrics (runtime, usage)

Google Sheets Logging:
- Video URLs
- Publish timestamps
- Article titles
- Performance metrics
```

### Alerts & Notifications
```
Configure:
- Slack → Error alerts
- Email → Daily summary
- Telegram → On-demand status
```

---

## 🔧 Techniczne Szczegóły

### Backend: cashmaker-veo-worker
```python
# Wdrożony na: Railway.app
# Endpoint: https://cashmaker-veo-worker-production.up.railway.app

POST /generate
{
  "prompt": "Extreme macro shot of financial terminal..."
}

Response:
{
  "status": "success",
  "video_url": "https://storage.googleapis.com/..."
}
```

**Kod źródłowy**: [lipetomasz00-beep/cashmaker-veo-worker](https://github.com/lipetomasz00-beep/cashmaker-veo-worker)

### Video Specs
- **Format**: MP4 (H.264)
- **Resolution**: 1080p
- **Aspect Ratio**: 9:16 (vertical)
- **Duration**: 8 seconds
- **Frame Rate**: 30 fps
- **Size**: ~3-5 MB

---

## 💰 Kosty Operacyjne

### Monthly Breakdown (100 videos)
| Komponent | Koszt |
|-----------|-------|
| Make.com (Pro) | $29 |
| Gemini AI | ~$10 |
| Veo 3.1 (100 videos) | ~$100 |
| ElevenLabs | ~$30 |
| Railway hosting | ~$20 |
| **RAZEM** | **~$190** |

**ROI**: 10 000€ revenue / 190€ cost = **52x multiplier** 💰

---

## 🐛 Troubleshooting

### Common Issues

**Q: Veo 3.1 timeout (504)**
```
A: Zwiększ timeout w Module 443 z 120s na 180s
```

**Q: Gemini returns invalid JSON**
```
A: Sprawdź Module 307 regex - zły parsing
```

**Q: Telegram bot nie publikuje**
```
A: Sprawdź czy bot jest adminem kanału
```

**Q: Video URL pusta**
```
A: Serwer cashmaker-veo-worker offline
   Sprawdź: https://...up.railway.app/health
```

**👉 Więcej**: zobacz [SETUP_GUIDE.md - Troubleshooting](./SETUP_GUIDE.md#troubleshooting)

---

## 📚 Dokumentacja

| Dokument | Opis |
|----------|------|
| [SETUP_GUIDE.md](./SETUP_GUIDE.md) | 📋 Konfiguracja step-by-step |
| [ARCHITECTURE.md](./docs/ARCHITECTURE.md) | 🏗️ Technical deep dive |
| [API_INTEGRATION.md](./docs/API_INTEGRATION.md) | 🔌 Veo 3.1 integration |
| [TROUBLESHOOTING.md](./docs/TROUBLESHOOTING.md) | 🔧 Problem solving |

---

## 🔐 Security

### Best Practices
```
✓ Nigdy nie commituj API keys
✓ Używaj .env files (excluded w .gitignore)
✓ Rotate tokens regularnie (30 dni)
✓ Use secret management (Make.com secure storage)
✓ Audit logs (Google Sheets for tracking)
```

### Encryption
```
- All API calls: HTTPS/TLS 1.3
- Stored credentials: Make.com encrypted vault
- Database: GCS with encryption at rest
```

---

## 🤝 Contributing

```bash
# Fork repo
git clone https://github.com/YOUR_USERNAME/v16.git

# Create branch
git checkout -b feature/my-improvement

# Make changes
git add .
git commit -m "Add feature X"

# Push & create PR
git push origin feature/my-improvement
```

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/lipetomasz00-beep/v16/issues)
- **Discussions**: [GitHub Discussions](https://github.com/lipetomasz00-beep/v16/discussions)
- **Email**: lipetomasz00@gmail.com

---

## 📜 License

MIT License - See LICENSE file

---

## 🎉 Credits

- **AI**: Google Gemini 3.1
- **Video Gen**: Veo 3.1 by Google
- **Audio**: ElevenLabs
- **Platform**: Make.com
- **Author**: [@lipetomasz00-beep](https://github.com/lipetomasz00-beep)

---

## 📈 Roadmap

- [ ] v17: YouTube automation
- [ ] v18: TikTok shop integration
- [ ] v19: A/B testing engine
- [ ] v20: Custom landing pages
- [ ] v21: AI-powered copywriting

---

## ⭐ Status

```
✅ Production Ready
✅ Fully Automated
✅ 24/7 Operational
✅ Monitored & Logged
✅ Scalable to 10k€+/month
```

---

**Last Updated**: 2026-05-15  
**Version**: V16 ABSOLUTE  
**Status**: 🟢 LIVE

