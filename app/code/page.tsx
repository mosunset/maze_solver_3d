import Image from "next/image";
import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

import CodeBlock from "@/components/CodeBlock/CodeBlock";

import { readFileSync } from "fs";
import path from "path";

const loadFiles = () => {
  const files = ["maze", "maze_generation", "ui", "userinput"];

  return files.map((file, index) => {
    const filepath = path.join(process.cwd(), `maze/${file}.pde`);
    let filecode = readFileSync(filepath, "utf8");

    // このプロジェクトへのコメント部分を削除
    if (file == files[0]) {
      // filecode = filecode.replace(/.*\r\n.*\r\n/,"");
    }

    return {
      name: "file " + (index + 1) + ", " + file + ".pde",
      code: filecode,
    };
  });
};

const Code = () => {
  const files = loadFiles();
  return (
    <>
      <div>
        <div className="text-2xl mb-4">コード一覧</div>
        {files.map((file, index) => (
          <details key={file.name}>
            <summary className="mb-2 sm:-mb-4 text-xl group hover:underline ">
              {file.name}
              <span className="text-right inline-block w-full sm:-translate-y-7 groupe hover:underline">
                クリックで開閉
              </span>
            </summary>
            <div>
              {/* <p>{file.name}</p> */}
              <CodeBlock language="processing" code={file.code} />
            </div>
          </details>
        ))}
      </div>
    </>
  );
};

export default Code;
