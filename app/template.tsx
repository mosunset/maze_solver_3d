"use client";
import { usePathname } from "next/navigation";

import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

import Link from "next/link";

export default function Template({ children }: { children: React.ReactNode }) {
  // 現在のページのパスを取得
  const pathname = usePathname();
  const className_my =
    "min-w-fit text-lg font-medium px-1 py-2 underline underline-offset-1 text-blue-700 sm:px-2 sm:py-6";
  const className_any =
    "min-w-fit text-lg font-medium px-1 py-2 text-gray-900 transition hover:text-orange-400 hover:underline hover:underline-offset-1 sm:px-2 sm:py-6";

  return (
    <>
      <header className="z-50 w-full border-b border-gray-200 bg-white py-3 text-sm sm:flex-nowrap sm:justify-start sm:py-0">
        <nav
          className="relative mx-auto w-full max-w-7xl px-4 sm:flex sm:items-center sm:justify-between sm:px-6 lg:px-8"
          aria-label="Global"
        >
          <h1 className="flex items-center justify-center">
            <Link
              href="/"
              className=" text-xl font-semibold sm:flex-nowrap sm:justify-start sm:py-6"
            >
              Maze Solver 3D - 1260277
            </Link>
          </h1>
          <div className="ms:max-w-fit hs-collapse flex items-center justify-center overflow-hidden">
            <div className="mt-2.5 flex gap-x-0 gap-y-2 sm:mt-0 sm:flex-row sm:items-center sm:justify-end sm:gap-x-1 sm:gap-y-0 sm:ps-7">
              <Link
                href="/"
                className={pathname === "/" ? className_my : className_any}
              >
                Home
              </Link>
              <Link
                href="/code/"
                className={pathname === "/code/" ? className_my : className_any}
              >
                Code
              </Link>
            </div>
          </div>
        </nav>
      </header>
      <main className="mx-auto w-full max-w-7xl items-center justify-between overflow-y-hidden p-4 sm:p-6 lg:p-8">
        {children}
      </main>
    </>
  );
}
