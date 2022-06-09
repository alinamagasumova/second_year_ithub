<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" />

	<xsl:template match="/">
		<html>
			<head>
				<title>Кт 4</title>
				<style>
				  body {
                    margin: 0;
                    display: flex;
                    align-items: center;
                    justify-content: center;
				  }
                  table {
                    width: 20%;
                    border-collapse: collapse;
                  }
                  table, td {
                    border: 3px double black;
                  }
                  td {
                    padding: 3px;
                    width: 30px;
                    height: 35px;
                  }
                  tr {
                    text-align: center;
                  }
                  tr:not(.bold):nth-child(2n) {
                    background-color: lightgray;
                  }
                  .bold {
                    font-weight: 600;
                  }
				</style>
			</head>
			<body>
			  <table>
                  <tr class="bold">
                    <td colspan="2">Всего элементов: <xsl:value-of select="count(/items/element)"/></td>
                  </tr>
                  <tr class="bold">
                    <td>Тип</td>
                    <td>Наименование</td>
                  </tr>
                  <xsl:apply-templates select="/items/element"/>
			  </table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="element">
        <xsl:for-each select=".">
            <xsl:choose>
                <xsl:when test="@name = 'printer'">
                    <tr>
                        <td>Принтер</td>
                        <td><xsl:value-of select="@value"/></td>
                    </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr>
                        <td><xsl:value-of select="@name"/></td>
                        <td><xsl:value-of select="@value"/></td>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
	</xsl:template>

</xsl:stylesheet>