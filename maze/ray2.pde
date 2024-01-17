class Ray2 {
  Vec2 pos, way;

  Ray2(){}

  Ray2(Vec2 pos, Vec2 way) {
    this.pos = pos;
    this.way = way;
  }

  Ray2 with2p(Vec2 begin, Vec2 end) {
    return new Ray2(begin, end.sub(begin));
  }

  Vec2 begin() {
    return this.pos;
  }

  Vec2 end() {
    return this.pos.add(this.way);
  }

  Vec2 intersection(Ray2 r2) {
    Ray2 r1 = this;

    if (abs(r1.way.x) < 0.01)
      r1.way.x = 0.01;
    if (abs(r2.way.x) < 0.01)
      r2.way.x = 0.01;

    float t1 = r1.way.y / r1.way.x;
    float t2 = r2.way.y / r2.way.x;
    float x1 = r1.pos.x;
    float x2 = r2.pos.x;
    float y1 = r1.pos.y;
    float y2 = r2.pos.y;
    float sx = (t1 * x1 - t2 * x2 - y1 + y2) / (t1 - t2);
    float sy = t1 * (sx - x1) + y1;

    if (
      sx > min(r1.begin().x, r1.end().x) &&
      sx < max(r1.begin().x, r1.end().x) &&
      sx > min(r2.begin().x, r2.end().x) &&
      sx < max(r2.begin().x, r2.end().x)
    ) {
      return new Vec2(sx, sy);
    } else {
      return null;
    }
  }
  
}
