#!/bin/bash
mkdir workspace
mkdir workspace/.c9
touch user.settings
touch state.settings
touch project.settings
sudo chown 999:docker -R ./workspace *.settings