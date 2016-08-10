<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9">

 <xsl:template match="/">
    <html>
        <h2>Sitemap</h2>
        <p>You can use our sitemap to easily navigate to any section of our website.</p>
        <ul>
            <xsl:for-each select="sm:urlset/sm:url/sm:loc">
                <li class="{@level}">
                    <a href="{.}"><xsl:value-of select="@title"/></a>
                </li>
            </xsl:for-each>
        </ul>
    </html>
 </xsl:template>
</xsl:stylesheet>