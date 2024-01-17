// ベクトル

class Vec2 {
    float x, y;

    Vec2(float x, float y) {
        this.x = x;
        this.y = y;
    }

    Vec2 add(Vec2 b) {
        Vec2 a = this;
        return new Vec2(a.x + b.x, a.y + b.y);
    }

    Vec2 sub(Vec2 b) {
        Vec2 a = this;
        return new Vec2(a.x - b.x, a.y - b.y);
    }

    Vec2 copy() {
        return new Vec2(this.x, this.y);
    }

    Vec2 mult(float s) {
        return new Vec2(s * this.x, s * this.y);
    }

    float mag() {
        return sqrt(sq(this.x) + sq(this.y));
    }
}
