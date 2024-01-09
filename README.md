# サブディレクトリパスにアップしたものが読み込まれない問題

[Next.jsで静的ビルドしたソースコードをサブディレクトリパスにデプロイする方法 | zenn](https://zenn.dev/chot/articles/99ae6acca1429b) 参考サイト

```js
/* 本番環境と開発環境の分岐用のフラグ */
const isProd = process.env.NODE_ENV === 'production'

/* 公開時のサブディレクトリ */
const SUB_DIRECTORY = "/260277p/maze_solver_3d";
const prefixPath = isProd ? SUB_DIRECTORY : ''

/** @type {import('next').NextConfig} */
const nextConfig = {
  assetPrefix: prefixPath,
  basePath: prefixPath,
  …
};
module.exports = nextConfig;
```

# 403エラーが偶発的に起こる問題

build時に名前が自動的に変わるファイルにサーバー側で権限がついていなかった

# This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.
