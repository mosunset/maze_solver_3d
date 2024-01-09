import Image from "next/image";
import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

import CodeBlock from "@/components/CodeBlock/CodeBlock";

import { readFileSync } from "fs";
import path from "path";
import { Console } from "console";

const loadFiles = () => {
  const files = ["maze", "maze_generation", "ui"];

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
        {files.map((file) => (
          <div key={file.name}>
            <div className="mb-4 text-2xl">{file.name}</div>
            <div className="mb-8 p-4 border rounded-lg overflow-x-scroll border-gray-700">
              <CodeBlock language="processing" code={file.code} />
            </div>
          </div>
        ))}
      </div>
    </>
  );
};

export default Code;
