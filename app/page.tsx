import Image from "next/image";
import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

import CodeBlock from "@/components/CodeBlock/CodeBlock";

import path from "path";

import { split, all } from "@/libs/split_code";
import Code from "./code/page";

const Home = () => {
  const files = ["maze", "maze_generation", "ui", "userinput","player","maze_ray2","ray2","vec2"];
  const file0 = path.join(process.cwd(), `maze/${files[0]}.pde`);
  const file1 = path.join(process.cwd(), `maze/${files[1]}.pde`);
  const file2 = path.join(process.cwd(), `maze/${files[2]}.pde`);
  return (
    <>
      <div className="mb-4 text-2xl border-b border-gray-500 pb-2">
        情報科学応用 最終課題 説明
      </div>
      <div id="description">
        <h2>ゲーム概要</h2>
        <p>3Dで迷路の中を自由に探索することができる</p>
        <p>
          ゲーム開始～ゴール地点に到達
          までを測るタイマーがあり、タイムを競うことができる
        </p>
        <p>通った道の履歴がわかり、ゴール後、最短経路との比較ができる</p>

        <h2>操作方法</h2>
        <p>WASDで前後左右</p>
        <p>JLで視点の左右</p>

        <h2>迷路生成について</h2>
        <h3>穴掘り法</h3>
        <p>迷路作成には穴掘り法を使った</p>
        <p>穴掘り方は、次のようにして迷路を生成する</p>
        <ul className="list-decimal ml-8">
          <li>奇数✕奇数の範囲の迷路の領域をすべて壁で埋め尽くす。</li>
          <li>
            ランダムな場所から「穴を掘る」。このプログラムでは（1,1）から2ます「穴を掘る」。
          </li>
          <li>
            作った穴から、まだ掘っていない方向にランダムに「新しい穴を掘る」。
          </li>
          <li>
            進めなくなったら進める箇所まで戻って、まだ掘っていない方向にランダムに「新しい穴を掘る」。
          </li>
          <li>3のプロセスを繰り返し、穴が繋がって迷路が完成するまで続ける。</li>
        </ul>
        <div>
          <details className="">
            <summary className="sm:-mb-4 mt-4 group hover:underline ">
              {(file1.match(/([^\\]+)$/)?.[1] ?? "") + " の一部"}
              <span className="text-right inline-block w-full sm:-translate-y-7 group hover:underline">
                クリックで開閉
              </span>
            </summary>
            <CodeBlock
              language="processing"
              code={split(file1, "    // 迷路生成 穴掘り法", "    }", 4) ?? ""}
            />
          </details>
        </div>
        <div className="flex flex-wrap gap-x-8 gap-y-2">
          <div>
            <p>コード参考1 | Algoful</p>
            <a
              href="https://algoful.com/Archive/Algorithm/MazeDig"
              target="_blank"
              rel="noopener noreferrer"
              className="block p-2 mx-2 text-gray-900 transition hover:text-orange-400 underline hover:underline-offset-1"
            >
              迷路生成(穴掘り法)…
            </a>
          </div>
          <div>
            <p>コード参考2 | Qiita@naru_1017</p>
            <a
              href="https://qiita.com/naru_1017/items/e4d017433372a313aeb3"
              target="_blank"
              rel="noopener noreferrer"
              className="block p-2 mx-2 text-gray-900 transition hover:text-orange-400 underline hover:underline-offset-1"
            >
              穴掘り法を使って…
            </a>
          </div>
        </div>
        <h3>A*（A-star）</h3>
        <p>迷路の最短経路の探索にはA*（A-star）アルゴリズムを使った</p>
        <p>A*アルゴリズムは、次のようにして探索する</p>
        <ul className="list-decimal ml-8">
          <li>始点ノードをオープンリストに挿入する</li>
          <li>
            オープンリストからコストが最小のノードを取り出し、それを現在地とする
          </li>
          <li>
            現在地が目的地なら終了。そうでなければ現在地から接続している未探索のノードをオープンリストに挿入する
          </li>
          <li>2,3のプロセスを繰り返す</li>
        </ul>
        <p>コスト関数は以下の式で計算する。</p>
        <CodeBlock language="python" code="f(n) = g(n) + h(n)"></CodeBlock>
        <p>ここで、</p>
        <p>g(n): 始点からノードnへの実コスト(移動に要したコスト)</p>
        <p>h(n): ノードnから推定される目的地へのコスト</p>
        <p>
          このコードではゴール位置がわかっているためh(n)は直線距離としている
        </p>
        <div>
          <details className="">
            <summary className="sm:-mb-4 mt-4 group hover:underline ">
              {(file1.match(/([^\\]+)$/)?.[1] ?? "") + " の一部"}
              <span className="text-right inline-block w-full sm:-translate-y-7 group hover:underline">
                クリックで開閉
              </span>
            </summary>
            <CodeBlock
              language="processing"
              code={split(file1, "    // A*アルゴリズム", "    }", 4) ?? ""}
            />
            <CodeBlock
              language="processing"
              code={
                split(
                  file1,
                  "    // ノードクラス（迷路上のセルを表す）",
                  "    }",
                  4,
                ) ?? ""
              }
            />
          </details>
        </div>
        <div className="flex flex-wrap gap-x-8 gap-y-2">
          <div>
            <p>コード参考1</p>
            <a
              href="https://stone-program.com/python/algorithm/a-star-introduction/"
              target="_blank"
              rel="noopener noreferrer"
              className="block p-2 mx-2 text-gray-900 transition hover:text-orange-400 underline hover:underline-offset-1"
            >
              簡単なA* （A star）…
            </a>
          </div>
        </div>

        <h2>迷路の3D描画について</h2>
        <p>
          レイキャスティングという手法で、2Dの迷路情報とプレイヤーの現在地点と視点情報から、決め打ちで高さを描画している
        </p>
        <div className="flex flex-wrap gap-x-8 gap-y-2">
          <div>
            <p>コード参考1 | YouTube</p>
            <a
              href="https://youtu.be/Mtf4rz9UEQo?t=137"
              target="_blank"
              rel="noopener noreferrer"
              className="block p-2 mx-2 text-gray-900 transition hover:text-orange-400 underline hover:underline-offset-1"
            >
              高校数学とJavaScript…
            </a>
          </div>
          <div>
            <p>コード参考2 | scratch</p>
            <a
              href="https://scratch.coach/lesson/easy-raycasting001/"
              target="_blank"
              rel="noopener noreferrer"
              className="block p-2 mx-2 text-gray-900 transition hover:text-orange-400 underline hover:underline-offset-1"
            >
              スクラッチゲームを3D…
            </a>
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
