<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
            <line x1="100" y1="100" x2="100" y2="600" stroke="black" stroke-width="2"></line>
            <line x1="100" y1="600" x2="1700" y2="600" stroke="black" stroke-width="2"></line>
            <xsl:for-each select="meteo/mesure/ville">
                <xsl:variable name="x" select="position() * 100"/>
                <xsl:variable name="temp" select="@temperature * 10" />
                <text stroke="#4285F4" x="{$x}" y="620">
                    <xsl:value-of select="@nom"/>
                </text>
                <rect width="50" height="{$temp}" x="{$x}" y="{600 - $temp}" stroke="black" fill="#0F9D58">
                    <animate attributeName="height"
                        dur="0.3s"
                        from="0"
                        to="{$temp}"></animate>
                    <animate attributeName="y"
                        dur="0.3s"
                        from="600"
                        to="{600-$temp}"
                     ></animate>
                </rect>
                <text stroke="#4285F4" x="{$x+15}" y="{600 - $temp - 10}">
                    <xsl:value-of select="@temperature"/>
                </text>
            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>