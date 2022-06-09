<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <ul>
            <xsl:apply-templates select="/items/item[@parentid = 0]"/>
        </ul>
    </xsl:template>

    <xsl:template name="info">
        <li>
            <xsl:value-of select="@author"/>
            <xsl:text> пишет: </xsl:text>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>

    <xsl:template match="item" name="sms">
        <xsl:variable name ="id" select="@id"/>

        <xsl:call-template name="info"/>
        <xsl:for-each select="/items/item[@parentid = $id]">
            <ul>
                <xsl:call-template name="sms"/>
            </ul>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>