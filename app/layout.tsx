import type { Metadata } from "next";
import { Inter } from "next/font/google";
import Link from "next/link";
import "@/app/globals.css";
import GoogleAnalytics from "@/components/GoogleAnalytics/GoogleAnalytics";

const inter = Inter({
  weight: ["400", "500"],
  subsets: ["latin"],
  display: "swap",
});

export const metadata: Metadata = {
  title: "Maze Solver 3D - 1260277",
  description:
    "情報科学応用最終課題説明ページ - Processingで作った3D迷路ゲームの解説",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="ja">
      <head>
        <GoogleAnalytics />
        {/* <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.css" /> */}
        {/* <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/default.min.css"
        /> */}
      </head>
      <body
        className={`${inter.className} relative flex min-h-screen flex-col`}
      >
        {children}
        <footer className="mx-auto mt-auto w-full max-w-[85rem] border-t-2 border-gray-400 px-4 py-10 sm:px-6 lg:px-8">
          <div className="text-center">
            <Link
              href="/"
              className="mx-auto block max-w-fit p-3 text-xl font-semibold text-black"
            >
              1260277
            </Link>
            <div className="m-3 text-gray-500">
              2024 高知工科大学 情報学群 浅野友哉 1260277.
              <span className="pl-2">|</span>
              <a
                href="https://github.com/mosunset/maze_solver_3d"
                target="_blank"
                rel="noopener noreferrer"
                className="p-4 pl-2 font-semibold text-blue-600 transition hover:text-orange-400 hover:underline hover:underline-offset-1"
              >
                GitHub
              </a>
            </div>
          </div>
        </footer>
      </body>
    </html>
  );
}
