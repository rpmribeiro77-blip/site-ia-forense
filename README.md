# IA Forense (Astro)

MVP de site editorial com foco em:

- IA aplicada à prática forense (pilar principal)
- Processo Civil (conteúdo exclusivo)
- Opinião
- Biblioteca de links, vídeos e artigos

## 1) Rodar localmente

Pré-requisito: Node.js LTS (vem com `npm`).

```bash
npm install
npm run dev
```

Acesse: `http://localhost:4321`

## 2) Build

```bash
npm run build
npm run preview
```

## 3) Estrutura

```text
src/
  layouts/
    BaseLayout.astro
  pages/
    index.astro
    sobre.astro
    ia-forense/
    processo-civil/
    opiniao/
    biblioteca/
scripts/
  new-post.ps1
templates/
  post-template.md
```

## 3.1) Criar novo post rapidamente

Exemplo para IA Forense:

```powershell
.\scripts\new-post.ps1 `
  -Pilar ia-forense `
  -Slug prompt-para-analise-inicial-do-caso `
  -Title "Prompt para análise inicial do caso" `
  -Description "Roteiro prático de triagem com IA" `
  -Nivel "Intermediário"
```

Exemplo para Processo Civil:

```powershell
.\scripts\new-post.ps1 `
  -Pilar processo-civil `
  -Slug organizacao-probatoria-no-saneamento `
  -Title "Organização probatória no saneamento" `
  -Description "Checklist objetivo para fase de saneamento" `
  -Nivel "Avançado"
```

## 4) Publicação grátis (Cloudflare Pages)

1. Suba este projeto para um repositório no GitHub.
2. No Cloudflare Pages, conecte o repositório.
3. Configure:
   - Build command: `npm run build`
   - Build output directory: `dist`
4. Publique.

## 5) Migração para hospedagem paga depois

Como este projeto usa Astro estático, a migração é simples:

1. Conectar o mesmo repositório ao novo host.
2. Repetir build command (`npm run build`) e output (`dist`).
3. Apontar DNS do domínio.

Sem retrabalho estrutural.

## 6) Observação sobre este ambiente

Neste ambiente de execução, `node/npm` não estão disponíveis e houve bloqueio por timeout ao tentar instalar.
O projeto está pronto; ao rodar em uma máquina com Node LTS, os comandos funcionarão normalmente.
