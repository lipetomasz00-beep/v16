# 🚀 Przewodnik Konfiguracji - CashMaker V16

## Krok 1: Import Scenariusza do Make.com

### 1.1 Pobierz plik JSON
```bash
# Skopiuj plik cashmaker_make_scenario.json
# Lub klonuj to repo
git clone https://github.com/lipetomasz00-beep/v16.git
```

### 1.2 Importuj do Make.com
```
1. Zaloguj się na https://make.com
2. Przejdź do Scenarios
3. Kliknij "Create a new scenario"
4. Kliknij 3 kropki (...) → "Import Blueprint"
5. Wklej zawartość JSON
6. Kliknij "Import"
```

### 1.3 Sprawdź czy się załadował
- Powinieneś zobaczyć 10+ modułów
- RSS trigger u góry
- Router z 3 gałęziami na dole

---

## Krok 2: Konfiguracja API Keys

### 2.1 Gemini AI (Module 99)

```
1. Przejdź do https://aistudio.google.com
2. Kliknij "Get API Key"
3. Skopiuj klucz
4. W Make.com: Module 99 → __IMTCONN__ → "Create a connection"
5. Wklej API Key
6. Save
```

### 2.2 ElevenLabs (Module 401)

```
1. Przejdź do https://elevenlabs.io/app
2. Settings → API Key
3. Skopiuj klucz
4. W Module 401: Headers → xi-api-key
5. Zastąp starą wartość
```

**⚠️ Ważne**: Nie commituj API keys do Gita!

### 2.3 Telegram (Module 274)

```
1. Utwórz bota: https://t.me/BotFather
2. Skopiuj Token
3. W Make.com: Module 274 → __IMTCONN__ → New connection
4. Wklej Bot Token
5. Save
```

### 2.4 Facebook Pages (Module 407/412)

```
1. Zaloguj się na https://developers.facebook.com
2. Apps → Utwórz nową aplikację
3. Generuj Access Token
4. W Make.com: Module 407 → __IMTCONN__ → New connection
5. Wklej Access Token
6. Save
```

### 2.5 Google Sheets (Module 409)

```
1. Make.com: Module 409 → __IMTCONN__ → New connection
2. Zautoryzuj Google Account
3. Odblokuj dostęp
4. Save
```

---

## Krok 3: Dostosuj Parametry Scenariusza

### 3.1 RSS Feed (Module 1)

Zmień URL na dowolne źródło:

```
Opcje:
- Bankier.pl: https://www.bankier.pl/rss/wiadomosci.xml
- Onet: https://onet.pl/feed.xml
- TVN: https://tvn24.pl/rss.xml
- BBC: http://feeds.bbc.co.uk/news/rss.xml
```

### 3.2 Telegram Chat (Module 274)

```
Zmień:
"chatId": "@Finansowyoddech"

Na:
- Twój kanał: "@twoj_kanal"
- Lub ID: "123456789"

⚠️ Bot musi być adminem kanału!
```

### 3.3 Facebook Page (Module 407)

```
1. Zdobądź ID strony: https://findmyfbid.com
2. W Module 407: page_id
3. Zastąp: "1027429113781142"
4. Na swój ID
```

### 3.4 Instagram Business Account (Module 412)

```
1. Zdobądź Account ID: Meta Business Suite
2. W Module 412: accountId
3. Zastąp: "17841456132341730"
4. Na swój Account ID
```

### 3.5 Google Sheets (Module 409)

```
1. Utwórz arkusz: https://sheets.google.com
2. Nagłówki: Data, Tytul, A1 (URL), Prompt, Status
3. Skopiuj ID z URL: /spreadsheets/d/{ID_TUTAJ}/edit
4. W Module 409: spreadsheetId
5. Zastąp ścieżką do swojego arkusza
```

---

## Krok 4: Testowanie

### 4.1 Test pojedynczego modułu

```
1. Kliknij na Module 1 (RSS)
2. Kliknij "Run once"
3. Sprawdź czy trigger zadziałał
4. Kliknij Next → Module 99 (Gemini)
5. Sprawdź output
```

