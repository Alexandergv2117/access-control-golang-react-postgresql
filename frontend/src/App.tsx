import { Avatar } from "@nextui-org/react";

export default function App() {
  return (
    <main className="flex flex-col justify-center items-center w-full h-screen space-y-10">
      <h1 className="text-3xl font-bold">
        Access control with Golang and Reactjs
      </h1>
      <div className="flex gap-3 items-center">
        <Avatar src="https://i.pravatar.cc/150?u=a042581f4e29026024d" />
        <Avatar name="Junior" />
        <Avatar src="https://i.pravatar.cc/150?u=a042581f4e29026704d" />
        <Avatar name="Jane" />
        <Avatar src="https://i.pravatar.cc/150?u=a04258114e29026702d" />
        <Avatar name="Joe" />
      </div>
    </main>
  );
}
