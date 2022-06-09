<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/fibonacci-of">
        <xsl:call-template name="fib">
            <xsl:with-param name="n" select="."/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="fib">
        <xsl:param name="n"/>
        <xsl:param name="i" select="0"/>
        <xsl:param name="last" select="0"/>
        <xsl:param name="current" select="1"/>
        <xsl:choose>
            <xsl:when test="$i = ($n - 1)">
                <xsl:value-of select="$last"/>
            </xsl:when>

            <xsl:otherwise>
                <xsl:call-template name="fib">
                    <xsl:with-param name="n" select="$n"/>
                    <xsl:with-param name="i" select="$i + 1"/>
                    <xsl:with-param name="last" select="$current"/>
                    <xsl:with-param name="current" select="$last + $current"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>