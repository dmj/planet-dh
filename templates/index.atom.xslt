<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0"
               xmlns:atom="http://www.w3.org/2005/Atom"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:planet="http://planet.intertwingly.net/">

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="atom:feed">
    <xsl:copy>
      <!-- http://intertwingly.net/code/venus/docs/etiquette.html -->
      <xsl:attribute name="indexing:index" xmlns:indexing="urn:atom-extension:indexing">no</xsl:attribute>
      <access:restriction xmlns:access="http://www.bloglines.com/about/specs/fac-1.0" relationship="deny"/>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="planet:*|@planet:*"/>

</xsl:transform>
