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
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <div id="header">
          <xsl:value-of select="atom:title"/>
        </div>
        <div id="description">
          <small>Last update: <xsl:value-of select="atom:updated"/></small>
          <p>
            A personal feed aggregator with a pretentious name. Please direct questions, comments, and suggestions to <a href="mailto:planet@dmaus.name">planet@dmaus.name</a>.
          </p>
        </div>
        <div id="content">
          <xsl:apply-templates/>
        </div>
        <dl id="sidebar">
          <dt><xsl:value-of select="atom:title"/></dt>
          <dd>
            <ul>
              <li><a href="index.atom">Subscribe</a></li>
              <li>Powered by <a href="http://intertwingly.net/code/venus/">Planet Venus</a></li>
            </ul>
          </dd>
          <dt>Subscriptions</dt>
          <dd>
            <ul>
              <xsl:for-each select="planet:source">
                <xsl:sort select="planet:name"/>
                <li><a href="{planet:link}" title="{planet:name}"><xsl:value-of select="planet:name"/></a></li>
              </xsl:for-each>
            </ul>
          </dd>
        </dl>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <div>
      <small>
        <xsl:value-of select="atom:source/planet:name"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="atom:updated/@planet:format"/>
      </small>
      <h1><xsl:value-of select="atom:title"/></h1>
      <div>
        <xsl:choose>
          <xsl:when test="starts-with(atom:id, 'http://zotero.org')">
            <xsl:apply-templates select="atom:content/node()" mode="content"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="atom:summary/node()" mode="content"/>
          </xsl:otherwise>
        </xsl:choose>
      </div>
      <small>
        <a href="{atom:link[@type = 'text/html']/@href}">Read more</a>
      </small>
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
