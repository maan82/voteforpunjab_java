#!/usr/bin/env bash

mvn clean install -DskipTests

cp target/voteforpunjab-1.0.0.war Archiveq/application.war && chmod +x Archiveq/application.war && chmod +x Archiveq/Procfile && zip -r Archiveq.zip Archiveq