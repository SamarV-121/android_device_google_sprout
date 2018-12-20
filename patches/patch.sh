#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'system/netd'
 )

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"
    echo "${RED}Applying ${NC}${repository} ${RED}patches...${NC}"
    patch -p1 < "${ROOT}/device/google/sprout/patches/${repository}"/*
    cd "${ROOT}"
done
