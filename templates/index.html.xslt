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
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="referrer" content="no-referrer"/>
        <meta name="robots" content="noindex,nofollow"/>
        <title><xsl:value-of select="atom:title"/></title>
        <link rel="stylesheet" href="../assets/tufte-css-1.4/tufte.css"/>
        <link rel="stylesheet" href="../assets/tufte-override.css"/>
        <link rel="alternate" type="application/atom+xml" title="Subscribe to feed" href="index.atom"/>
      </head>
      <body>
        <img id="logo" src="../assets/dmaus.svg"/>
        <p>
          <a href="..">Home</a>
          ·
          <a href="../blog">Blog</a>
          ·
          <strong>Planet Digital Humanities</strong>
        </p>
        <h1>Planet Digital Humanities</h1>
        <p class="subtitle">A personal feed aggregator with a pretentious name</p>
        <div id="content">
          <xsl:apply-templates/>
        </div>
        <!-- <dl id="sidebar"> -->
        <!--   <dt><xsl:value-of select="atom:title"/></dt> -->
        <!--   <dd> -->
        <!--     <ul> -->
        <!--       <li><a href="index.atom">Subscribe</a></li> -->
        <!--       <li>Powered by <a href="http://intertwingly.net/code/venus/">Planet Venus</a></li> -->
        <!--     </ul> -->
        <!--   </dd> -->
        <!--   <dt>Subscriptions</dt> -->
        <!--   <dd> -->
        <!--     <ul> -->
        <!--       <xsl:for-each select="planet:source"> -->
        <!--         <xsl:sort select="planet:name"/> -->
        <!--         <li><a href="{planet:link}" title="{planet:name}"><xsl:value-of select="planet:name"/></a></li> -->
        <!--       </xsl:for-each> -->
        <!--     </ul> -->
        <!--   </dd> -->
        <!-- </dl> -->
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <section>
      <h2><a href="{atom:link[@type = 'text/html']/@href}"><xsl:value-of select="atom:title"/></a></h2>
      <p class="subtitle">
        <xsl:value-of select="atom:source/planet:name"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="atom:updated/@planet:format"/>
      </p>
    </section>
  </xsl:template>

  <xsl:template match="*" mode="content">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates mode="content"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*" mode="content"/>

  <xsl:template match="text()"/>

</xsl:transform>
