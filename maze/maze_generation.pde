import java.util.Arrays;
import java.util.Collections;
import java.util.Random;
import java.util.Comparator;
import java.util.HashSet;
import java.util.PriorityQueue;
import java.util.Objects;

public class Maze_Generation{
    private int[][] stage;//0:かべ 1:通路 2:スタート 3:ゴール
    private int[][] stage_anser;//0:かべ 1:通路 2:スタート 3:ゴール 4:探索箇所 5:最短経路
    private int x;
    private int y;
    private int[] start;
    private int[] goal;
    private int distance = 0;
    private int load = 0;
    private final int[][] dx = {{1,2} ,{ - 1, -2} ,{0,0} ,{0,0} };//x軸のベクトル
    private final int[][] dy = {{0,0} ,{0,0} ,{1,2} ,{ - 1, -2} };//y軸のベクトル

    public Maze_Generation(int x, int y) {
        initialize_stage(x,  y);
    }

    public Maze_Generation(int xy) {
        initialize_stage(xy,  xy);
    }
    public int[][] get_stage() {
        return this.stage;
    }
    public int[][] get_stage_anser() {
        return this.stage_anser;
    }
    public int get_distance() {
        return distance;
    }
    public int get_x() {
        return x;
    }
    public int get_y() {
        return y;
    }
    public int get_load() {
        return load;
    }
    private void initialize_stage(int x, int y) {
        // 5未満のサイズや偶数では生成できない
        if (x < 5) x = 5;
        if (y < 5) y = 5;
        if (x % 2 == 0) x++;
        if (y % 2 == 0) y++;
        this.x = x;
        this.y = y;
        this.stage = new int[this.y][this.x];
        this.stage_anser = new int[this.y][this.x];
        // 値の初期化
        for (int i = 0; i < this.y; i++) {
            for (int j = 0; j < this.x; j++) {
                this.stage[i][j] = 0;
            }
        }

        // 迷路生成
        this.start = new int[]{1,1};
        this.goal = new int[]{this.y - 2,this.x - 2};
        this.stage[this.start[0]][this.start[1]] = 1;
        generate_stage(this.start[0], this.start[1]);

        for (int i = 0; i < this.y; i++) {
            for (int j = 0; j < this.x; j++) {
                this.stage_anser[i][j] = this.stage[i][j];
                if (this.stage[i][j] == 1) {
                    load++;
                }
                // デバッグ用
                //print(this.stage[i][j]);
            }
            //println("");
        }

        // 迷路攻略
        a_star(this.start,this.goal);
        this.stage[this.start[0]][this.start[1]] = 2;
        this.stage[this.goal[0]][this.goal[1]] = 3;
    }

    // 迷路生成 穴掘り法
    private void generate_stage(int ny,int nx) {
        ArrayList<Integer> array = new ArrayList<Integer>(Arrays.asList(0, 1, 2, 3));
        Collections.shuffle(array); // ランダム方向

        for (int i : array) {

            if (ny + dy[i][1] < 1 || ny + dy[i][1] >=  this.y) { //周りの壁
                continue;
            }

            if (nx + dx[i][1] < 1 || nx + dx[i][1] >=  this.x) { //周りの壁
                continue;
            }

            if (stage[ny + dy[i][1]][nx + dx[i][1]] == 1) { //2ます先
                continue;
            }

            for (int j = 0; j < 2; j++) { //通路を掘る
                stage[ny + dy[i][j]][nx + dx[i][j]] = 1;
            }

            generate_stage(ny + dy[i][1], nx + dx[i][1]); //掘った先のところに移動
        }
    }

