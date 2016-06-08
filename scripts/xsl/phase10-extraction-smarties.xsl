<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="http://standoff.proposal" version="2.0" exclude-result-prefixes=" xsi ns2 ">
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:output indent="yes"/>
  <xsl:template match="*">
    <ns2:stdf>
      <ns2:annotations>
        <spanGrp type="candidatsTermes">
          <xsl:for-each select="//tei:tDebut[ancestor::tei:text]">
            <xsl:variable select="@id" name="varId"/>
            <span>
              <xsl:attribute name="target">
                <xsl:for-each select="following-sibling::tei:w[not(preceding::tei:tFin[@id=$varId])]/@xml:id
				      |following-sibling::node()[not(preceding::tei:tFin[@id=$varId])]//tei:w/@xml:id">
                  <xsl:choose>
                    <xsl:when test="position() != last()">
                      <xsl:value-of select="concat('#',.,' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="concat('#',.)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:attribute>
              <xsl:attribute name="corresp">
                <xsl:value-of select="concat('smarties-',$varId)"/>
              </xsl:attribute>
              <xsl:attribute name="lemma">
                <xsl:for-each select="following-sibling::tei:w[not(preceding::tei:tFin[@id=$varId])]/text()
				      |following-sibling::node()[not(preceding::tei:tFin[@id=$varId])]//tei:w/text()">
                  <xsl:choose>
                    <xsl:when test="position() != last()">
                      <xsl:value-of select="concat(.,' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="."/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:attribute>
	      <xsl:attribute name="ana">
		<xsl:value-of select="@annotation_manuelle"/>
	      </xsl:attribute>
            </span>
          </xsl:for-each>
        </spanGrp>
      </ns2:annotations>
    </ns2:stdf>
  </xsl:template>
</xsl:stylesheet>
