ARG VERSION

FROM sonarqube:${VERSION}

ARG BRANCH_PLUGIN 
ARG BSL_PLUGIN_VERSION

USER root 

RUN set -xe \
    && apt update \
    && apt install -y curl \
    && cd /tmp \
    && curl -o sonar-communitybsl-plugin.jar -fSL "https://github.com/1c-syntax/sonar-bsl-plugin-community/releases/download/v"$BSL_PLUGIN_VERSION"/sonar-communitybsl-plugin-"$BSL_PLUGIN_VERSION".jar" \
    && curl -o  sonar-l10n-ru-plugin-latest.jar -fSL  "https://github.com/silverbulleters/sonar-l10n-ru/releases/download/v1.9/sonar-l10n-ru-plugin-1.9.jar" \
    && curl -o  sonarqube-community-branch-plugin.jar -fSL "https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/"$BRANCH_PLUGIN"/sonarqube-community-branch-plugin-"$BRANCH_PLUGIN".jar"  \
    && chmod 766 *.jar \
    && cp *.jar /opt/sonarqube/extensions/plugins \
    && cd .. \
    && rm -rf /tmp/*.jar

USER sonarqube 