<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright 2017 Red Hat, Inc. and/or its affiliates.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~       http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://maven.apache.org/POM/4.0.0"
                xmlns:m="http://maven.apache.org/POM/4.0.0"
                xmlns:xalan="http://xml.apache.org/xalan"
                exclude-result-prefixes="m xalan"
                version="1.0">

  <!-- Remove all whitespaces & format the output -->
  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" indent="yes" xalan:indent-amount="2"/>

  <!-- Copy the content of the pom.xml file -->
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove parent & dependencies declarations -->
  <xsl:template match="m:parent"/>
  <xsl:template match="m:dependencies"/>
  <xsl:template match="comment()[contains(., 'The file is modified by XSL transformation before kie-wb-playground.zip file is created.')]"/>

  <!-- Set version to 1.0.0-SNAPSHOT -->
  <xsl:template match="m:artifactId">
    <xsl:copy-of select="."/>
    <groupId><xsl:value-of select="current()"/></groupId>
    <version>1.0.0-SNAPSHOT</version>
  </xsl:template>

</xsl:stylesheet>
