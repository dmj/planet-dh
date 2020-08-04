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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="referrer" content="no-referrer"/>
        <meta name="robots" content="noindex,nofollow"/>
        <link rel="stylesheet" href="/assets/style.css"/>
        <title><xsl:value-of select="atom:title"/></title>
        <link rel="alternate" type="application/atom+xml" title="Subscribe to feed" href="index.atom"/>
      </head>
      <body>
        <img src="/assets/dmaus.svg" id="logo"/>
        <header>David Maus M. A.</header>
        <nav>
          <ul>
            <li>
              <a id="nav-home" href="/">Home</a>
            </li>
            <li>
              <a id="nav-blog" href="/blog">Blog</a>
            </li>
            <li>
              <a id="nav-planet" href="/pdh">Planet Digital Humanities</a>
            </li>
          </ul>
        </nav>
        <section>
          <p>
            This <a href="https://en.wikipedia.org/wiki/Planet_(software)" target="_blank">Planet</a> aggregates news and
            blog posts from the wider digital humanities community. It features smaller websites, journals and independent
            bloggers that the <a href="http://dmaus.name" target="_blank">curator of the list</a> deems interesting. You
            can <a href="index.atom">subscribe</a> to the planet's feed and/or <a
            href="https://github.com/dmj/planet-dh/blob/master/subscriptions.ini">view the subscription list</a>. The
            planet is powered by <a href="http://intertwingly.net/code/venus/">Planet Venus</a> and updated daily.
          </p>
          <p>
            Last updated: <xsl:value-of select="substring(atom:updated, 1, 10)"/>
          </p>
        </section>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry">
    <section>
      <p class="subtitle">
        <xsl:value-of select="atom:source/planet:name"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="atom:updated/@planet:format"/>
      </p>
      <h1><a href="{atom:link[@type = 'text/html']/@href}"><xsl:value-of select="atom:title"/></a></h1>
    </section>
  </xsl:template>

</xsl:transform>
