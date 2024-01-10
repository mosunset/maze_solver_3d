import hljs from "highlight.js/lib/core";
// githubスタイルを導入する
import "highlight.js/styles/github.css";

import python from "highlight.js/lib/languages/python";
import processing from "highlight.js/lib/languages/processing";

hljs.registerLanguage("python", python);
hljs.registerLanguage("processing", processing);

type Props = {
  code: string;
  language: string;
};

export default function CodeBlock(props: Props) {
  // Processingで書かれたコードをハイライトする
  const highlightedCode: string = hljs
    .highlight(props.code, {
      language: props.language,
    })
    .value.replace(/^\s+?(\r\n|\n|\r)/gm, "$1")
    .replace(/^\s+?(\r\n|\n|\r)/gm, "$1")
    .replace(/^    /gm, '<span class="bg-red-200">    </span>')
    .replace(/\<\/span\>    /gm, '</span><span class="bg-pink-200">    </span>')
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-yellow-200">    </span>',
    )
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-green-200">    </span>',
    )
    .replace(/\<\/span\>    /gm, '</span><span class="bg-blue-200">    </span>')
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-indigo-200">    </span>',
    )
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-purple-200">    </span>',
    )
    .replace(/\<\/span\>    /gm, '<span class="bg-red-300">    </span>')
    .replace(/\<\/span\>    /gm, '</span><span class="bg-pink-300">    </span>')
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-yellow-300">    </span>',
    )
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-green-300">    </span>',
    )
    .replace(/\<\/span\>    /gm, '</span><span class="bg-blue-300">    </span>')
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-indigo-300">    </span>',
    )
    .replace(
      /\<\/span\>    /gm,
      '</span><span class="bg-purple-300">    </span>',
    );
  return (
    <div>
      <pre className="mb-4 p-2 border rounded-lg overflow-x-auto border-gray-700">
        <code dangerouslySetInnerHTML={{ __html: highlightedCode }} />
      </pre>
    </div>
  );
}
