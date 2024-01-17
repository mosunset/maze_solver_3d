import java.util.ArrayList;

public class Maze_ray2{
    public Maze_ray2() {}

    private ArrayList<Ray2> maze_stage;

    private int[][] temp_stage;

    //0:かべ 1:通路 2:スタート 3:ゴール 4:探索箇所 5:最短経路
    public void create_ray2(int[][] stage) {
        int y = stage.length;
        int x = stage[0].length;

        temp_stage = new int[y][x];
        for (int j = 0; j < x; j++) {
            for (int i = 0; i < y; i++) {

                int currentCell = stage[i][j];

                // 自身が壁の場合 右に壁がある場合2桁目を1 下に…1桁目を1 それ以外0
                if (currentCell == 0) {
                    // 右
                    int right = (j < y - 1) ? stage[i][j + 1] : 0;
                    // 下
                    int below = (i < x - 1) ? stage[i + 1][j] : 0;

                    // 2進数の桁を更新
                    int binaryRepresentation = 0;
                    binaryRepresentation |= (right == 0) ? 1 : 0;
                    binaryRepresentation |= (below == 0) ? 2 : 0;

                    // 更新した2進数を使ってます目を更新
                    temp_stage[i][j] = binaryRepresentation;
                } else{
                    temp_stage[i][j] = 0;
                }
                temp_stage[y - 1][j] = 1;
                temp_stage[i][x - 1] = 2;
                temp_stage[y - 1][x - 1] = 0;
                // print(temp_stage[i][j]);
            }

            // print("\n");
        }

        ArrayList<Ray2> walls = new ArrayList<Ray2>();
        int margin = 8;
        int map_width = 14;
        for (int j = 0; j < x; j++) {
            for (int i = 0; i < y; i++) {
                if (temp_stage[i][j] == 2 || temp_stage[i][j] == 3) {
                    // print(i + 1,j + 1);
                    walls.add(new Ray2().with2p(new Vec2((i + 1) + (( -(map_width / 2) + margin) / 14),(j + 1) + 0.2 + (( -(map_width / 2) + margin * 3) / 14)).mult(14), new Vec2((i + 2) + (( -(map_width / 2) + margin) / 14),(j + 1) + 0.2 + (( -(map_width / 2) + margin * 3) / 14)).mult(14)));
                }
                if (temp_stage[i][j] == 1 || temp_stage[i][j] == 3) {
                    // print(i + 1,j + 1);
                    walls.add(new Ray2().with2p(new Vec2((i + 1) + (( -(map_width / 2) + margin) / 14),(j + 1) + 0.2 + (( -(map_width / 2) + margin * 3) / 14)).mult(14), new Vec2((i + 1) + (( -(map_width / 2) + margin) / 14),(j + 2) + 0.2 + (( -(map_width / 2) + margin * 3) / 14)).mult(14)));
                }

            }
            // print("\n");
        }
        maze_stage = walls;
    }
    public ArrayList<Ray2> get_maze_ray2() {
        return maze_stage;
    }
}
