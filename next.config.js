/* 本番環境と開発環境の分岐用のフラグ */
const isProd = process.env.NODE_ENV === 'production'
console.log(process.env.NODE_ENV)

/* 公開時のサブディレクトリ */
const SUB_DIRECTORY = "/260277p/maze_solver_3d";
const prefixPath = isProd ? SUB_DIRECTORY : ''

/** @type {import('next').NextConfig} */
const nextConfig = {
  assetPrefix: prefixPath,
  basePath: prefixPath,
  reactStrictMode: true,
  trailingSlash: true,
  output: "export",
  images: {
    unoptimized: true,
  },
};

module.exports = nextConfig;
