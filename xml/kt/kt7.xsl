<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <items>
            <xsl:apply-templates select="/ul/li">
                <xsl:with-param name="parentid" select="0"/>
            </xsl:apply-templates>
        </items>
    </xsl:template>

    <xsl:template match="li">
        <xsl:param name="parentid"/>
        <item>
            <xsl:attribute name="id"><xsl:value-of select="@data-id"/></xsl:attribute>
            <xsl:attribute name="parentid"><xsl:value-of select="$parentid"/></xsl:attribute>
            <xsl:attribute name="author"><xsl:value-of select="b"/></xsl:attribute>
            <xsl:value-of select="span"/>
        </item>
        <xsl:if test="count(/ul/li)!=0">
            <xsl:apply-templates select="./ul/li">
                <xsl:with-param name="parentid" select="@data-id"/>
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>