import Link from "next/link";

const Custom404 = () => {
  return (
    <>
      <div className="text-center">
        <h1 className="block text-7xl font-bold text-gray-800 sm:text-9xl ">
          404
        </h1>
        <h1 className="block text-2xl font-bold text-white"></h1>
        <p className="mt-3 text-gray-600 ">
          おっと、何かがうまくいきませんでした。
        </p>
        <p className="text-gray-600 ">
          申し訳ありませんが、ページが見つかりませんでした。
        </p>
        <div className="mt-5 flex flex-col items-center justify-center gap-2 sm:flex-row sm:gap-3">
          <Link
            className="inline-flex w-full items-center justify-center gap-x-2 rounded-lg border border-transparent px-4 py-3 text-sm font-semibold text-blue-600 hover:text-blue-800 disabled:pointer-events-none disabled:opacity-50 sm:w-auto "
            href="/"
          >
            <svg
              className="h-4 w-4 flex-shrink-0"
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="m15 18-6-6 6-6" />
            </svg>
            ホームに戻る
          </Link>
        </div>
      </div>
    </>
  );
};

export default Custom404;
