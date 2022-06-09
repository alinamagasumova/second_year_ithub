<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:key name="byCity" match="/orgs/item" use="@city"/>
    <xsl:key name="byOrg" match="/orgs/item" use="concat(@city, ';', @org)"/>
    <xsl:variable name="cities" select="/orgs/item[ generate-id(.)=generate-id(key('byCity', @city)) ]"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Города</title>
            </head>
            <body>
                <h1>Города и компании</h1>
                <ul>
                    <xsl:for-each select="$cities">

                        <li>
                            <h3><xsl:value-of select="@city"/></h3>
                            <xsl:variable name="city" select="key('byCity', @city)"/>
                            <p>Всего товаров : <xsl:value-of select="count($city)"/></p>

                            <ul>
                                <xsl:variable name="orgs" select="$city[ generate-id(.)=generate-id(key('byOrg', concat(@city, ';', @org))) ]"/>
                                <xsl:for-each select="$orgs">
                                    <li>

                                        <h4><xsl:value-of select="@org"/></h4>
                                        <xsl:variable name="org" select="key('byOrg', concat(@city, ';', @org))"/>
                                        <p>Всего товаров : <xsl:value-of select="count($org)"/></p>

                                        <ul>
                                            <xsl:for-each select="$org">
                                                <li>
                                                    <xsl:value-of select="@title"/>
                                                </li>
                                            </xsl:for-each>
                                        </ul>

                                    </li>
                                </xsl:for-each>
                            </ul>

                        </li>

                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>