### 4.2 Test pełnego flow'u

```
1. Kliknij "Run once" na całym scenariuszu
2. Monitoruj execution log
3. Sprawdź czy:
   - RSS pobiera artykuł ✓
   - Gemini generuje JSON ✓
   - Parse JSON go czysty ✓
   - HTTP do Veo 3.1 zwraca video_url ✓
   - ElevenLabs generuje MP3 ✓
   - Social media publikują ✓
```

### 4.3 Sprawdzenie błędów

Jeśli coś się nie udało:

```
1. Kliknij na moduł z błędem
2. Sprawdź "Last error"
3. Jeśli to timeout: zwiększ timeout
4. Jeśli to auth: sprawdź API keys
5. Jeśli to format: sprawdź mapper
```

---

## Krok 5: Automation & Scheduling

### 5.1 Ustaw trigger (RSA scheduling)

```
1. Kliknij Module 1 (RSS)
2. Jeśli chcesz automatyzację co X minut:
   - Dodaj nowy moduł: "Scheduling"
   - Ustaw interwał: co 30 minut
```

### 5.2 Włącz scenariusz

```
1. Prawy górny róg: przycisk ON/OFF
2. Kliknij ON
3. Scenariusz będzie się automatycznie uruchamiał
```

### 5.3 Monitoring

```
1. Make.com Dashboard → Scenario
2. Sprawdź "Execution log"
3. Czy wszystkie kroki przeszły?
4. Czy wideo zostały opublikowane?
```

---

## Krok 6: Optimizacja

### 6.1 Zwiększ szybkość

```
- Zmniejsz sleep z 30s na 10s (jeśli video generuje się szybko)
- Ustaw Temperature na 0.1 (bardziej deterministyczne)
- Zwiększ max_results na 5 (więcej artykułów)
```

### 6.2 Obsługa błędów

```
Każdy moduł powinien mieć error handler:
1. Kliknij prawy przycisk na module
2. "Add error handler"
3. Ustaw: "Retry" lub "Ignore" lub "Log"
```

### 6.3 Logowanie i alerts

```
Dodaj na końcu:
- Slack notification (jeśli sukces)
- Email alert (jeśli błąd)
- Google Sheets log (wszystkie kroki)
```

---

## Checklist - Przed uruchomieniem

- [ ] Wszystkie API keys skonfigurowane
- [ ] RSS URL działa
- [ ] Telegram bot jest adminem kanału
- [ ] Facebook token aktywny (30 dni)
- [ ] Instagram business account połączony
- [ ] Google Sheets ID poprawny
- [ ] Veo 3.1 worker jest online (test /health)
- [ ] ElevenLabs voice ID aktywny
- [ ] Make.com plan powyżej 1000 operacji/miesiąc
- [ ] Testowy run przeszedł bez błędów

---

## Kosty miesięczne (estymacja)

| Serwis | Koszt | Notatki |
|--------|-------|---------|
| Make.com | $9-29 | Plan starter+ |
| Gemini AI | ~$10 | 10k artykułów |
| ElevenLabs | $30-100 | Zależy od ilości |
| Veo 3.1 | $40-150 | ~100 videos/miesiąc |
| **RAZEM** | **$90-300** | Per miesiąc |

---

## Troubleshooting

| Problem | Rozwiązanie |
|---------|------------|
| Module 443 timeout | Zwiększ timeout do 180s |
| ElevenLabs 401 | Sprawdź API key |
| Facebook 400 | Token wygasł - regeneruj |
| JSON parse error | Module 307 - sprawdź regex |
| Telegram no message | Bot nie jest adminem |
| Video URL pusta | Veo worker offline - sprawdź /health |

---

## Support & Help

```
1. Make.com Community: https://community.make.com
2. Veo 3.1 Docs: https://developers.generativeai.google/
3. ElevenLabs Support: support@elevenlabs.io
4. Railway Logs: https://railway.app
```

---

**Status**: ✅ Ready for Production  
**Wersja**: V16 ABSOLUTE  
**Ostatnia aktualizacja**: 2026-05-15

