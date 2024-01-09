# A* (A-star)経路探索プログラム
class Node():
    """A node class for A* Pathfinding"""

    def __init__(self, parent=None, position=None):
        self.parent = parent # 親ノードの設定
        self.position = position # (row, column)のタプル ※row：行、column：列

        self.g = 0
        self.h = 0
        self.f = 0

    def __eq__(self, other):
        # node 同士の比較演算子(==)を使用できるように
        return self.position == other.position


def astar(maze, start, end):
    """Returns a list of tuples as a path from the given start to the given end in the given maze"""
    # maze: 迷路リスト、start:スタートポジション、end:ゴールポジション
    # ゴールまでの最短経路のリストを返す関数

    # Create start and end node
    # スタート、エンド（ゴール）ノードの初期化
    start_node = Node(None, start) # 親ノードは無し
    start_node.g = start_node.h = start_node.f = 0
    end_node = Node(None, end)
    end_node.g = end_node.h = end_node.f = 0

    # Initialize both open and closed list
    open_list = [] # 経路候補を入れとくリスト
    closed_list = [] # 計算終わった用済みリスト
    # Add the start node
    # 経路候補にスタートノードを追加して計算スタート
    open_list.append(start_node)

    # Loop until you find the end
    while len(open_list) > 0:

        # Get the current node
        current_node = open_list[0]
        current_index = 0
        for index, item in enumerate(open_list):
            # オープンリストの中でF値が一番小さいノードを選ぶ
            if item.f < current_node.f:
                current_node = item
                current_index = index

        # Pop current off open list, add to closed list
        # 一番小さいF値のノードをオープンリストから削除して、クローズリストに追加
        open_list.pop(current_index)
        closed_list.append(current_node)

        # Found the goal
        # ゴールに到達してれば経路(Path)を表示して終了
        if current_node == end_node:
            path = []
            current = current_node
            while current is not None:
                path.append(current.position)
                current = current.parent
            return path[::-1] # Return reversed path

        # Generate children
        # ゴールに到達してなければ子ノードを生成
        children = []
        # for new_position in [(0, -1), (0, 1), (-1, 0), (1, 0), (-1, -1), (-1, 1), (1, -1), (1, 1)]: # 斜め移動ありの場合
        for new_position in [(0, -1), (0, 1), (-1, 0), (1, 0)]: # 上下左右移動のみ (Adjacent squares


            # Get node position
            node_position = (current_node.position[0] + new_position[0], current_node.position[1] + new_position[1])

            # Make sure within range
            # 迷路内の移動に限る
            if node_position[0] > (len(maze) - 1) or node_position[0] < 0 or node_position[1] > (len(maze[len(maze)-1]) -1) or node_position[1] < 0:
                continue

            # Make sure walkable terrain
            # 移動できる位置に限る（障害物は移動できない）
            if maze[node_position[0]][node_position[1]] != 0:
                continue

            # Create new node
            # 移動できる位置のノードのみを生成
            new_node = Node(current_node, node_position)

            # Append
            # 子リストに追加
            children.append(new_node)

        # Loop through children
        # 各子ノードでG, H, Fを計算
        for child in children:

            # Child is on the closed list
            if len([closed_child for closed_child in closed_list if closed_child == child]) > 0:
                continue

            # Create the f, g, and h values
            # G は親ノード + 1
            child.g = current_node.g + 1
            # H は （現在位置 - エンド位置)の2乗
            child.h = ((child.position[0] - end_node.position[0]) ** 2) + ((child.position[1] - end_node.position[1]) ** 2)
            # F = G + H
            child.f = child.g + child.h

            # Child is already in the open list
            if len([open_node for open_node in open_list if child.position == open_node.position and child.g > open_node.g]) > 0:
                continue

            # Add the child to the open list
            # 子ノードをオープンリストに追加
            open_list.append(child)

def example():

    maze = [[0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0],
            [0, 0, 0, 1, 0],
            [0, 1, 0, 1, 0],
            [0, 0, 1, 1, 0]]

    start = (2, 2)
    end = (4, 4)

    path = astar(maze, start, end)
    print(path)

if __name__ == '__main__':
    example()

# A*で見つけたパス
# [(0, 0), (0, 1), (0, 2), (1, 2), (2, 2), (2, 3), (2, 4), (3, 4), (4, 4)]


#　[(2, 2), (1, 2), (0, 2), (0, 3), (0, 4), (1, 4), (2, 4), (3, 4), (4, 4)]