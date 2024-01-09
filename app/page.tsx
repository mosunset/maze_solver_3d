import Image from "next/image";
import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

const Home = () => {
  return (
    <>
      <div className="mb-4 text-2xl border-b border-gray-500 pb-2">
        情報科学応用 最終課題 説明コメント
      </div>
      <div id="description">
        <p>3Dで迷路の中を自由に探索することができる</p>
      </div>
    </>
  );
};

export default Home;
