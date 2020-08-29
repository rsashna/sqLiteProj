<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
  <h2>List all tools using JS as the language</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Name of Tool</th>
      <th style="text-align:left">Type of Tool</th>
      <th style="text-align:left">Language</th>
    </tr>
    <xsl:for-each select="toolsData/tools">
    <tr>
      <td><xsl:value-of select="toolName"/></td>
      <td><xsl:value-of select="toolType"/></td>
      <td><xsl:value-of select="language"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
  <h2>List all multimedias</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Multimedia</th>
    </tr>
    <xsl:for-each select="multimediaData/multimedia">
    <tr>
      <td><xsl:value-of select="type"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
  <h2>List all categories of websites that are in the database</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Website Category</th>
    </tr>
    <xsl:for-each select="categoryData/category">
    <tr>
      <td><xsl:value-of select="webType"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
  <h2>List all data stored in website table</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Website URL</th>
      <th style="text-align:left">Date of Publishing</th>
      <th style="text-align:left">Company ID</th>
    </tr>
    <xsl:for-each select="websiteData/website">
    <tr>
      <td><xsl:value-of select="url"/></td>
      <td><xsl:value-of select="pubDate"/></td>
      <td><xsl:value-of select="companyID"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
  <h2>Who are all the CEOs in this DB?</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Ceo First Name</th>
      <th style="text-align:left">Ceo Last Name</th>
    </tr>
    <xsl:for-each select="ceoData/ceo">
    <tr>
      <td><xsl:value-of select="firstName"/></td>
      <td><xsl:value-of select="lastName"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
