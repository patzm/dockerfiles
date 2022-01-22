# Dynamic Proxy Server (DPS)

By default, it is not possible to find Docker 🐋 containers by their host name.
Only pinging them directly with their IP works.
However, the IP might change.
https://github.com/mageddo/dns-proxy-server provides the solution.
If a container has a `hostname` explicitly called out, it can link it to its IP and make that also available in the host.