    // A*アルゴリズム
    public void a_star(int[] start,int[] end) {
        Node startNode = new Node(null, start[0], start[1]);
        startNode.setG(0);
        startNode.setH(0);
        startNode.setF(0);

        Node endNode = new Node(null, end[1], end[0]);
        endNode.setG(0);
        endNode.setH(0);
        endNode.setF(0);

        // 優先度付きキュー
        // 経路候補の保持
        PriorityQueue<Node> openList = new PriorityQueue<Node>(new Comparator<Node>() {
            @Override
            public int compare(Node n1, Node n2) {
                return Integer.compare(n2.f,n1.f);
            }
        });
        // openList.add(5);        // 要素の追加
        // int highestPriority = openList.poll();// 要素の取得（最も優先度が高い要素を削除して取得）
        // int highestPriority = openList.peek();// 要素の取得（最も優先度が高い要素を削除せず取得）NoRemove
        // boolean containsElement = openList.contains(8);// 要素の存在確認
        // int queueSize = openList.size();// openListの要素の数

        // 重複を許さない
        // 計算済みノード
        HashSet<Node> closedList = new HashSet<Node>();
        // closedList.add("Apple"); //要素の追加
        // closedList.remove("Banana"); //要素の削除
        // boolean containsOrange = closedList.contains("Orange"); //要素の存在確認
        // int setSize = closedList.size(); //要素の数

        openList.add(startNode);
        //Node out = null;
        while(!openList.isEmpty()) {

            Node currentNode = openList.poll();
            closedList.add(currentNode);
            //out = new Node(currentNode.getParent(),currentNode.getX(),currentNode.getY());
            if (currentNode.equals(endNode)) {
                reconstructPath(currentNode);
                return;
            }

            ArrayList<Node> children = new ArrayList<Node>();
            int[][] directions = {{0, -1} , {0, 1} , { - 1, 0} , {1, 0} };

            for (int[] direction : directions) {
                // ノードの位置を計算
                int[] nodePosition = {currentNode.getX() + direction[0], currentNode.getY() + direction[1]};

                // 移動不可能位置またはクローズリストにある場合は無視
                if (stage[nodePosition[1]][nodePosition[0]] != 1 || closedList.contains(new Node(null, nodePosition[0], nodePosition[1]))) {
                    continue;
                }

                Node newNode = new Node(currentNode, nodePosition[0], nodePosition[1]);
                children.add(newNode);
            }

            for (Node child : children) {

                child.setG((int)(Math.pow(child.getX() - this.start[1], 2) + Math.pow(child.getY() - this.start[0], 2)));
                child.setH((int)(Math.pow(this.goal[1] - child.getX(), 2) + Math.pow(this.goal[0] - child.getY(), 2)));
                child.setF(child.getG() + child.getH());

                for (Node openNode : openList) {
                    if (openNode.equals(child) && child.getG() > openNode.getG()) {
                        continue;
                    }
                }
                openList.add(child);
                this.stage_anser[child.getY()][child.getX()] = 4;
            }
        }
        //reconstructPath(out);
        return;
    }

    private void reconstructPath(Node current) {
        while(current != null) {
            stage_anser[current.getY()][current.getX()] = 5; // 最短経路に含まれるノードをマーク
            current = current.getParent();
            this.distance++;
        }

        // 最短経路を含んだ迷路を表示
        stage_anser[this.start[0]][this.start[1]] = 2;
        stage_anser[this.goal[0]][this.goal[1]] = 3;
        for (int i = 0; i < this.y; i++) {
            for (int j = 0; j < this.x; j++) {
                //print(stage_anser[i][j]);
            }
            //println("");
        }

    }

    // ノードクラス（迷路上のセルを表す）
    public class Node {
        private Node parent;
        private int x, y; // representing the position as (x, y)

        private int g; // スタートからの移動コスト値
        private int h; // 仮に見積もったコスト値
        private int f; // 合計コスト

        public Node(Node parent, int x, int y) {
            this.parent = parent;
            this.x = x;
            this.y = y;
            this.g = 0;
            this.h = 0;
            this.f = 0;
        }

        // Getters and setters for the fields
        public Node getParent() {
            return parent;
        }

        public void setParent(Node parent) {
            this.parent = parent;
        }

        public int getX() {
            return x;
        }

        public void setX(int x) {
            this.x = x;
        }

        public int getY() {
            return y;
        }

        public void setY(int y) {
            this.y = y;
        }

        public int getG() {
            return g;
        }

        public void setG(int g) {
            this.g = g;
        }

        public int getH() {
            return h;
        }

        public void setH(int h) {
            this.h = h;
        }

        public int getF() {
            return f;
        }

        public void setF(int f) {
            this.f = f;
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj) return true;
            if (obj == null || getClass() != obj.getClass()) return false;
            Node node = (Node) obj;
            return x == node.x && y == node.y;
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y);
        }
    }

}
