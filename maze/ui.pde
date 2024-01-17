public class Ui{
    private final int margin = 8;
    private final int map_width = 14;

    public Ui() {}

    void view_ray2(ArrayList<Ray2> walls) {
        for (Ray2 wall : walls) {
            line(wall.begin().x, wall.begin().y, wall.end().x, wall.end().y);
        }
    }

    public void uiupdate() {
        if (mousePressed) {
            stroke(0,150);
            fill(0,0,0,150);
        } else{
            stroke(255,150);
            fill(255,255,255,150);
        }
        fill(0);
    }

    public void uptext() {
        String uptext = "FPS:" + nf(frameRate, 0, 2) + " TIME:" + nf(millis() / 1000.0, 0, 2);
        text(uptext , margin, margin * 2);
    }

    // 平均Level40
    public void level(int x,int y,int load,int distance) {
        float v = (float) distance / (load) * 100;
        String level = "level:" + nf(v * load, 0, 0);
        text(level , margin,x * map_width + margin * 5);
    }

    public void mini_maze(int[][] stage,int distance) {
        int x = stage.length;
        int y = stage[0].length;
        strokeWeight(0);
        stroke(150,150,150);
        for (int i = 0; i < y; i++) {
            for (int j = 0; j < x; j++) {
                //0:かべ 1:通路 2:スタート 3:ゴール 4:探索箇所 5:最短経路
                if (stage[j][i] == 0) {
                    fill(0);
                } else if (stage[j][i] == 1) {
                    fill(255);
                } else if (stage[j][i] == 2) {
                    fill(0,0,255);
                } else if (stage[j][i] ==  3) {
                    fill(255,0,0);
                } else if (stage[j][i] == 4) {
                    fill(100,255,255);
                } else if (stage[j][i] == 5) {
                    fill(0,255,0);
                }
                rect(j * map_width + margin, i * map_width + margin * 3, map_width, map_width);
            }
        }
        strokeWeight(1);
    }
    public void keyinputui(boolean[] keys) {
        int key_margin = 16;
        int square = 60;
        int x1, y1, x2, y2, x3, y3;
        float triangleSize = square / 1.5 / 2; // Adjust this to change the size of the triangle
        int fontsize = 24;
        textSize(fontsize);
        textAlign(CENTER);
        strokeWeight(1);
        stroke(50,100,50);

        color activeColor = color(0, 255, 0, 150);
        color inactiveColor = color(200, 200, 200, 150);

        if (keys[0]) {
            fill(activeColor);
        } else{
            fill(inactiveColor);
        }
        rect(key_margin * 2 + square, height - key_margin * 2 - square * 2, square, square); // W
        x1 = key_margin * 2 + square + square / 2;
        y1 = height - key_margin * 2 - square * 2 + square / 2;
        triangle(x1, y1 - triangleSize, x1 - triangleSize, y1 + triangleSize, x1 + triangleSize, y1 + triangleSize);
        fill(0);
        text("W",x1,y1 + fontsize / 2.2);

        if (keys[1]) {
            fill(activeColor);
        } else{
            fill(inactiveColor);
        }
        rect(key_margin, height - key_margin - square, square, square); // A
        x1 = key_margin + square / 2;
        y1 = height - key_margin - square + square / 2;
        triangle(x1 - triangleSize, y1, x1 + triangleSize, y1 - triangleSize, x1 + triangleSize, y1 + triangleSize);
        fill(0);
        text("A",x1,y1 + fontsize / 2.2);

        if (keys[2]) {
            fill(activeColor);
        } else{
            fill(inactiveColor);
        }
        rect(key_margin * 2 + square, height - key_margin - square, square, square); // S
        x1 = key_margin * 2 + square + square / 2;
        y1 = height - key_margin - square + square / 2;
        triangle(x1, y1 + triangleSize, x1 - triangleSize, y1 - triangleSize, x1 + triangleSize, y1 - triangleSize);
        fill(0);
        text("S",x1,y1 + fontsize / 2.2);

        if (keys[3]) {
            fill(activeColor);
        } else{
            fill(inactiveColor);
        }
        rect(key_margin * 3 + square * 2, height - key_margin - square, square, square); // D
        x1 = key_margin * 3 + square * 2 + square / 2;
        y1 = height - key_margin - square + square / 2;
        triangle(x1 + triangleSize, y1, x1 - triangleSize, y1 - triangleSize, x1 - triangleSize, y1 + triangleSize);
        fill(0);
        text("D",x1,y1 + fontsize / 2.2);

        if (keys[4]) {
            fill(activeColor);
        } else{
            fill(inactiveColor);
        }
        rect(width - square * 3 - key_margin * 3, height - key_margin - square, square, square); // J
        x1 = width - square * 3 - key_margin * 3 + square / 2;
        y1 = height - key_margin - square + square / 2;
        triangle(x1 - triangleSize, y1, x1 + triangleSize, y1 - triangleSize, x1 + triangleSize, y1 + triangleSize);
        fill(0);
        text("J",x1,y1 + fontsize / 2.2);

        if (keys[5]) {
            fill(activeColor);
        } else{
            fill(inactiveColor);
        }
        rect(width - square - key_margin, height - key_margin - square, square, square); // L
        x1 = width - square - key_margin + square / 2;
        y1 = height - key_margin - square + square / 2;
        triangle(x1 + triangleSize, y1, x1 - triangleSize, y1 - triangleSize, x1 - triangleSize, y1 + triangleSize);
        fill(0);
        text("L",x1,y1 + fontsize / 2.2);

        //リセット
        fill(inactiveColor);
        textSize(16);
        textAlign(LEFT);

    }
}
