<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
	    <goods>
            <xsl:comment> Всего элементов: <xsl:value-of select="count(/items/element)"/> </xsl:comment>
            <xsl:apply-templates />
	    </goods>
	</xsl:template>
    
	<xsl:template match="/items/element">
        <xsl:element name="{@name}">
			<xsl:value-of select="@value" />
        </xsl:element>
	</xsl:template>

</xsl:stylesheet>
