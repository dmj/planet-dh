<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0"
               exclude-result-prefixes="atom planet"
               xmlns:planet="http://planet.intertwingly.net/"
               xmlns:atom="http://www.w3.org/2005/Atom"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>

  <xsl:template match="atom:feed">
    <html>
      <head>
        <title><xsl:value-of select="atom:title"/></title>
        <meta name="robots" content="noindex,nofollow"/>
        <link rel="alternate" type="application/atom+xml" title="Subscribe to feed" href="index.atom"/>
        <link rel="stylesheet" type="text/css" href="../assets/style.css"/>
      </head>
      <body>
        <img src="../assets/dmaus.svg" alt="Logo" style="position: fixed; float: left;">
        <div>
          <ul class="inline">
            <li><a href="/">about</a></li>
            <li><a href="/blog">blog</a></li>
            <li>planet digital humanities</li>
          </ul>
          <div style="float: right; padding: 1em; max-width: 20%; ">
            <h2>Planet Digital Humanities</h2>
            <ul>
              <li><a href="index.atom">subscribe</a></li>
              <li>powered by <a href="http://intertwingly.net/code/venus/">Planet Venus</a></li>
            </ul>
            <h2>Subscriptions</h2>
            <ul>
              <xsl:for-each select="planet:source">
                <xsl:sort select="planet:name"/>
                <li><a href="{planet:link}" title="{planet:name}"><xsl:value-of select="planet:name"/></a></li>
              </xsl:for-each>
            </ul>
          </div>
          <xsl:apply-templates/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <h1><xsl:value-of select="atom:title"/></h1>
    <ul class="inline">
      <li><xsl:value-of select="atom:source/planet:name"/></li>
      <li><xsl:value-of select="atom:updated/@planet:format"/></li>
      <li><a href="{atom:link[@type = 'text/html']/@href}">Read more</a></li>
    </ul>
    <div>
      <xsl:choose>
        <xsl:when test="starts-with(atom:id, 'http://zotero.org')">
          <p>
            <xsl:apply-templates select="atom:content/node()" mode="content"/>
          </p>
        </xsl:when>
        <xsl:otherwise>
          <p>
            <xsl:apply-templates select="atom:summary/node()" mode="content"/>
          </p>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="*" mode="content">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates mode="content"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*" mode="content"/>

  <xsl:template match="text()"/>

</xsl:transform>
