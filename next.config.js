
const isProd = process.env.NODE_ENV === 'production'
const prefixPath = !isProd ? '/260277p/maze_solver_3d' : ''

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
