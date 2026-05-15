#!/bin/bash

# CashMaker V16 - Quick Start Validation Script
# Usage: bash quick_start.sh

echo "🚀 CashMaker V16 - Validation Script"
echo "======================================"
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Checks
check_endpoint() {
    echo -n "Checking endpoint: $1 ... "
    if curl -s -o /dev/null -w "%{http_code}" "$1" | grep -q "200\|302\|401"; then
        echo -e "${GREEN}✓ OK${NC}"
        return 0
    else
        echo -e "${RED}✗ FAILED${NC}"
        return 1
    fi
}

check_api_key() {
    echo -n "Checking API key format: $1 ... "
    if [ -z "$2" ]; then
        echo -e "${YELLOW}⚠ NOT SET${NC}"
        return 1
    else
        echo -e "${GREEN}✓ SET${NC}"
        return 0
    fi
}

echo -e "${YELLOW}1. Checking Endpoints${NC}"
echo ""

check_endpoint "https://cashmaker-veo-worker-production.up.railway.app/health"
check_endpoint "https://www.bankier.pl/rss/wiadomosci.xml"
check_endpoint "https://aistudio.google.com"
check_endpoint "https://api.elevenlabs.io"

echo ""
echo -e "${YELLOW}2. Checking Environment Variables${NC}"
echo ""

check_api_key "GEMINI_API_KEY" "$GEMINI_API_KEY"
check_api_key "ELEVENLABS_API_KEY" "$ELEVENLABS_API_KEY"
check_api_key "TELEGRAM_BOT_TOKEN" "$TELEGRAM_BOT_TOKEN"
check_api_key "FACEBOOK_ACCESS_TOKEN" "$FACEBOOK_ACCESS_TOKEN"

echo ""
echo -e "${YELLOW}3. File Structure Check${NC}"
echo ""

files=("cashmaker_make_scenario.json" "README.md" "SETUP_GUIDE.md" ".gitignore")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $file"
    else
        echo -e "${RED}✗${NC} $file (MISSING)"
    fi
done

echo ""
echo -e "${YELLOW}4. Quick Health Check${NC}"
echo ""

response=$(curl -s https://cashmaker-veo-worker-production.up.railway.app/health)
if echo "$response" | grep -q "healthy"; then
    echo -e "${GREEN}✓ Veo Worker is healthy${NC}"
else
    echo -e "${RED}✗ Veo Worker might be down${NC}"
fi

echo ""
echo "======================================"
echo "Validation complete! 🎉"
echo ""
echo "Next steps:"
echo "1. Review SETUP_GUIDE.md"
echo "2. Configure Make.com with your API keys"
echo "3. Import cashmaker_make_scenario.json"
echo "4. Run 'Run once' test in Make.com"
echo "5. Monitor execution logs"
echo ""
