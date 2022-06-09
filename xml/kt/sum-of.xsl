<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/sum-of-sequence">
        <xsl:call-template name="sum">
            <xsl:with-param name="from" select="./from"/>
            <xsl:with-param name="to" select="./to"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="sum">
        <xsl:param name="from"/>
        <xsl:param name="to"/>
        <xsl:param name="sum" select="0"/>
        <xsl:choose>
            <xsl:when test="$from = $to + 1">
                <xsl:value-of select="$sum"/>
            </xsl:when>

            <xsl:otherwise>
                <xsl:call-template name="sum">
                    <xsl:with-param name="from" select="$from + 1"/>
                    <xsl:with-param name="to" select="$to"/>
                    <xsl:with-param name="sum" select="$sum + $from"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>