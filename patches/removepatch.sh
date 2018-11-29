#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'bionic'
    'system/netd'
 )

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"
    echo "${RED}Applying ${NC}${repository} ${RED}patches...${NC}"
    patch -p1 -R < "${ROOT}/device/google/sprout/patches/${repository}"/*
    cd "${ROOT}"
done
