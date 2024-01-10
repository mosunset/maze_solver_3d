import Image from "next/image";
import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

import CodeBlock from "@/components/CodeBlock/CodeBlock";

import path from "path";

import { split } from "@/libs/split_code";

const Home = () => {
  const files = ["maze", "maze_generation", "ui"];
  const file0 = path.join(process.cwd(), `maze/${files[0]}.pde`);
  const file1 = path.join(process.cwd(), `maze/${files[1]}.pde`);
  const file2 = path.join(process.cwd(), `maze/${files[2]}.pde`);
  return (
    <>
      <div className="mb-4 text-2xl border-b border-gray-500 pb-2">
        情報科学応用 最終課題 説明コメント
      </div>
      <div id="description">
        <div>
          <p className="mb-2 text-xl">{file1.match(/([^\\]+)$/)?.[1] ?? ""}</p>
          <CodeBlock
            language="processing"
            code={split(file1, "    // 迷路生成 穴掘り法", "    }", 4) ?? ""}
          />
        </div>
        <p>3Dで迷路の中を自由に探索することができる</p>
        <p>
          https://algoful.com/Archive/Algorithm/MazeDig
          https://qiita.com/naru_1017/items/e4d017433372a313aeb3
          https://stone-program.com/python/algorithm/a-star-introduction/
        </p>
      </div>
    </>
  );
};

export default Home;
