#!/bin/bash

# Define the root directory
ROOT_DIR="repository-root"

# Create the folder structure
mkdir -p $ROOT_DIR/{.github/{workflows,environments},terraform/{modules/{1password,terraform,docker,cosmos-cloud,additional-services/{grafana,node-red,home-assistant,unifi-controller,pi-hole}}},cosmos/cosmos-compose,scripts/setup/{additional-services/{grafana,node-red,home-assistant,unifi-controller,pi-hole}},docs/images}

# Create files with placeholders
touch $ROOT_DIR/{README.md,.github/workflows/ci-pipeline.yml,.github/environments/{ServingPi.env,JuliansPi.env},terraform/{main.tf,variables.tf,outputs.tf,providers.tf},terraform/modules/{1password/{main.tf,variables.tf,outputs.tf},terraform/{main.tf,variables.tf,outputs.tf},docker/{main.tf,variables.tf,outputs.tf},cosmos-cloud/{main.tf,variables.tf,outputs.tf},additional-services/{grafana/{main.tf,variables.tf,outputs.tf},node-red/{main.tf,variables.tf,outputs.tf},home-assistant/{main.tf,variables.tf,outputs.tf},unifi-controller/{main.tf,variables.tf,outputs.tf},pi-hole/{main.tf,variables.tf,outputs.tf}}},cosmos/cosmos-compose/{grafana-compose.yml,node-red-compose.yml,home-assistant-compose.yml,pi-hole-compose.yml,unifi-controller-compose.yml},scripts/{installer.sh,checks.sh},scripts/setup/{1password.sh,terraform.sh,docker.sh,cosmos-cloud.sh},scripts/setup/additional-services/{grafana.sh,node-red.sh,home-assistant.sh,unifi-controller.sh,pi-hole.sh},docs/{references.md},docs/images/{logo.png,workflow-diagram.png,terraform-diagram.png}}