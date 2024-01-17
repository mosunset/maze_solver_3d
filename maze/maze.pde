/** <a href="https://www.ugs.kochi-tech.ac.jp/260277p/maze_solver_3d/"> */

Maze_Generation stage;
Ui ui;
Userinput userinput = new Userinput();
Maze_ray2 maze_ray2;
Player player = new Player();

void settings() {
    size(1024, 576);
    randomSeed(1);

    // 5以上の奇数
    stage = new Maze_Generation(17);
    ui = new Ui();
    maze_ray2 = new Maze_ray2();
    maze_ray2.create_ray2(stage.get_stage());
    player.pos.x = 29;
    player.pos.y = 45;
}

void setup() {
    // translate(width / 2,height / 2);
    background(50,50,50);
}

int i = 0;
void draw() {
    background(100,100,100);
    strokeWeight(0);
    // 3D 描画順最背面

    // 表示について
    // stageの表示
    ui.mini_maze(stage.get_stage_anser(),stage.get_distance());
    // stageの線分情報の表示
    ui.view_ray2(maze_ray2.get_maze_ray2());


    stroke(255, 0, 0);
    strokeWeight(16);
    point(player.pos.x, player.pos.y);

    if(keyPressed && keyCode == LEFT){
        player.angle -= PI / 120;
    }
    if(keyPressed && keyCode == RIGHT){
        player.angle += PI / 120;
    }

    float fov = PI / 2;
    float centerAngle = player.angle;
    float leftAngle = centerAngle - fov / 2;
    float rightAngle = centerAngle + fov / 2;
    float beamTotal = 40;
    float beamIndex = -1;

    for (float angle = leftAngle; angle < rightAngle + 0.01; angle += fov / beamTotal) {
        beamIndex++;
        Ray2 beam = new Ray2(
            player.pos.copy(),
            new Vec2(cos(angle), sin(angle)).mult(100)
        );

        stroke(255, 0, 0);
        strokeWeight(2);
        Ray2 player_eye = new Ray2(player.pos.copy(),new Vec2(cos(centerAngle), sin(centerAngle)).mult(20));
        line(player_eye.begin().x, player_eye.begin().y, player_eye.end().x, player_eye.end().y);

        for (int i = 0; i < maze_ray2.get_maze_ray2().size(); i++) {
            Ray2 wall = maze_ray2.get_maze_ray2().get(i);
            Vec2 hitPos = beam.intersection(wall);
            if (hitPos == null){
                continue;
            }
            // stroke(255, 255, 0);
            // strokeWeight(5);
            // point(hitPos.x, hitPos.y);

            Vec2 viewRoot = new Vec2(320, 180);
            float wallDist = hitPos.sub(beam.begin()).mag();
            float wallPerpDist = wallDist;
            float lineHeight = 2800 / wallPerpDist;
            Vec2 lineBegin = viewRoot.add(new Vec2(300 / beamTotal * beamIndex, -lineHeight / 2));
            Vec2 lineEnd = lineBegin.add(new Vec2(0, lineHeight));
            stroke(0);
            strokeWeight(5);
            line(lineBegin.x, lineBegin.y, lineEnd.x, lineEnd.y);
        }
    }









    // 表示について 最前面
    // 情報文字
    ui.uptext();
    // 難易度
    ui.level(stage.get_x(),stage.get_y(),stage.get_load(),stage.get_distance());
    // ui.uiupdate();
    // キー入力
    ui.keyinputui(userinput.get_key());
}

void keyPressed() {
    // キーが押された瞬間の処理
    userinput.keyin(keyCode);
}

void keyReleased() {
    userinput.keyrelese(keyCode);
}

void mouseDragged() {
  player.pos.x = mouseX;
  player.pos.y = mouseY;
}
