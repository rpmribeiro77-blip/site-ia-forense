# Deploy no Cloudflare Pages (grátis)

## 1) Subir para GitHub

No diretório do projeto:

```powershell
git init
git add .
git commit -m "feat: mvp inicial do site IA Forense"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/site-ia-forense.git
git push -u origin main
```

## 2) Conectar no Cloudflare Pages

1. Acesse Cloudflare Dashboard > Pages > Create project.
2. Conecte seu repositório GitHub.
3. Configure:
   - Framework preset: `Astro`
   - Build command: `npm run build`
   - Build output directory: `dist`
   - Node.js version: `20`
4. Deploy.

## 3) Atualizações de conteúdo

Cada novo commit em `main` publica automaticamente.

## 4) Domínio depois

Quando registrar domínio, basta:

1. Pages > Custom domains.
2. Adicionar o domínio.
3. Ajustar DNS conforme instruções do Cloudflare.
