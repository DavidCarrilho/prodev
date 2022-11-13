# HTTP

> ## Suceso

1. ✅ Request com verbo http válid (post)
2. ✅ Passar nos headres o content type json
3. ✅ Chamar request com o body correto
4. ✅ OK - 200 e resposta com o dados
5. ✅ No content - 204 e resposta sem o dados

> ## Erros

1. ✅ Bad request - 400
2. ✅ Unauthorized - 401
3. ✅ Forbidden - 403
4. Not found - 404
5. ✅ Internal server error - 500

> ## Exeção - Status code diferente dos citados acima

1. ✅ Internal server error - 500

> ## Exeção - Http request deu alguma exeção

1. Internal server error - 500

> ## Exeção - Verbo http inválido

1. Internal server error - 500
