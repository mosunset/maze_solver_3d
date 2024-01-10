public class Userinput{
    private boolean w, a, s, d; // 移動
    private boolean j, l; // 視点左右

    public Userinput() {
        this.w = false;
        this.a = false;
        this.s = false;
        this.d = false;
        this.j = false;
        this.l = false;
    }

    public boolean[] get_key() {
        return new boolean[]{w,a,s,d,j,l};
    }

    public void keyin(int keyCode) {
        switch (keyCode) {
            case 'W':
                this.w = true;
                break;
            case 'A':
                this.a = true;
                break;
            case 'S':
                this.s = true;
                break;
            case 'D':
                this.d = true;
                break;
            case 'J':
                this.j = true;
                break;
            case 'L':
                this.l = true;
                break;
        }
    }

    public void keyrelese(int keyCode) {
        switch (keyCode) {
            case 'W':
                this.w = false;
                break;
            case 'A':
                this.a = false;
                break;
            case 'S':
                this.s = false;
                break;
            case 'D':
                this.d = false;
                break;
            case 'J':
                this.j = false;
                break;
            case 'L':
                this.l = false;
                break;
        }
    }
}
