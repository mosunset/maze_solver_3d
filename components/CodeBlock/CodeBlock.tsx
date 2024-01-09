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
  const highlightedCode: string = hljs.highlight(props.code, {
    language: props.language,
  }).value;
  return (
    <pre>
      <code dangerouslySetInnerHTML={{ __html: highlightedCode }} />
    </pre>
  );
}
