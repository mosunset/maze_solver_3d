import Image from "next/image";
import { basePath } from "@/next.config";
const BASE_PATH = basePath ? basePath : "";

const Code = () => {
  return (
    <>
      <div>code</div>
      <div>
        <pre>
          <code className="language-bash">chmod 400 key.pem</code>
        </pre>
      </div>
    </>
  );
};

export default Code;
