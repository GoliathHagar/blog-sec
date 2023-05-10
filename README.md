# blog-sec

- [API - Instructions](./src/backend/readme.md)


## Servers
- Authorization server (Keycloak)

```bash
address: http://localhost:9000
user: blog_auth
pass: blog461m1n
```
- Blog Api (Spring Boot)
Use [JWT.IO](https://jwt.io) to inspect tokens.

```bash
curl -H "Authorization: Bearer jtwToken" http://localhost:8080 

exemple 
curl -H "Authorization:  Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJGWnIwOVdrVHpNbWhadDdTeHhrZjFQSC1lNnMxS2R6VU41TW1ISXdyanhnIn0.eyJleHAiOjE2ODM3MzI0MjYsImlhdCI6MTY4MzczMjEyNiwiYXV0aF90aW1lIjoxNjgzNzMyMTI2LCJqdGkiOiIxNDEwMGI0Ny1lMjE3LTRmNWQtOGJmOC03NjMwMDZmZDNkY2QiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjkwMDAvcmVhbG1zL2Jsb2ctc2VjIiwiYXVkIjpbImJsb2ctc2VjLWF1ZCIsImFjY291bnQiXSwic3ViIjoiOGNiMTY0ZDEtZDdkNi00ZmM0LThjOTQtNDMyNWJiNjNjY2EyIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYmxvZy1hcHAtc2VydmljZSIsInNlc3Npb25fc3RhdGUiOiI0NmI5ZjljNC02YWNiLTQ2MTgtOTg2Yy01OWJmZmE5YzIxODAiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsiZWRpdDpibG9nIiwib2ZmbGluZV9hY2Nlc3MiLCJkZWZhdWx0LXJvbGVzLWJsb2ctc2VjIiwidW1hX2F1dGhvcml6YXRpb24iLCJlZGl0OnBvc3QiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIGF1ZCIsInNpZCI6IjQ2YjlmOWM0LTZhY2ItNDYxOC05ODZjLTU5YmZmYTljMjE4MCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiSnVuaW9yICBNb250ZWlybyIsInByZWZlcnJlZF91c2VybmFtZSI6Imp1bmlvciIsImdpdmVuX25hbWUiOiJKdW5pb3IgIiwiZmFtaWx5X25hbWUiOiJNb250ZWlybyIsImVtYWlsIjoianVuaW9yQGJsb2dzZWMuY29tIn0.VNcquK8zyylw4sV9j1TsPEwZoJIOUfywlj0GiZOKLBo7d3TowZt4v4DgzyZx8Tx4B8OA7uDr3SuTdFICDs_KLLr45vbJGa67nhpLU1hMp45bV1bb1gf9cHKOA0mNeQ3GJpXlIATtEbHr0IrR5lM8Tx2g5DSeylL8_QtIwTW4TUQORhp6PpL-qkq24e_ctvO-OmJPKNANkmt2fa4-8LKIYjKbulNLUnowgNvn96yGIibFCOaoOCf7HRJAt-zJ6qanZkgcRShPgylfIeaFEmoLTs_aG_wUgUitm7E4d7_3XViOIEYgdABcLn6qpG5C2dZcTRgzegssbF8uCsblBC1btg'" http://localhost:8080/post/1
```

- Blog UI (Undefined)

