<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:key name="coursesByPrep" match="/courses/course/teachers/teacher" use="." />
    <xsl:key name="coursesByXML" match="/courses/course/keywords/keyword" use="." />

    <xsl:template match="/">
        <html>
            <head>
                <title>Курсы</title>
            </head>
            <body>
                <h1>Наши курсы</h1>
                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('coursesByPrep', 'Борисов И.О.')">
                        <li><xsl:value-of select="../../title"/></li>
                    </xsl:for-each>
                </ul>
                <h3>Курсы, которые используют XML.</h3>
                <ul>
                    <xsl:for-each select="key('coursesByXML', 'XML') ">
                        <li><xsl:value-of select="../../title"/></li>
                    </xsl:for-each>
                </ul>
                <h3>Курсы, которые используют XSLT. и их читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('coursesByPrep', 'Борисов И.О.')[../../keywords/keyword = 'XSLT']">
                        <li><xsl:value-of select="../../title"/></li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>