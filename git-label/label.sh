#!/bin/bash

# Repository in the format "owner/repo"
REPO=""

# List of labels in JSON format
labels=(
  '{"name": "Type: Bug", "color": "ff4c4c", "description": "유형: 버그"}'
  '{"name": "Type: Feature", "color": "4caf50", "description": "유형: 기능 추가"}'
  '{"name": "Type: Improvement", "color": "ffeb3b", "description": "유형: 기능 개선"}'
  '{"name": "Type: Dev docs", "color": "2196f3", "description": "유형: 개발 문서"}'
  '{"name": "Type: Environment", "color": "9e9e9e", "description": "유형: 프로젝트 기초 설정"}'
  '{"name": "Type: Test", "color": "8bc34a", "description": "유형: 테스트"}'
  '{"name": "Type: Refactor", "color": "ff9800", "description": "유형: 리팩토링"}'
  '{"name": "Type: Etc", "color": "795548", "description": "유형: 이외"}'
  '{"name": "Type: Hotfix", "color": "f44336", "description": "배포된 버전에서 발견된 이슈"}'
  '{"name": "Type: Discussion", "color": "3f51b5", "description": "유형: 논의 필요"}'
  '{"name": "Type: Release", "color": "673ab7", "description": "유형: 논의 필요"}'
)

# Iterate over labels and create them
for label in "${labels[@]}"; do
  gh api -X POST "repos/$REPO/labels" -f name="$(echo $label | jq -r .name)" -f color="$(echo $label | jq -r .color)" -f description="$(echo $label | jq -r .description)"
done