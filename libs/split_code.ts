import { readFileSync } from "fs";

export const split = (
  file: string,
  start_match: string,
  end_match: string,
  space_len: number,
) => {
  try {
    let code = readFileSync(file, "utf8");
    const start = new RegExp(
      "^" + start_match.replace(/[.*+\-?^${}()|[\]\\\/]/gu, "\\$&"),
      "mu",
    );
    const match = code.match(start);
    const start_index: number = match?.index ?? -1;

    //   console.log("start_index", start_index);

    const end = new RegExp(
      "^" + end_match.replace(/[.*+\-?^${}()|[\]\\]/gu, "\\$&") + "$",
      "mu",
    );
    const endMatch = code.slice(start_index).match(end)?.index;
    let end_index: number;

    if (endMatch) {
      end_index = endMatch + start_index + space_len + 1;
    } else {
      return;
    }

    //   console.log("end_index", end_index);

    let space = "";
    let i = 0;
    for (i = 0; i < space_len; i++) {
      space += " ";
    }
    const re_space = new RegExp("^" + space, "gm");

    return code
      .slice(start_index, end_index)
      .replace(re_space, "")
      .replace(/^\s+?(\r\n|\n|\r)/gm, "$1")
      .replace(/^\s+?(\r\n|\n|\r)/gm, "$1")
      .replace(/^\s+?(\r\n|\n|\r)/gm, "$1");
  } catch (error) {
    return;
  }
};
