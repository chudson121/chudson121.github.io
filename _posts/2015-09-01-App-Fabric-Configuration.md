## Microsoft App Fabric Cache Config
	
	<section name="dataCacheClients" allowDefinition="Everywhere" allowLocation="true" type="Microsoft.ApplicationServer.Caching.DataCacheClientsSection, Microsoft.ApplicationServer.Caching.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
	 
	<add key="AppFabricEnabled" value="true" />
	 
	<add key="DefaultServeAppFabricNamedCache" value="WebDataCache" />
	 
	<add key="LookupDataAppFabricNamedCache" value="WebLookupData" />
	 
	  <dataCacheClients>
	    <dataCacheClient name="default" dataCacheServiceAccountType="DomainAccount">
	      <hosts>
	        <host name="<ServerName>" cachePort="22233" />
	        <host name="<ServerName>" cachePort="22233" />
	        <host name="<ServerName>" cachePort="22233" />
	      </hosts>
	      <securityProperties mode="Transport" protectionLevel="EncryptAndSign" />
	    </dataCacheClient>
	  </dataCacheClients>
	 
	    <sessionState cookieless="false" customProvider="AppFabricCacheSessionStoreProvider" mode="Custom" timeout="20">
	      <providers>
	        <add name="AppFabricCacheSessionStoreProvider" cacheName="ProdSession" sharedId="P2P" type="Microsoft.ApplicationServer.Caching.DataCacheSessionStoreProvider, Microsoft.ApplicationServer.Caching.Client" />
	      </providers>
	    </sessionState>