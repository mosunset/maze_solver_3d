public class Ui{
    private final int margin = 8;
    private final int width = 12;
    private float avelevel;
    
    public Ui() {}
    
    
    public void fps() {
        String fps = "FPS:" + nf(frameRate, 0, 2);
        text(fps , margin, margin * 2);
    }
    
    // 平均Level40
    public void level(int x,int y,int load,int distance) {
        float v = (float) distance / (load) * 100;
        String level = "level(%):" + nf(v, 0, 2);
        text(level , margin,(height - y * width) - margin * 2);
    }
    
    public void mini_maze(int[][] stage,int distance) {
        int x = stage.length;
        int y = stage[0].length;
        strokeWeight(1);
        stroke(150,150,150);
        for (int i = 0; i < y; i++) {
            for (int j = 0; j < x; j++) {
                //0:かべ 1:通路 2:スタート 3:ゴール 4:探索箇所 5:最短経路
                if (stage[i][j] == 0) {
                    fill(0);
                } else if (stage[i][j] == 1) {
                    fill(255);
                } else if (stage[i][j] == 2) {
                    fill(0,0,255);
                } else if (stage[i][j] ==  3) {
                    fill(255,0,0);
                } else if (stage[i][j] == 4) {
                    fill(100,255,255);
                } else if (stage[i][j] == 5) {
                    fill(0,255,0);
                }
                rect(j * width + margin,(height - (y - i) * width) - margin, width, width);
            }
        }
    }
}