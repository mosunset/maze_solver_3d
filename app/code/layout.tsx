import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Code | Maze Solver 3D - 1260277",
};

export default function AboutLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <>{children}</>;
}
