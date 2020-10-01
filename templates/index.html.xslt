<xsl:transform version="1.0" exclude-result-prefixes="atom"
               xmlns:atom="http://www.w3.org/2005/Atom"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="atom:feed" mode="html.meta">
    <title>Planet Digital Humanities · David Maus M. A.</title>
  </xsl:template>

  <xsl:template match="*" mode="html.meta" priority="-10"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="referrer" content="no-referrer"/>
        <xsl:apply-templates mode="html.meta"/>
        <link rel="stylesheet" href="/style.css"/>
      </head>
      <body>
        <a href="#main">Skip to content</a>
        <header>
          David Maus M. A.
        </header>
        <nav>
          <ul>
            <li><a href="/">About me</a></li>
            <li><a href="/blog">Blog</a></li>
            <li><a href="/pdh">Planet Digital Humanities</a></li>
          </ul>
        </nav>
        <main id="main">
          <xsl:apply-templates/>
        </main>
        <footer/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="node() | @*" mode="html.meta"/>
  
  <xsl:template match="atom:feed">
    <section>
      <h1><xsl:value-of select="atom:title"/></h1>
      <p>
        This <a href="https://en.wikipedia.org/wiki/Planet_(software)" target="_blank">Planet</a> aggregates news and
        blog posts from the wider digital humanities community. It features smaller websites, journals and independent
        bloggers that the <a href="http://dmaus.name" target="_blank">curator of the list</a> deems interesting. You can
        <a href="index.atom">subscribe</a> to the planet's feed and/or
        <a href="https://github.com/dmj/planet-dh/blob/master/subscriptions.ini">view the subscription list</a>. The
        planet is powered by <a href="http://intertwingly.net/code/venus/">Planet Venus</a> and updated daily.
      </p>
      <p>
        Last update: <xsl:value-of select="substring(atom:updated, 1, 10)"/>
      </p>
      <xsl:apply-templates select="atom:entry"/>
    </section>
  </xsl:template>

  <xsl:template match="atom:entry">
    <article>
      <h2 id="{generate-id()}"><xsl:value-of select="atom:title"/></h2>
      <p>
        <a href="{atom:link[@rel = 'alternate'][@type = 'text/html']/@href}" target="_blank">
          <xsl:choose>
            <xsl:when test="atom:source/atom:title">
              <xsl:value-of select="atom:source/atom:title"/>
            </xsl:when>
            <xsl:when test="atom:source/atom:subtitle">
              <xsl:value-of select="atom:source/atom:subtitle"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="atom:source/atom:id"/>
            </xsl:otherwise>
          </xsl:choose>
        </a>
        <xsl:text>, </xsl:text>
        <date><xsl:value-of select="substring(atom:updated, 1, 10)"/></date>
      </p>
    </article>
  </xsl:template>

</xsl:transform>
