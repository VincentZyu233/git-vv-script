#!/bin/bash
# 颜色定义
Y='\033[1;33m'
B='\033[0;34m'
C='\033[0;36m'
NC='\033[0m'

echo -e "\n${Y}🚀 Repository Overview${NC}"
echo -e "${B}-----------------------------------------${NC}"

echo -e "🔗 ${C}Remotes:${NC}"
git remote -v | sed 's/^/  /'

echo -e "\n🌿 ${C}Branches:${NC}"
git branch -vv | sed 's/^/  /'

echo -e "\n📜 ${C}Recent Log (Top 5):${NC}"
# 强制开启颜色并缩进
git log --oneline -5 --graph --color=always | sed 's/^/  /'

echo -e "\n📊 ${C}Status Summary:${NC}"
git diff HEAD --stat | sed 's/^/  /'

echo -e "${B}-----------------------------------------${NC}\n"