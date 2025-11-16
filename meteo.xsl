<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"></meta>
                <title>Meteo</title>
            </head>
            <body>
                <xsl:for-each select="meteo/mesure">
                    <ul>
                        <li>Date mesure: <xsl:value-of select="@date"/></li>
                        <table border="1" width="90%">
                            <tr>
                                <th>Ville</th>
                                <th>Temperature</th>
                            </tr>
                            <xsl:for-each select="ville">
                                <tr>
                                    <td><xsl:value-of select="@nom"/></td>
                                    <td><xsl:value-of select="@temperature"/></td>
                                </tr>
                            </xsl:for-each>
                            <tr>
                                <td>Nombre de villes</td>
                                <td><xsl:value-of select="count(ville)"></xsl:value-of></td>
                            </tr>
                            <tr>
                                <td>Temperature Moyenne</td>
                                <td><xsl:value-of select="avg(ville/@temperature)"></xsl:value-of></td>
                            </tr>
                        </table>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>