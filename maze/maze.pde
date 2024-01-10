/** <a href="https://www.ugs.kochi-tech.ac.jp/260277p/maze_solver_3d/"> */

Maze_Generation stage;
Ui ui;

void settings() {
    // settings()関数は、Processingスケッチが初期化されるときに呼び出されます。
    // 通常、ウィンドウのサイズやピクセルのフォーマット、レンダリングエンジンなど、グローバルな設定を行うために使用されます。
    // この関数は省略可能で、定義されていない場合、Processingはデフォルトの設定を使用します。
    size(1024, 576);
    randomSeed(1);

    // 5以上の奇数
    stage = new Maze_Generation(37);
    ui = new Ui();
}

void setup() {
    // setup()関数は、settings()の後に1回だけ呼び出され、スケッチの初期化を行います。
    // 通常、一度だけ実行する必要のある初期化コードや、スケッチが開始されたときに行いたい初期化作業が含まれます。
    // translate(width / 2,height / 2);
    background(50,50,50);
}

int i = 0;
void draw() {
    // draw()関数は、setup()の後に繰り返し呼び出されます。
    //通常、1秒間に約60回呼び出され、連続的なアニメーションや動的な描画を行うために使用されます。
    // draw()には、フレームごとに更新される描画コードが含まれます。
    background(100,100,100);
    strokeWeight(0);
    if (i == 0) {
        if (mousePressed) {
            stage = new Maze_Generation(37);
        }
    }
    i++;
    if (i > 30) {
        i = 0;
    }
    //ui.mini_maze(stage.get_stage());
    ui.mini_maze(stage.get_stage_anser(),stage.get_distance());
    ui.fps();
    ui.level(stage.get_x(),stage.get_y(),stage.get_load(),stage.get_distance());
}
